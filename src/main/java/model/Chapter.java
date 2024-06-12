package model;

import java.util.ArrayList;
import java.util.List;

public class Chapter {

    private int Id,CourseId;
    private String Name;

    private  List<Lession> lessions;
    public Chapter() {
    }

    public Chapter(int courseId, String name) {
        CourseId = courseId;
        Name = name;
        lessions=new ArrayList<>();
    }

    public Chapter(int id, int courseId, String name) {
        Id = id;
        CourseId = courseId;
        Name = name;
        lessions=new ArrayList<>();
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

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public List<Lession> getLessions() {
        return lessions;
    }

    public void setLessions(List<Lession> lessions) {
        this.lessions = lessions;
    }
}
