package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.BlogPost;
import ee.net.nurmoja.multidimension.model.BlogPostParagraph;
import ee.net.nurmoja.multidimension.model.BlogPostSubPart;
import ee.net.nurmoja.multidimension.repository.BlogPostParagraphRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostRepository;
import ee.net.nurmoja.multidimension.repository.BlogPostSubPartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.net.URL;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("")
public class BlogFormController {

    private static final String DEFAULT = "DEFAULT";
    final private BlogPostRepository blogPostRepository;
    final private BlogPostSubPartRepository subPartRepository;
    final private BlogPostParagraphRepository paragraphRepository;

    @PostMapping("/data/api/blogPosts/add")
    String create(@RequestBody(required = false) BlogPost blogPost) {
        BlogPost savedBlogPost = blogPostRepository.save(blogPost);

        if (blogPost.getBlogPostSubParts() != null) {
            int x = 0;
            for (BlogPostSubPart subPart : blogPost.getBlogPostSubParts()) {
                subPart.setBlogPost(savedBlogPost);
                subPart.setPrivateSysTitle(subPart.getPrivateSysTitle() + ": " + blogPost.getTitle().trim());
                subPart.setOrdering(x);
                BlogPostSubPart savedSubPart = subPartRepository.save(subPart);

                if (subPart.getBlogPostParagraphs() != null) {
                    int i = 0;
                    for (BlogPostParagraph paragraph : subPart.getBlogPostParagraphs()) {
                        paragraph.setBlogPostSubPart(savedSubPart);
                        paragraph.setBlogPostId(savedBlogPost.getId());
                        paragraph.setOrdering(i);
                        i++;
                        paragraphRepository.save(paragraph);
                    }
                }
                x++;
            }
        }
        return savedBlogPost.getId().toString();
        //return new RedirectView("/multidimension/blog/" + savedBlogPost.getId());
    }
    @GetMapping("/data/api/blogPosts/{id}")
    Optional<BlogPost> viewOne(@RequestBody(required = false) BlogPost blogPost, @PathVariable("id") Long id) {
        Optional<BlogPost> blogPostGet = blogPostRepository.getByIdOrderByBlogPostSubPartsOrdering(id);
        blogPostGet.get().setBlogPostSubParts((subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(id)));
        blogPostGet.get().getBlogPostSubParts().forEach(subPart -> {
            subPart.setBlogPostParagraphs(paragraphRepository.getAllByBlogPostSubPartIdOrderByOrdering(subPart.getId()));
        });
        return blogPostGet;
    }

    @RequestMapping(value = "/data/api/blogPosts/{id}", method = {
            RequestMethod.PUT,
            RequestMethod.PATCH
    })
    String edit(@RequestBody(required = false) BlogPost blogPost, @PathVariable("id") Long id) {
        BlogPost editedBlogPost = blogPostRepository.save(blogPost);
        if (blogPost.getBlogPostSubParts() != null) {
            int i = 0;
            for (BlogPostSubPart subPart : blogPost.getBlogPostSubParts()) {
                subPart.setBlogPost(blogPost);
                subPart.setPrivateSysTitle("from: " + blogPost.getTitle().trim());
                subPart.setOrdering(i);
/*
                if (!subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(id).contains(subPart)
                || subPartRepository.findAllByBlogPostIdOrderByOrderingAsc(id).isEmpty()) {
                    subPart = subPartRepository.save(subPart);
                }
*/
                subPart = subPartRepository.save(subPart);

                if (subPart.getBlogPostParagraphs() != null) {
                    int x = 0;
                    for (BlogPostParagraph paragraph : subPart.getBlogPostParagraphs()) {
                        paragraph.setBlogPostSubPart(subPart);
                        paragraph.setBlogPostId(id);
                        paragraph.setOrdering(x);
/*
                        if (!paragraphRepository.getAllByBlogPostSubPartIdOrderByOrdering(subPart.getId())
                        .contains(paragraph) ||
                                paragraphRepository.getAllByBlogPostSubPartIdOrderByOrdering(subPart.getId()).isEmpty()) {
                            paragraphRepository.save(paragraph);
                        }
*/
                        paragraphRepository.save(paragraph);
                        x++;
                    }
                }
                i++;
            }
        }
        return editedBlogPost.getId().toString();
    }


}
