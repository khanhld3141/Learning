package model;

public class Post {
    private String Title,Content,Comment;
    private int Id,AuthorId;

    public Post() {
    }

    public Post(String title, String content, String comment, int id, int authorId) {
        Title = title;
        Content = content;
        Comment = comment;
        Id = id;
        AuthorId = authorId;
    }

    public Post(String title, String content, String comment, int authorId) {
        Title = title;
        Content = content;
        Comment = comment;
        AuthorId = authorId;
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
}
