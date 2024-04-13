package model;

public class Lession {

    private int Id,ChapterId;
    private String Name,Description,Link;

    public Lession() {
    }

    public Lession(int chapterId, String name, String description, String link) {
        ChapterId = chapterId;
        Name = name;
        Description = description;
        Link = link;
    }

    public Lession(int id, int chapterId, String name, String description, String link) {
        Id = id;
        ChapterId = chapterId;
        Name = name;
        Description = description;
        Link = link;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getChapterId() {
        return ChapterId;
    }

    public void setChapterId(int chapterId) {
        ChapterId = chapterId;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getLink() {
        return Link;
    }

    public void setLink(String link) {
        Link = link;
    }
}
