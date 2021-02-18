package ee.net.nurmoja.multidimension.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class BlogPost {

    @GeneratedValue
    @Id
    private Long id;
    private String title;
    private String text;
    private LocalDateTime createdAt;
    private String author;
    @OneToMany(mappedBy = "blogPost")
    private List<BlogPostSubPart> blogPostSubParts;

    public BlogPost() {
    }

    public Long getId() {
        return this.id;
    }

    public String getTitle() {
        return this.title;
    }

    public String getText() {
        return this.text;
    }

    public LocalDateTime getCreatedAt() {
        return this.createdAt;
    }

    public String getAuthor() {
        return this.author;
    }

    public List<BlogPostSubPart> getBlogPostSubParts() {
        return this.blogPostSubParts;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setBlogPostSubParts(List<BlogPostSubPart> blogPostSubParts) {
        this.blogPostSubParts = blogPostSubParts;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof BlogPost)) return false;
        final BlogPost other = (BlogPost) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$text = this.getText();
        final Object other$text = other.getText();
        if (this$text == null ? other$text != null : !this$text.equals(other$text)) return false;
        final Object this$createdAt = this.getCreatedAt();
        final Object other$createdAt = other.getCreatedAt();
        if (this$createdAt == null ? other$createdAt != null : !this$createdAt.equals(other$createdAt)) return false;
        final Object this$author = this.getAuthor();
        final Object other$author = other.getAuthor();
        if (this$author == null ? other$author != null : !this$author.equals(other$author)) return false;
        final Object this$blogPostSubParts = this.getBlogPostSubParts();
        final Object other$blogPostSubParts = other.getBlogPostSubParts();
        if (this$blogPostSubParts == null ? other$blogPostSubParts != null : !this$blogPostSubParts.equals(other$blogPostSubParts))
            return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof BlogPost;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $text = this.getText();
        result = result * PRIME + ($text == null ? 43 : $text.hashCode());
        final Object $createdAt = this.getCreatedAt();
        result = result * PRIME + ($createdAt == null ? 43 : $createdAt.hashCode());
        final Object $author = this.getAuthor();
        result = result * PRIME + ($author == null ? 43 : $author.hashCode());
        final Object $blogPostSubParts = this.getBlogPostSubParts();
        result = result * PRIME + ($blogPostSubParts == null ? 43 : $blogPostSubParts.hashCode());
        return result;
    }

    public String toString() {
        return "BlogPost(id=" + this.getId() + ", title=" + this.getTitle() + ", text=" + this.getText() + ", createdAt=" + this.getCreatedAt() + ", author=" + this.getAuthor() + ", blogPostSubParts=" + this.getBlogPostSubParts().toString() + ")";
    }
}
