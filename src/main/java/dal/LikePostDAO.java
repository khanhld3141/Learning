package dal;

import model.LikePost;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LikePostDAO extends DBContext{
    public LikePostDAO(){
        super();
    }
    public List<LikePost> getAllLikePosts(){
        List <LikePost> list = new ArrayList<>();
        String sql = "select * from LikePosts";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LikePost LikePost = new LikePost(
                        rs.getInt("Id"),
                        rs.getInt("UserId"),
                        rs.getInt("PostId")
                );
                list.add(LikePost);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public LikePost get(int id) {
        String sql = "select * from LikePosts where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                LikePost LikePost = new LikePost(
                        rs.getInt("Id"),
                        rs.getInt("UserId"),
                        rs.getInt("PostId")
                );
                return LikePost;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(LikePost LikePost) {
        String sql = "insert into LikePosts (UserId,PostId) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, LikePost.getUserId());
            st.setInt(2, LikePost.getPostId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(LikePost LikePost) {
        String sql = "update LikePosts UserId=?,PostId =? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, LikePost.getUserId());
            st.setInt(2, LikePost.getPostId());
            st.setInt(3, LikePost.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(LikePost likePost) {
        String sql = "delete from LikePosts where id = ? and idpost=?and iduser=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, likePost.getId());
            st.setInt(2, likePost.getPostId());
            st.setInt(3, likePost.getUserId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
