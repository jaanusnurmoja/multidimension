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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequiredArgsConstructor
@RequestMapping("")
public class BlogFormController {

    final private BlogPostRepository blogPostRepository;
    final private BlogPostSubPartRepository subPartRepository;
    final private BlogPostParagraphRepository paragraphRepository;

    @PostMapping("/data/api/blogPosts/add")
    String create(@RequestBody(required = false) BlogPost blogPost){
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
        return savedBlogPost.getId().toString();
        //return new RedirectView("/multidimension/blog/" + savedBlogPost.getId());
    }
}
