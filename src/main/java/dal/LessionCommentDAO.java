package dal;

import model.LessionComment;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LessionCommentDAO extends DBContext{
    public LessionCommentDAO(){
        super();
    }
    public List<LessionComment> getAllLessionComments(){
        List <LessionComment> list = new ArrayList<>();
        String sql = "select * from LessionComments";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LessionComment LessionComment = new LessionComment(
                        rs.getInt("Id"),
                        rs.getInt("LessionId"),
                        rs.getInt("Author"),
                        rs.getInt("ParentId"),
                        rs.getString("Content")
                );
                list.add(LessionComment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<LessionComment> getAllLessionCommentsById(int idlesson){
        List <LessionComment> list = new ArrayList<>();
        String sql = "select LessionComments.*,Users.name as UserName,Users.avatar as Avatar from LessionComments " +
                "inner join Users on users.id=LessionComments.AuthorId where lessionid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idlesson);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LessionComment LessionComment = new LessionComment(
                        rs.getInt("Id"),
                        rs.getInt("LessionId"),
                        rs.getInt("AuthorId"),
                        rs.getInt("ParentId"),
                        rs.getString("Content")
                );
                User user = new User(0, rs.getString("UserName"), "", "", "", "", "");
                user.setAvatar(rs.getString("Avatar"));
                LessionComment.setAuthor(user);
                list.add(LessionComment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public LessionComment get(int id) {
        String sql = "select * from LessionComments where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                LessionComment LessionComment = new LessionComment(
                        rs.getInt("Id"),
                        rs.getInt("LessionId"),
                        rs.getInt("Author"),
                        rs.getInt("ParentId"),
                        rs.getString("Content")
                );
                return LessionComment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(LessionComment LessionComment) {
        String sql = "insert into LessionComments (LessionId,AuthorId,ParentId,Content) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, LessionComment.getLessionId());
            st.setInt(2, LessionComment.getAuthorId());
            st.setInt(3, LessionComment.getParentId());
            st.setString(4, LessionComment.getContent());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(LessionComment LessionComment) {
        String sql = "update LessionComments set LessionId=?,AuthorId =?,ParentId=?,Content=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, LessionComment.getLessionId());
            st.setInt(2, LessionComment.getAuthorId());
            st.setInt(3, LessionComment.getParentId());
            st.setString(4, LessionComment.getContent());
            st.setInt(5, LessionComment.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from LessionComments where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
