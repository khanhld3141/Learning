package model;

public class UserCourse {
    private int Id;
    private User user;
    private  Course course;

    public UserCourse() {
    }

    public UserCourse(int id, User user, Course course) {
        Id = id;
       this.user = user;
       this.course = course;
    }

    public UserCourse( User user, Course course) {
        this.user = user;
        this.course = course;
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
