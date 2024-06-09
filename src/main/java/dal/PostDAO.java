package dal;

import model.Char;
import model.Post;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        String sql = "select posts.*,users.name as UserName from posts inner join users on users.id=posts.AuthorId\n" +
                "\t   where Posts.Title like ?" +
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
    public List<Post> searchByHashTag(int page, int recordsPerPage,String query) {

        List<Post> list = new ArrayList<>();
        String sql = "select posts.*,users.name as UserName from posts \n" +
                "\t\t\t\tinner join users on users.id=posts.AuthorId\n" +
                "                inner join post_hashtag on post_hashtag.postid=posts.id \n" +
                "\t\t\t\tinner join Hashtags on Hashtags.id=Post_Hashtag.HashtagId\n" +
                "\t\t\t\twhere tag like ?" +
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
    public List<Char> getPostChar(){
        List <Char> list = new ArrayList<>();
        String sql = ";WITH Months AS (\n" +
                "    SELECT DATEADD(MONTH, -11, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)) AS Month\n" +
                "    UNION ALL\n" +
                "    SELECT DATEADD(MONTH, 1, Month)\n" +
                "    FROM Months\n" +
                "    WHERE Month < DATEADD(MONTH, 0, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))\n" +
                ")\n" +
                "SELECT \n" +
                "    FORMAT(Months.Month, 'yyyy-MM') AS month,\n" +
                "    ISNULL(COUNT(c.id), 0) AS count\n" +
                "FROM \n" +
                "    Months\n" +
                "LEFT JOIN \n" +
                "    posts c ON FORMAT(c.createdAt, 'yyyy-MM') = FORMAT(Months.Month, 'yyyy-MM')\n" +
                "GROUP BY \n" +
                "    Months.Month\n" +
                "ORDER BY \n" +
                "    Months.Month;\n" +
                "\n" +
                "\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Char r=new Char(
                        rs.getString("month"),
                        rs.getInt("count")
                );
                list.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getCount() {
        String sql = "select count(*) as count from posts";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int count=rs.getInt("count");
                return count;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int create(Post Post) {
        String sql = "insert into Posts (AuthorId,Title,Comment,Content,Image) values(?,?,?,?,?)";
        int postid=-1;
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, Post.getAuthorId());
            st.setString(2, Post.getTitle());
            st.setString(3, Post.getComment());
            st.setString(4, Post.getContent());
            st.setString(5, Post.getImage());
            // Execute the update
            st.executeUpdate();

            ResultSet generatedKeys = st.getGeneratedKeys();
            if (generatedKeys.next()) {
                postid = generatedKeys.getInt(1);

            } else {
                throw new SQLException("Creating post failed, no ID obtained.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postid;
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
