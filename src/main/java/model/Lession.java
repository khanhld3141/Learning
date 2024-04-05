package model;

public class Lession {

    private String Id,ChapterId;
    private String Name,Description,Link;

    public Lession() {
    }

    public Lession(String chapterId, String name, String description, String link) {
        ChapterId = chapterId;
        Name = name;
        Description = description;
        Link = link;
    }

    public Lession(String id, String chapterId, String name, String description, String link) {
        Id = id;
        ChapterId = chapterId;
        Name = name;
        Description = description;
        Link = link;
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getChapterId() {
        return ChapterId;
    }

    public void setChapterId(String chapterId) {
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
