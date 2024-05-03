package dal;

import model.Post;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO extends DBContext{
    public PostDAO(){
        super();
    }
    public List<Post> getAllPosts(){
        List <Post> list = new ArrayList<>();
        String sql = "select posts.*,users.name as UserName from posts inner join users on users.id=posts.AuthorId";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post Post = new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                );
                Post.setAuthor(new User(0,rs.getString("UserName"),"","","","",""));
                list.add(Post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Post get(int id) {
        String sql = "select * from Posts where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Post Post = new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                );
                return Post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Post Post) {
        String sql = "insert into Posts (AuthorId,Title,Comment,Content) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Post.getAuthorId());
            st.setString(2, Post.getTitle());
            st.setString(3, Post.getComment());
            st.setString(4, Post.getContent());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Post Post) {
        String sql = "update Posts AuthorId=?,Title =?,Comment=?,Content=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Post.getAuthorId());
            st.setString(2, Post.getTitle());
            st.setString(3, Post.getComment());
            st.setString(4, Post.getContent());
            st.setInt(5, Post.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Posts where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
