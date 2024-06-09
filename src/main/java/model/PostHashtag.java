package model;

public class PostHashtag {
    private int Id,PostId,HashtagId;

    public PostHashtag(int postId, int hashtagId) {
        PostId = postId;
        HashtagId = hashtagId;
    }

    public PostHashtag(int id, int postId, int hashtagId) {
        Id = id;
        PostId = postId;
        HashtagId = hashtagId;
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

    public int getHashtagId() {
        return HashtagId;
    }

    public void setHashtagId(int hashtagId) {
        HashtagId = hashtagId;
    }
}
