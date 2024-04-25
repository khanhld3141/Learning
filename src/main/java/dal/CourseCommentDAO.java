package dal;

import model.CourseComment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseCommentDAO extends DBContext{
    public CourseCommentDAO(){
        super();
    }
    public List<CourseComment> getAllCourseComments(int courseId){
        List <CourseComment> list = new ArrayList<>();
        String sql = "select * from CourseComments where CourseId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CourseComment CourseComment = new CourseComment(
                        rs.getInt("Id"),
                        rs.getInt("CourseId"),
                        rs.getInt("AuthorId"),
                        rs.getString("Content")
                );
                list.add(CourseComment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public CourseComment get(int id) {
        String sql = "select * from CourseComments where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                CourseComment CourseComment = new CourseComment(
                        rs.getInt("Id"),
                        rs.getInt("CourseId"),
                        rs.getInt("AuthorId"),
                        rs.getString("Content")
                );
                return CourseComment;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(CourseComment CourseComment) {
        String sql = "insert into CourseComments (CourseId,AuthorId,Content) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CourseComment.getCourseId());
            st.setInt(2, CourseComment.getAuthorId());
            st.setString(3, CourseComment.getContent());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(CourseComment CourseComment) {
        String sql = "update CourseComments set CourseId=?,AuthorId =?,Content=?  where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CourseComment.getCourseId());
            st.setInt(2, CourseComment.getAuthorId());
            st.setString(3, CourseComment.getContent());
            st.setInt(4, CourseComment.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from CourseComments where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
