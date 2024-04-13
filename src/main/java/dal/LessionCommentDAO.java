package dal;

import model.LessionComment;

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
            st.setInt(1, LessionComment.getAuthorId());
            st.setInt(1, LessionComment.getParentId());
            st.setString(2, LessionComment.getContent());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(LessionComment LessionComment) {
        String sql = "update LessionComments LessionId=?,AuthorId =?,ParentId=?,Content=? where Id=? ";
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
