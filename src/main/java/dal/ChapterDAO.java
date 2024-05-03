package dal;

import model.Chapter;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChapterDAO extends DBContext{
    public ChapterDAO(){
        super();
    }
    public List<Chapter> getAllChapters(int courseId){
        List <Chapter> list = new ArrayList<>();
        String sql = "select * from Chapters where CourseId=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Chapter Chapter = new Chapter(
                        rs.getInt("Id"),
                        rs.getInt("CourseId"),
                        rs.getString("Name"),
                        rs.getString("Ordinal")
                );
                list.add(Chapter);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Chapter get(int id) {
        String sql = "select * from Chapters where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Chapter Chapter = new Chapter(
                        rs.getInt("Id"),
                        rs.getInt("CourseId"),
                        rs.getString("Name"),
                        rs.getString("Ordinal")
                );
                return Chapter;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Chapter Chapter) {
        String sql = "insert into Chapters (CourseId,Name,Ordinal) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Chapter.getCourseId());
            st.setString(2, Chapter.getName());
            st.setString(3, Chapter.getOrdinal());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Chapter Chapter) {
        String sql = "update Chapters set Name=?,CourseId =?,Ordinal=?  where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Chapter.getName());
            st.setInt(2, Chapter.getCourseId());
            st.setString(3, Chapter.getOrdinal());
            st.setInt(4, Chapter.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Chapters where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
