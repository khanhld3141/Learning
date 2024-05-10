package dal;

import model.Post;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO extends DBContext {
    public PostDAO() {
        super();
    }

    public List<Post> getAllPosts(int page, int recordsPerPage) {
        List<Post> list = new ArrayList<>();
        String sql = "select posts.*,users.name as UserName from posts inner join users on users.id=posts.AuthorId  ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post Post = new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getString("Image"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                );
                Post.setCreatedAt(rs.getTimestamp("createdAt"));
                Post.setAuthor(new User(0, rs.getString("UserName"), "", "", "", "", ""));
                list.add(Post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> searchByName(int page, int recordsPerPage,String query) {

        List<Post> list = new ArrayList<>();
        String sql = "select posts.*,users.name as UserName from posts inner join users on users.id=posts.AuthorId " +
                "where title like ?" +
                "  ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setString(1,"%" + query + "%");
            st.setInt(2, offset);
            st.setInt(3, recordsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post Post = new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getString("Image"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                );
                Post.setCreatedAt(rs.getTimestamp("createdAt"));
                Post.setAuthor(new User(0, rs.getString("UserName"), "", "", "", "", ""));
                list.add(Post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }

    public List<Post> getMyPost(int idAuthor) {
        List<Post> list = new ArrayList<>();
        String sql = "select * from posts where AuthorId=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idAuthor);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Post Post = new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getString("Image"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                );
                Post.setCreatedAt(rs.getTimestamp("createdAt"));
                list.add(Post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post get(int id) {
        String sql = "select posts.*,users.name as UserName from posts inner join users on users.id=posts.AuthorId " +
                "where Posts.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Post Post = new Post(
                        rs.getString("Title"),
                        rs.getString("Content"),
                        rs.getString("Comment"),
                        rs.getString("Image"),
                        rs.getInt("Id"),
                        rs.getInt("AuthorId")
                );
                Post.setCreatedAt(rs.getTimestamp("createdAt"));
                Post.setAuthor(new User(0, rs.getString("UserName"), "", "", "", "", ""));
                return Post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void create(Post Post) {
        String sql = "insert into Posts (AuthorId,Title,Comment,Content,Image) values(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Post.getAuthorId());
            st.setString(2, Post.getTitle());
            st.setString(3, Post.getComment());
            st.setString(4, Post.getContent());
            st.setString(5, Post.getImage());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Post Post) {
        String sql = "update Posts set AuthorId=?,Title =?,Comment=?,Content=?,Image=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Post.getAuthorId());
            st.setString(2, Post.getTitle());
            st.setString(3, Post.getComment());
            st.setString(4, Post.getContent());
            st.setString(5, Post.getImage());
            st.setInt(6, Post.getId());
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
