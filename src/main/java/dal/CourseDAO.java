package dal;

import model.Course;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO extends DBContext{
    public CourseDAO(){
        super();
    }
    public List<Course> getAllCourses(){
        List <Course> list = new ArrayList<>();
        String sql = "select * from Courses";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Course Course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeachId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );
                list.add(Course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Course get(int id) {
        String sql = "select * from Courses where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Course Course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeachId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );
                return Course;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Course Course) {
        String sql = "insert into Courses (Name,Introduce,Image,Overview,Result,TeacherId,CateId,Price) values(?,?,?," +
                "?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Course.getName());
            st.setString(2, Course.getIntroduce());
            st.setString(3, Course.getImage());
            st.setString(4, Course.getOverview());
            st.setString(5, Course.getResult());
            st.setInt(6, Course.getTeacherId());
            st.setInt(7, Course.getCateId());
            st.setInt(8, Course.getPrice());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Course Course) {
        String sql = "update Courses Name=?,Introduce =?,Image=?,Overview=?,Result=?,TeacherId=?,CateId=?,Price=?  " +
                "where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Course.getName());
            st.setString(2, Course.getIntroduce());
            st.setString(3, Course.getImage());
            st.setString(4, Course.getOverview());
            st.setString(5, Course.getResult());
            st.setInt(6, Course.getTeacherId());
            st.setInt(7, Course.getCateId());
            st.setInt(8, Course.getPrice());
            st.setInt(9, Course.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Courses where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
