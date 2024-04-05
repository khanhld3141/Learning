package model;

public class LikePost {
    private int Id,UserId,PostId;

    public LikePost() {
    }

    public LikePost(int userId, int postId) {
        UserId = userId;
        PostId = postId;
    }

    public LikePost(int id, int userId, int postId) {
        Id = id;
        UserId = userId;
        PostId = postId;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getPostId() {
        return PostId;
    }

    public void setPostId(int postId) {
        PostId = postId;
    }
}
