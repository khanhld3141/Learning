package model;

public class LessionComment {

    private int Id,LessionId,AuthorId,ParentId;
    private String Content;

    public LessionComment() {
    }

    public LessionComment(int lessionId, int authorId, int parentId, String content) {
        LessionId = lessionId;
        AuthorId = authorId;
        ParentId = parentId;
        Content = content;
    }

    public LessionComment(int id, int lessionId, int authorId, int parentId, String content) {
        Id = id;
        LessionId = lessionId;
        AuthorId = authorId;
        ParentId = parentId;
        Content = content;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getLessionId() {
        return LessionId;
    }

    public void setLessionId(int lessionId) {
        LessionId = lessionId;
    }

    public int getAuthorId() {
        return AuthorId;
    }

    public void setAuthorId(int authorId) {
        AuthorId = authorId;
    }

    public int getParentId() {
        return ParentId;
    }

    public void setParentId(int parentId) {
        ParentId = parentId;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}
