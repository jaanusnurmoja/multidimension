package ee.net.nurmoja.multidimension.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "blog_post_paragraph")
public class BlogPostParagraph implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "order_by")
    private Integer orderBy;

    @Column(name = "text")
    private String text;

    @ManyToOne
    @JoinColumn(name = "blog_post_sub_part_id")
    private BlogPostSubPart blogPostSubPart;

    @ManyToOne
    @JoinColumn(name = "blog_post_id")
    private BlogPost blogPost;

    public BlogPostParagraph() {
    }

    public Long getId() {
        return this.id;
    }

    public Integer getOrderBy() {
        return this.orderBy;
    }

    public String getText() {
        return this.text;
    }

    public BlogPostSubPart getBlogPostSubPart() {
        return this.blogPostSubPart;
    }

    public BlogPost getBlogPost() {
        return this.blogPost;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setOrderBy(Integer orderBy) {
        this.orderBy = orderBy;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setBlogPostSubPart(BlogPostSubPart blogPostSubPart) {
        this.blogPostSubPart = blogPostSubPart;
    }

    public void setBlogPost(BlogPost blogPost) {
        this.blogPost = blogPost;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof BlogPostParagraph)) return false;
        final BlogPostParagraph other = (BlogPostParagraph) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$orderBy = this.getOrderBy();
        final Object other$orderBy = other.getOrderBy();
        if (this$orderBy == null ? other$orderBy != null : !this$orderBy.equals(other$orderBy)) return false;
        final Object this$text = this.getText();
        final Object other$text = other.getText();
        if (this$text == null ? other$text != null : !this$text.equals(other$text)) return false;
        final Object this$blogPostSubPart = this.getBlogPostSubPart();
        final Object other$blogPostSubPart = other.getBlogPostSubPart();
        if (this$blogPostSubPart == null ? other$blogPostSubPart != null : !this$blogPostSubPart.equals(other$blogPostSubPart))
            return false;
        final Object this$blogPost = this.getBlogPost();
        final Object other$blogPost = other.getBlogPost();
        if (this$blogPost == null ? other$blogPost != null : !this$blogPost.equals(other$blogPost)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof BlogPostParagraph;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $orderBy = this.getOrderBy();
        result = result * PRIME + ($orderBy == null ? 43 : $orderBy.hashCode());
        final Object $text = this.getText();
        result = result * PRIME + ($text == null ? 43 : $text.hashCode());
        final Object $blogPostSubPart = this.getBlogPostSubPart();
        result = result * PRIME + ($blogPostSubPart == null ? 43 : $blogPostSubPart.hashCode());
        final Object $blogPost = this.getBlogPost();
        result = result * PRIME + ($blogPost == null ? 43 : $blogPost.hashCode());
        return result;
    }

    public String toString() {
        return "BlogPostParagraph(id=" + this.getId() + ", orderBy=" + this.getOrderBy() + ", text=" + this.getText() + ", blogPostSubPart=" + this.getBlogPostSubPart() + ", blogPost=" + this.getBlogPost() + ")";
    }
}
