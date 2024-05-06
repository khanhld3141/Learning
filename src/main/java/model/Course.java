package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class Course {
    private int Id,TeacherId,Price,CateId;
    private String Name,Introduce,Image,Overview,Result;
    private List<Chapter> chapters;
    private Category Category;
    private User Teacher;
    private List<User> students;
    private Date CreatedAt;
    public Course() {
        Category=new Category();
        Teacher = new User();
        students=new ArrayList<User>();
    }

    public Course(int id, int teacherId, int price, int cateId, String name, String introduce, String image, String overview, String result) {
        Id = id;
        TeacherId = teacherId;
        Price = price;
        CateId = cateId;
        Name = name;
        Introduce = introduce;
        Image = image;
        Overview = overview;
        Result = result;
        chapters=new ArrayList<>();
        Category=new Category();
        Teacher = new User();
        students=new ArrayList<User>();
        CreatedAt=new Date();
    }

    public Course(int teacherId, int price, int cateId, String name, String introduce, String image, String overview, String result) {
        TeacherId = teacherId;
        Price = price;
        CateId = cateId;
        Name = name;
        Introduce = introduce;
        Image = image;
        Overview = overview;
        Result = result;
        chapters=new ArrayList<>();
        Category=new Category();
        Teacher = new User();
        students=new ArrayList<User>();
        CreatedAt=new Date();
    }

    public Date getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(Date createdAt) {
        CreatedAt = createdAt;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getTeacherId() {
        return TeacherId;
    }

    public void setTeacherId(int teacherId) {
        TeacherId = teacherId;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int price) {
        Price = price;
    }

    public int getCateId() {
        return CateId;
    }

    public void setCateId(int cateId) {
        CateId = cateId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getIntroduce() {
        return Introduce;
    }

    public void setIntroduce(String introduce) {
        Introduce = introduce;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public String getOverview() {
        return Overview;
    }

    public void setOverview(String overview) {
        Overview = overview;
    }

    public String getResult() {
        return Result;
    }

    public void setResult(String result) {
        Result = result;
    }

    public List<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(List<Chapter> chapters) {
        this.chapters = chapters;
    }

    public model.Category getCategory() {
        return Category;
    }

    public void setCategory(model.Category category) {
        Category = category;
    }

    public User getTeacher() {
        return Teacher;
    }

    public void setTeacher(User teacher) {
        Teacher = teacher;
    }

    public List<User> getStudents() {
        return students;
    }

    public void setStudents(List<User> students) {
        this.students = students;
    }
}
