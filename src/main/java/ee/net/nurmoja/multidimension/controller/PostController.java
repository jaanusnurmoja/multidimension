package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.BlogContentOrderBy;
import ee.net.nurmoja.multidimension.model.BlogPost;
import ee.net.nurmoja.multidimension.model.BlogPostParagraph;
import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import ee.net.nurmoja.multidimension.repository.BlogContentOrderByRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostParagraphRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostSubPartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/blog")
public class PostController {

    final private BlogPostRepository service;
    final private BlogContentOrderByRepository contentOrderByRepository;
    final private BlogPostParagraphRepository paragraphRepository;
    final private BlogPostSubPartRepository subPartRepository;

    //Get Only all posts
    @GetMapping("")
    ModelAndView getAllPosts(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("blog");
        modelAndView.addObject("title", "All Posts: ");
        List<BlogPost> posts = service.findAll();
        modelAndView.addObject("posts", posts);
        return modelAndView;
    }

    //Get Only one post
    @GetMapping("/{id}")
    ModelAndView getPost(@PathVariable("id") Long postId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("post");
        modelAndView.addObject("title", "Posts: ");
        BlogPost post = service.getOne(postId);
        modelAndView.addObject("post", post);
        return modelAndView;
    }

    @GetMapping("/create")
    String createPost(Model model){
        model.addAttribute("blogPost", new BlogPost());
        return "createpost";
    }

    @PostMapping("/create")
    RedirectView create(@ModelAttribute BlogPost blogPost){
        BlogPost savedBlogPost = service.save(blogPost);

        if (blogPost.getBlogContentOrderByList() != null)
        {
            blogPost.getBlogContentOrderByList().forEach(content -> {
                content.setBlogPost(savedBlogPost);
                BlogContentOrderBy savedContent = contentOrderByRepository.save(content);

                if (content.getBlogPostParagraph() != null) {
                    content.getBlogPostParagraph().setBlogContentOrderBy(savedContent);
                    content.getBlogPostParagraph().setBlogPost(savedContent.getBlogPost());
                    BlogPostParagraph savedParagraph = paragraphRepository.save(content.getBlogPostParagraph());
                } else {

                    if (content.getBlogPostSubPart() != null) {
                        content.getBlogPostSubPart().setBlogContentOrderBy(savedContent);
                        content.getBlogPostSubPart().setBlogPost(savedContent.getBlogPost());
                        BlogPostSubPart savedSubPart = subPartRepository.save(content.getBlogPostSubPart());

                        if (content.getBlogPostSubPart().getBlogPostParagraphs() != null) {
                            content.getBlogPostSubPart().getBlogPostParagraphs().forEach(paragraph -> {
                                paragraph.setBlogPostSubPart(savedSubPart);
                                paragraph.setBlogPost(savedBlogPost);
                                BlogPostParagraph savedParagraphAtSubpart = paragraphRepository.save(paragraph);
                                savedSubPart.getBlogPostParagraphs().add(savedParagraphAtSubpart);
                            });
                        }
                    }
                }

            });
        }
        return new RedirectView("/" + savedBlogPost.getId());
    }

}
