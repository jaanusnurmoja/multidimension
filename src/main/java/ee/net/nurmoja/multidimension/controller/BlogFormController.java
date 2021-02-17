package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.BlogPost;
import ee.net.nurmoja.multidimension.model.BlogPostParagraph;
import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import ee.net.nurmoja.multidimension.repository.BlogPostParagraphRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostSubPartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequiredArgsConstructor
@RequestMapping("")
public class BlogFormController {

    final private BlogPostRepository blogPostRepository;
    final private BlogPostSubPartRepository subPartRepository;
    final private BlogPostParagraphRepository paragraphRepository;

    @GetMapping("/blog/add")
    String createPost(Model model){
        model.addAttribute("blogPost", new BlogPost());
        return "submitpost";
    }

    @PostMapping("/data/api/blogPosts/add")
    RedirectView create(@RequestBody BlogPost blogPost){
        BlogPost savedBlogPost = blogPostRepository.save(blogPost);

        if (blogPost.getBlogPostSubParts() != null)
        {
            Long i = 1L;
            for (BlogPostSubPart subPart : blogPost.getBlogPostSubParts()) {
                subPart.setBlogPost(savedBlogPost);
                subPart.setOrderBy(i);
                BlogPostSubPart savedSubPart = subPartRepository.save(subPart);

                int n = 1;

                if (subPart.getBlogPostParagraphs() != null) {
                    for (BlogPostParagraph paragraph : subPart.getBlogPostParagraphs()) {
                        paragraph.setBlogPostSubPart(savedSubPart);
                        paragraph.setBlogPost(savedBlogPost);
                        paragraph.setOrderBy(n);
                        BlogPostParagraph savedParagraphAtSubpart = paragraphRepository.save(paragraph);
                        savedSubPart.getBlogPostParagraphs().add(savedParagraphAtSubpart);
                        n++;
                    };
                }

                i++;
            }
        }
        return new RedirectView("/multidimension/blog/" + savedBlogPost.getId());
    }
}
