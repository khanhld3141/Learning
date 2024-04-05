package model;

public class Status {

    private String Name;
    private int Id;

    public Status() {
    }

    public Status(String name) {
        Name = name;
    }

    public Status(String name, int id) {
        Name = name;
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }
}
