package dal;

import model.Hashtag;
import model.Post;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HashtagDAO extends DBContext{
    public HashtagDAO(){
        super();
    }
    public List<Hashtag> getAllHashtags(){
        List <Hashtag> list = new ArrayList<>();
        String sql = "select Posts.*,Tag,Hashtags.Id as TagId from Hashtags\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("id"),
                        rs.getString("tag")
                );
                list.add(Hashtag);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Hashtag> getAllHashTagOfPost(int postid){
        List <Hashtag> list = new ArrayList<>();
        String sql = "select Hashtags.id as TagId, Tag from Hashtags inner join Post_hashtag on hashtags" +
                ".id=post_hashtag.hashtagid where post_hashtag.postid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,postid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("tagid"),
                        rs.getString("tag")
                );
                list.add(Hashtag);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Hashtag getByHashtag(String tag) {
        String sql = "select * from hashtags where tag = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,tag);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hashtag Hashtag = new Hashtag(
                        rs.getInt("id"),
                        rs.getString("tag")
                );
                return Hashtag;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public int create(Hashtag Hashtag) {
        String sql = "insert into Hashtags (Tag) values(?)";
        int hashtagid=-1;
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, Hashtag.getTag());
            // Execute the update
            st.executeUpdate();
            ResultSet generatedKeys = st.getGeneratedKeys();
            if (generatedKeys.next()) {
                hashtagid = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating hashtag failed, no ID obtained.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hashtagid;
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
