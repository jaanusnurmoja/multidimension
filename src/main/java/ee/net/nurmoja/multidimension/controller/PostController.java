package ee.net.nurmoja.multidimension.controller;

import ee.net.nurmoja.multidimension.model.BlogPost;
import ee.net.nurmoja.multidimension.repository.BlogPostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/blog/posts")
public class PostController {

    final private BlogPostRepository service;

    //Get Only all posts
    @GetMapping("/all")
    ModelAndView getAllPosts(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("posts");
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
        service.save(blogPost);
        return new RedirectView("/posts/all");
    }



}
