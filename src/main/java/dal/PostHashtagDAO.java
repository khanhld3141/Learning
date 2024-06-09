package dal;

import model.Post;
import model.PostHashtag;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostHashtagDAO extends DBContext{
    public PostHashtagDAO(){
        super();
    }

    public PostHashtag get(int postid,int hashtagid){
        String sql="select * from post_hashtag where postid=? and hashtagid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postid);
            st.setInt(2, hashtagid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostHashtag postHashtag=new PostHashtag(
                        rs.getInt("id"),
                        rs.getInt("postid"),
                        rs.getInt("hashtagid")
                );
                return postHashtag;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<PostHashtag> get(int postid){
        String sql="select * from post_hashtag where postid=?";
        List<PostHashtag> postHashtags=new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostHashtag postHashtag=new PostHashtag(
                        rs.getInt("id"),
                        rs.getInt("postid"),
                        rs.getInt("hashtagid")
                );
                postHashtags.add(postHashtag);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postHashtags;
    }
    public List<PostHashtag> getByTagId(int tagid){
        String sql="select * from post_hashtag where hashtagid=?";
        List<PostHashtag> postHashtags=new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, tagid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostHashtag postHashtag=new PostHashtag(
                        rs.getInt("id"),
                        rs.getInt("postid"),
                        rs.getInt("hashtagid")
                );
                postHashtags.add(postHashtag);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postHashtags;
    }
    public void create(PostHashtag postHashtag) {
        String sql = "insert into post_hashtag (PostId,HashtagId) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postHashtag.getPostId());
            st.setInt(2, postHashtag.getHashtagId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteHashtagOfPost(int id) {
        String sql = "delete from post_hashtag where postid = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void delete(int id) {
        String sql = "delete from post_hashtag where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
