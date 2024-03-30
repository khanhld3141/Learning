package model;

public class Users {


    private int id;
    private String name;
    private String uni;
    private String clas;
    private double grade;

    public Users() {
    }

    public Users(int id, String name, String uni, String clas, double grade) {
        this.id = id;
        this.name = name;
        this.uni = uni;
        this.clas = clas;
        this.grade = grade;
    }
    public Users( String name, String uni, String clas, double grade) {
        this.name = name;
        this.uni = uni;
        this.clas = clas;
        this.grade = grade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUni() {
        return uni;
    }

    public void setUni(String uni) {
        this.uni = uni;
    }

    public String getClas() {
        return clas;
    }

    public void setClas(String clas) {
        this.clas = clas;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }
}
