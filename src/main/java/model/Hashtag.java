package model;

public class Hashtag {

    private int Id,PostId;
    private String Tag;

    public Hashtag() {
    }

    public Hashtag(int postId, String tag) {
        PostId = postId;
        Tag = tag;
    }

    public Hashtag(int id, int postId, String tag) {
        Id = id;
        PostId = postId;
        Tag = tag;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getPostId() {
        return PostId;
    }

    public void setPostId(int postId) {
        PostId = postId;
    }

    public String getTag() {
        return Tag;
    }

    public void setTag(String tag) {
        Tag = tag;
    }
}

