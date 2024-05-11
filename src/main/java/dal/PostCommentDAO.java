package dal;

import model.PostComment;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostCommentDAO extends DBContext {
    public PostCommentDAO() {
        super();
    }

    public List<PostComment> getAllPostComments() {
        List<PostComment> list = new ArrayList<>();
        String sql = "select * from PostComments";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostComment PostComment = new PostComment(
                        rs.getInt("Id"),
                        rs.getInt("AuthorId"),
                        rs.getInt("PostId"),
                        rs.getInt("IdParent"),
                        rs.getString("Content")
                );
                list.add(PostComment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<PostComment> getAllPostCommentOfPost(int id) {
        List<PostComment> list = new ArrayList<>();
        String sql = "select PostComments.*,users.avatar as Avatar,users.name as Name from PostComments left join " +
                "users on PostComments.AuthorId=users.id where PostId=?";


        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PostComment PostComment = new PostComment(
                        rs.getInt("Id"),
                        rs.getInt("AuthorId"),
                        rs.getInt("PostId"),
                        rs.getInt("IdParent"),
                        rs.getString("Content")
                );
                User user = new User(0, rs.getString("Name"), "", "", "", "", "");
                user.setAvatar(rs.getString("Avatar"));
                PostComment.setAuthor(user);
                list.add(PostComment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public PostComment get(int id) {
        String sql = "select * from PostComments where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                PostComment PostComment = new PostComment(
                        rs.getInt("Id"),
                        rs.getInt("AuthorId"),
                        rs.getInt("PostId"),
                        rs.getInt("IdParent"),
                        rs.getString("Content")
                );
                return PostComment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void create(PostComment PostComment) {
        String sql = "insert into PostComments (AuthorId,PostId,Content) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, PostComment.getAuthorId());
            st.setInt(2, PostComment.getPostId());
            st.setString(3, PostComment.getContent());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(PostComment PostComment) {
        String sql = "update PostComments set AuthorId=?,PostId =?,Content=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, PostComment.getAuthorId());
            st.setInt(2, PostComment.getPostId());
            st.setString(3, PostComment.getContent());
            st.setInt(4, PostComment.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from PostComments where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
