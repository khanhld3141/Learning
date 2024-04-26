package model;

public class UserCourse {
    private int Id,UserId,CourseId;
    private User user;
    private  Course course;

    public UserCourse() {
    }

    public UserCourse(int userId, int courseId) {
        UserId = userId;
        CourseId = courseId;
    }

    public UserCourse(int id, int userId, int courseId) {
        Id = id;
        UserId = userId;
        CourseId = courseId;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

}
