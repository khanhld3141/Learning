package dal;

import model.Hashtag;

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
        String sql = "select * from Hashtags";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("Id"),
                        rs.getInt("PostId"),
                        rs.getString("Tag")
                );
                list.add(Hashtag);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Hashtag get(int id) {
        String sql = "select * from Hashtags where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("Id"),
                        rs.getInt("PostId"),
                        rs.getString("Tag")
                );
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
        String sql = "update Hashtags PostId=?,Tag =? where Id=? ";
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
