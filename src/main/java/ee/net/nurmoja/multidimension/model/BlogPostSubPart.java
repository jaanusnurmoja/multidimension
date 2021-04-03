package ee.net.nurmoja.multidimension.model;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "blog_post_sub_part")
public class BlogPostSubPart implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",unique=true, nullable = false)
    private Long id;

    @Column(name = "sub_title")
    private String subTitle;

    @Column(name = "private_sys_title", columnDefinition = "varchar(255) default 'Artiklist'")
    private String privateSysTitle;

    @Column(name = "image")
    private String image;

    @Column(name = "description")
    private String description;

    @Column(name = "ordering")
    private Integer ordering;

    @JsonBackReference
    @ManyToOne
    @JoinColumn (name = "blog_post_id")
    private BlogPost blogPost;

    @OneToMany(mappedBy = "blogPostSubPart")
    private List<BlogPostParagraph> blogPostParagraphs;

    public BlogPostSubPart() {
    }

    public void setPrivateSysTitle() {
        this.privateSysTitle = "Artiklist";
    }

    public BlogPostParagraph addBlogPostParagraph(BlogPostParagraph blogPostParagraph) {
        getBlogPostParagraphs().add(blogPostParagraph);
        blogPostParagraph.setBlogPostSubPart(this);

        return blogPostParagraph;
    }

    public BlogPostParagraph removeBlogPostParagraph(BlogPostParagraph blogPostParagraph) {
        getBlogPostParagraphs().remove(blogPostParagraph);
        blogPostParagraph.setBlogPostSubPart(null);

        return blogPostParagraph;
    }

    public Long getId() {
        return this.id;
    }

    public String getSubTitle() {
        return this.subTitle;
    }

    public String getPrivateSysTitle() {
        return this.privateSysTitle;
    }

    public String getImage() {
        return this.image;
    }

    public String getDescription() {
        return this.description;
    }

    public Integer getOrdering() {
        return this.ordering;
    }

    public BlogPost getBlogPost() {
        return this.blogPost;
    }

    public List<BlogPostParagraph> getBlogPostParagraphs() {
        return this.blogPostParagraphs;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public void setPrivateSysTitle(String privateSysTitle) {
        this.privateSysTitle = privateSysTitle;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setOrdering(Integer ordering) {
        this.ordering = ordering;
    }

    public void setBlogPost(BlogPost blogPost) {
        this.blogPost = blogPost;
    }

    public void setBlogPostParagraphs(List<BlogPostParagraph> blogPostParagraphs) {
        this.blogPostParagraphs = blogPostParagraphs;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof BlogPostSubPart)) return false;
        final BlogPostSubPart other = (BlogPostSubPart) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$subTitle = this.getSubTitle();
        final Object other$subTitle = other.getSubTitle();
        if (this$subTitle == null ? other$subTitle != null : !this$subTitle.equals(other$subTitle)) return false;
        final Object this$privateSysTitle = this.getPrivateSysTitle();
        final Object other$privateSysTitle = other.getPrivateSysTitle();
        if (this$privateSysTitle == null ? other$privateSysTitle != null : !this$privateSysTitle.equals(other$privateSysTitle))
            return false;
        final Object this$image = this.getImage();
        final Object other$image = other.getImage();
        if (this$image == null ? other$image != null : !this$image.equals(other$image)) return false;
        final Object this$description = this.getDescription();
        final Object other$description = other.getDescription();
        if (this$description == null ? other$description != null : !this$description.equals(other$description))
            return false;
        final Object this$ordering = this.getOrdering();
        final Object other$ordering = other.getOrdering();
        if (this$ordering == null ? other$ordering != null : !this$ordering.equals(other$ordering)) return false;
        final Object this$blogPost = this.getBlogPost();
        final Object other$blogPost = other.getBlogPost();
        if (this$blogPost == null ? other$blogPost != null : !this$blogPost.equals(other$blogPost)) return false;
/*
        final Object this$blogPostParagraphs = this.getBlogPostParagraphs();
        final Object other$blogPostParagraphs = other.getBlogPostParagraphs();
        if (this$blogPostParagraphs == null ? other$blogPostParagraphs != null : !this$blogPostParagraphs.equals(other$blogPostParagraphs))
            return false;
*/
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof BlogPostSubPart;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $subTitle = this.getSubTitle();
        result = result * PRIME + ($subTitle == null ? 43 : $subTitle.hashCode());
        final Object $privateSysTitle = this.getPrivateSysTitle();
        result = result * PRIME + ($privateSysTitle == null ? 43 : $privateSysTitle.hashCode());
        final Object $image = this.getImage();
        result = result * PRIME + ($image == null ? 43 : $image.hashCode());
        final Object $description = this.getDescription();
        result = result * PRIME + ($description == null ? 43 : $description.hashCode());
        final Object $ordering = this.getOrdering();
        result = result * PRIME + ($ordering == null ? 43 : $ordering.hashCode());
        final Object $blogPost = this.getBlogPost();
        result = result * PRIME + ($blogPost == null ? 43 : $blogPost.hashCode());
/*
        final Object $blogPostParagraphs = this.getBlogPostParagraphs();
        result = result * PRIME + ($blogPostParagraphs == null ? 43 : $blogPostParagraphs.hashCode());
*/
        return result;
    }

    public String toString() {
        return "BlogPostSubPart(id=" + this.getId() + ", subTitle=" + this.getSubTitle() + ", privateSysTitle=" + this.getPrivateSysTitle() + ", image=" + this.getImage() + ", description=" + this.getDescription() + ", ordering=" + this.getOrdering() + ", blogPost=" + this.getBlogPost() + ", blogPostParagraphs=" + this.getBlogPostParagraphs().size() + ")";
    }
}
