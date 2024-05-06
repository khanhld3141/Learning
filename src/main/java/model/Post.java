package model;

import java.util.Date;
import java.util.List;

public class Post {
    private String Title,Content,Comment,Image;
    private int Id,AuthorId;
    private User author;
    private List<PostComment> comments;
    private Date createdAt;
    public Post() {
    }

    public Post(String title, String content, String comment,String image, int id, int authorId) {
        Title = title;
        Content = content;
        Comment = comment;
        Id = id;
        AuthorId = authorId;
        Image = image;
    }

    public Post(String title, String content, String comment,String image, int authorId) {
        Title = title;
        Content = content;
        Comment = comment;
        AuthorId = authorId;
        Image = image;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getAuthorId() {
        return AuthorId;
    }

    public void setAuthorId(int authorId) {
        AuthorId = authorId;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public List<PostComment> getComments() {
        return comments;
    }

    public void setComments(List<PostComment> comments) {
        this.comments = comments;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
