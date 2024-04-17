package model;

import java.util.ArrayList;
import java.util.List;

public class Chapter {

    private int Id,CourseId;
    private String Name,Ordinal;

    private  List<Lession> lessions;
    public Chapter() {
    }

    public Chapter(int courseId, String name, String ordinal) {
        CourseId = courseId;
        Name = name;
        Ordinal = ordinal;
        lessions=new ArrayList<>();
    }

    public Chapter(int id, int courseId, String name, String ordinal) {
        Id = id;
        CourseId = courseId;
        Name = name;
        Ordinal = ordinal;
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

    public String getOrdinal() {
        return Ordinal;
    }

    public void setOrdinal(String ordinal) {
        Ordinal = ordinal;
    }

    public List<Lession> getLessions() {
        return lessions;
    }

    public void setLessions(List<Lession> lessions) {
        this.lessions = lessions;
    }
}
