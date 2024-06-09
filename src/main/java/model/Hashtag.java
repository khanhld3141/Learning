package model;

import java.util.ArrayList;
import java.util.List;

public class Hashtag {

    private int Id;
    private String Tag;
    private List<Post> posts;
    public Hashtag() {
    }

    public Hashtag( String tag) {
        Tag = tag;
        posts=new ArrayList<>();
    }

    public Hashtag(int id, String tag) {
        Id = id;
        Tag = tag;
        posts=new ArrayList<>();
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }


    public String getTag() {
        return Tag;
    }

    public void setTag(String tag) {
        Tag = tag;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }
}

