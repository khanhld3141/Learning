package model;

public class PostComment {

    private String Content;
    private int Id,AuthorId,PostId,IdParent;
    private User author;
    public PostComment() {
    }

    public PostComment( int id, int authorId, int postId,int idParent,String content) {
        Content = content;
        Id = id;
        AuthorId = authorId;
        PostId = postId;
        IdParent=idParent;
    }

    public PostComment(int authorId, int postId,int idParent,String content) {
        Content = content;
        AuthorId = authorId;
        PostId = postId;
        IdParent=idParent;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
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

    public int getPostId() {
        return PostId;
    }

    public void setPostId(int postId) {
        PostId = postId;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public int getIdParent() {
        return IdParent;
    }

    public void setIdParent(int idParent) {
        IdParent = idParent;
    }
}
