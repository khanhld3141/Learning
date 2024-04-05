package model;

public class UserCourse {
    private int Id,UserId,CourseId;

    public UserCourse() {
    }

    public UserCourse(int id, int userId, int courseId) {
        Id = id;
        UserId = userId;
        CourseId = courseId;
    }

    public UserCourse(int userId, int courseId) {
        UserId = userId;
        CourseId = courseId;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int courseId) {
        CourseId = courseId;
    }
}
