package dal;

import model.UserCourse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserCourseDAO extends DBContext{
    public UserCourseDAO(){
        super();
    }
    public List<UserCourse> getAllUserCourses(){
        List <UserCourse> list = new ArrayList<>();
        String sql = "select * from UserCourses";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserCourse UserCourse = new UserCourse(
                        rs.getInt("Id"),
                        rs.getInt("UserId"),
                        rs.getInt("CourseId")
                );
                list.add(UserCourse);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public UserCourse get(int id) {
        String sql = "select * from UserCourses where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                UserCourse UserCourse = new UserCourse(
                        rs.getInt("Id"),
                        rs.getInt("UserId"),
                        rs.getInt("CourseId")
                );
                return UserCourse;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(UserCourse UserCourse) {
        String sql = "insert into UserCourses (UserId,CourseId) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, UserCourse.getUserId());
            st.setInt(2, UserCourse.getCourseId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(UserCourse UserCourse) {
        String sql = "update UserCourses UserId=?,CourseId=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, UserCourse.getUserId());
            st.setInt(2, UserCourse.getCourseId());
            st.setInt(2, UserCourse.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from UserCourses where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
