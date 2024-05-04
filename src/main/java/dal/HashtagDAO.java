package dal;

import model.Hashtag;
import model.Post;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HashtagDAO extends DBContext{
    public HashtagDAO(){
        super();
    }
    public List<Hashtag> getAllHashtags(){
        List <Hashtag> list = new ArrayList<>();
        String sql = "select Posts.*,Tag,Hashtags.Id as TagId from Hashtags\n" +
                "left join Posts on Hashtags.PostId=Posts.Id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("TagId"),
                        rs.getInt("Id"),
                        rs.getString("Tag")
                );
                Hashtag.setPost(new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getString("Image"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                ));
                list.add(Hashtag);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Hashtag get(int id) {
        String sql = "select Posts.*,Tag,Hashtags.Id as TagId from Hashtags\n" +
                "left join Posts on Hashtags.PostId=Posts.Id Where Hashtags.Id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("TagId"),
                        rs.getInt("Id"),
                        rs.getString("Tag")
                );
                Hashtag.setPost(new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getString("Image"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                ));
                return Hashtag;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Hashtag Hashtag) {
        String sql = "insert into Hashtags (PostId,Tag) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Hashtag.getPostId());
            st.setString(2, Hashtag.getTag());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Hashtag Hashtag) {
        String sql = "update Hashtags set PostId=?,Tag =? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Hashtag.getPostId());
            st.setString(2, Hashtag.getTag());
            st.setInt(3, Hashtag.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Hashtags where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
