package model;

public class CourseComment {

    private int Id,CourseId,AuthorId;
    private String Content;

    public CourseComment() {
    }

    public CourseComment(int id, int courseId, int authorId, String content) {
        Id = id;
        CourseId = courseId;
        AuthorId = authorId;
        Content = content;
    }

    public CourseComment(int courseId, int authorId, String content) {
        CourseId = courseId;
        AuthorId = authorId;
        Content = content;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int courseId) {
        CourseId = courseId;
    }

    public int getAuthorId() {
        return AuthorId;
    }

    public void setAuthorId(int authorId) {
        AuthorId = authorId;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}
