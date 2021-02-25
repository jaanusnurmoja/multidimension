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

    private static final String DEFAULT = "DEFAULT";
    final private BlogPostRepository blogPostRepository;
    final private BlogPostSubPartRepository subPartRepository;
    final private BlogPostParagraphRepository paragraphRepository;

    @PostMapping("/data/api/blogPosts/add")
    String create(@RequestBody(required = false) BlogPost blogPost){
        BlogPost savedBlogPost = blogPostRepository.save(blogPost);

        if (blogPost.getBlogPostSubParts() != null)
        {
            int x = 1;
            for (BlogPostSubPart subPart : blogPost.getBlogPostSubParts()) {
                subPart.setBlogPost(savedBlogPost);
                subPart.setPrivateSysTitle(subPart.getPrivateSysTitle() + ": " + blogPost.getTitle().trim());
                subPart.setOrdering(x);
                BlogPostSubPart savedSubPart = subPartRepository.save(subPart);

                if (subPart.getBlogPostParagraphs() != null) {
                    int i = 1;
                    for (BlogPostParagraph paragraph : subPart.getBlogPostParagraphs()) {
                        paragraph.setBlogPostSubPart(savedSubPart);
                        paragraph.setBlogPostId(savedBlogPost.getId());
                        paragraph.setOrdering(i);
                        i++;
                        paragraphRepository.save(paragraph);
                    };
                }
                x++;
            }
        }
        return savedBlogPost.getId().toString();
        //return new RedirectView("/multidimension/blog/" + savedBlogPost.getId());
    }


    @RequestMapping(
            value = "/data/api/blogPosts/{id}",
            method = RequestMethod.PUT)
    String edit(@RequestBody(required = false) BlogPost blogPost, @PathVariable("id") Long id){
        BlogPost editedBlogPost = blogPostRepository.save(blogPost);
        return editedBlogPost.getId().toString();
    }



}
