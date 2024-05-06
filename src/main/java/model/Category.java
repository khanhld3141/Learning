package model;

public class Category {
    private int Id;
    private String Name,Image;
    int totalCourse;
    public Category() {
    }

    public Category(String name,String image) {
        Name = name;
        Image = image;
    }

    public Category(int id, String name,String image) {
        Id = id;
        Name = name;
        Image = image;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        this.Image = image;
    }

    public int getTotalCourse() {
        return totalCourse;
    }

    public void setTotalCourse(int totalCourse) {
        this.totalCourse = totalCourse;
    }
}
