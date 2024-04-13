package model;

import java.util.Set;

public class Course {
    private int Id,TeacherId,Price,CateId;
    private String Name,Introduce,Image,Overview,Result;
    private Set<User> users;

    public Course() {
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
}
