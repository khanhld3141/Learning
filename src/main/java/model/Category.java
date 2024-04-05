package model;

public class Category {
    private int Id;
    private String Name;

    public Category() {
    }

    public Category(String name) {
        Name = name;
    }

    public Category(int id, String name) {
        Id = id;
        Name = name;
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
}
