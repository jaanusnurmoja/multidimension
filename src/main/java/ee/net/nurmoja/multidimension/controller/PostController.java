package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.BlogPost;
import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import ee.net.nurmoja.multidimension.repository.BlogPostParagraphRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostSubPartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.NotNull;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("")
public class PostController {

    final private BlogPostRepository service;
    final private BlogPostParagraphRepository paragraphRepository;
    final private BlogPostSubPartRepository subPartRepository;

    //Get Only all posts
    @GetMapping("/blog")
    ModelAndView getAllPosts(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("blog");
        modelAndView.addObject("title", "All Posts: ");
        List<BlogPost> posts = service.findAll(Sort.by(Sort.Direction.DESC, "createdAt"));
        modelAndView.addObject("posts", posts);
        return modelAndView;
    }

    //Get Only one post
    @GetMapping("/blog/{id}")
    ModelAndView getPost(@PathVariable("id") Long postId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("post");
        BlogPost post = service.getOne(postId);
        modelAndView.addObject("title", "Post: " + post.getTitle());
        subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(post.getId()).forEach(subPart -> {
            subPart.setBlogPostParagraphs(paragraphRepository.getAllByBlogPostSubPartIdOrderByOrdering(subPart.getId()));
        });
        post.setBlogPostSubParts(subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(post.getId()));
        modelAndView.addObject("post", post);
        return modelAndView;
    }


    @GetMapping("/blog/add")
    String createPost(Model model){
        model.addAttribute("blogPost", new BlogPost());
        return "createpost";
    }

    @GetMapping("/blog/{id}/edit")
    String editPostGet(@NotNull Model model, @PathVariable("id") Long id){
        BlogPost editableBlogpost = service.getOne(id);
        for (BlogPostSubPart subPart : subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(editableBlogpost.getId())) {
            subPart.setBlogPostParagraphs(paragraphRepository.getAllByBlogPostSubPartIdOrderByOrdering(subPart.getId()));
        }
        editableBlogpost.setBlogPostSubParts(subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(editableBlogpost.getId()));
        model.addAttribute("subPartCount", editableBlogpost.getBlogPostSubParts().size() == 0 ? 1 : editableBlogpost.getBlogPostSubParts().size());

        model.addAttribute("blogPost", editableBlogpost);
    return "editpost";
    }


/*
    @PostMapping("/blog/create")
    RedirectView create(@RequestBody BlogPost blogPost){
        BlogPost savedBlogPost = service.save(blogPost);

        if (blogPost.getBlogPostSubParts() != null)
        {
            for (BlogPostSubPart subPart : blogPost.getBlogPostSubParts()) {
                subPart.setBlogPost(savedBlogPost);
                BlogPostSubPart savedSubPart = subPartRepository.save(subPart);

                if (subPart.getBlogPostParagraphs() != null) {
                    subPart.getBlogPostParagraphs().forEach(paragraph -> {
                        paragraph.setBlogPostSubPart(savedSubPart);
                        paragraph.setBlogPost(savedBlogPost);
                        BlogPostParagraph savedParagraphAtSubpart = paragraphRepository.save(paragraph);
                        savedSubPart.getBlogPostParagraphs().add(savedParagraphAtSubpart);
                    });
                }
            }
        }
        return new RedirectView("/multidimension/blog/" + savedBlogPost.getId());
    }
*/

}
