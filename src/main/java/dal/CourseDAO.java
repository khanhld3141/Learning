package dal;

import model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO extends DBContext {
    public CourseDAO() {
        super();
    }

    public List<Course> getAllCourses(int page, int recordsPerPage) {
        List<Course> list = new ArrayList<>();
        String sql = "select courses.*,Categories.Name as CateName,Categories.Image as CateImage,Users.Name as Teacher from courses \n" +
                "                left join Categories on Categories.id=Courses.CateId\n" +
                "\t\t\t\tleft join Users on Courses.TeacherId=users.id ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
            ResultSet rs = st.executeQuery();
            Course course = null;
            while (rs.next()) {

                course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );

                course.setCategory(new Category(rs.getString("CateName"),rs.getString("CateImage")));
                course.setTeacher(new User(rs.getInt("TeacherId"),rs.getString("Teacher"),"","","","",""));
                list.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Course> getAllCoursesHome() {
        List<Course> list = new ArrayList<>();
        String sql = "select * from Courses";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Course Course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );
                Course.setCreatedAt(rs.getDate("CreatedAt"));
                list.add(Course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Course> searchByName(int page, int recordsPerPage,String query) {
        List<Course> list = new ArrayList<>();
        String sql = "select courses.*,Categories.Name as CateName,Categories.Image as CateImage,Users.Name as Teacher from courses \n" +
                "                left join Categories on Categories.id=Courses.CateId\n" +
                "\t\t\t\tleft join Users on Courses.TeacherId=users.id where courses.name like ? ORDER BY Id OFFSET ?" +
                " " +
                "ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setString(1,"%"+query+"%");
            st.setInt(2, offset);
            st.setInt(3, recordsPerPage);
            ResultSet rs = st.executeQuery();
            Course course = null;
            while (rs.next()) {

                course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );

                course.setCategory(new Category(rs.getString("CateName"),rs.getString("CateImage")));
                course.setTeacher(new User(rs.getInt("TeacherId"),rs.getString("Teacher"),"","","","",""));
                list.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Course> searchByNameOfTeacher(int teacherid,int page, int recordsPerPage,String query) {
        List<Course> list = new ArrayList<>();
        String sql = "select courses.*,Categories.Name as CateName,Categories.Image as CateImage,Users.Name as Teacher from courses \n" +
                "                left join Categories on Categories.id=Courses.CateId\n" +
                "\t\t\t\tleft join Users on Courses.TeacherId=users.id where Courses.TeacherId=? and courses" +
                ".name like ? ORDER BY Id OFFSET" +
                " ?" +
                " " +
                "ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1,teacherid);
            st.setString(2,"%"+query+"%");
            st.setInt(3, offset);
            st.setInt(4, recordsPerPage);
            ResultSet rs = st.executeQuery();
            Course course = null;
            while (rs.next()) {

                course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );

                course.setCategory(new Category(rs.getString("CateName"),rs.getString("CateImage")));
                course.setTeacher(new User(rs.getInt("TeacherId"),rs.getString("Teacher"),"","","","",""));
                list.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Course> getCourseByCate(int page, int recordsPerPage,int cate) {
        List<Course> list = new ArrayList<>();
        String sql = "select courses.*,Categories.Name as CateName,Categories.Image as CateImage,Users.Name as Teacher from courses \n" +
                "                left join Categories on Categories.id=Courses.CateId\n" +
                "\t\t\t\tleft join Users on Courses.TeacherId=users.id where courses.cateid =? ORDER BY Id OFFSET ?" +
                " " +
                "ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1,cate);
            st.setInt(2, offset);
            st.setInt(3, recordsPerPage);
            ResultSet rs = st.executeQuery();
            Course course = null;
            while (rs.next()) {

                course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );

                course.setCategory(new Category(rs.getString("CateName"),rs.getString("CateImage")));
                course.setTeacher(new User(rs.getInt("TeacherId"),rs.getString("Teacher"),"","","","",""));
                list.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Char> getCourseChar(){
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
                "    courses c ON FORMAT(c.createdAt, 'yyyy-MM') = FORMAT(Months.Month, 'yyyy-MM')\n" +
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
    public List<Course> getAllCourseOfUser(int userId) {
        List<Course> list = new ArrayList<>();
        String sql = "select Courses.* from courses inner join UserCourses on courses.id = UserCourses.CourseId\n" +
                "left join users on users.id = UserCourses.UserId where users.id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Course Course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );
                Course.setCreatedAt(rs.getDate("CreatedAt"));
                list.add(Course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getCount() {
        String sql = "select count(*) as count from courses";

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
    public Course get(int id) {
        String sql = "select Courses.*,users.name as teacher,users.avatar as avatar from courses left join users on " +
                "users.id = courses.TeacherId where Courses.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Course Course = new Course(
                        rs.getInt("Id"),
                        rs.getInt("TeacherId"),
                        rs.getInt("price"),
                        rs.getInt("CateId"),
                        rs.getString("Name"),
                        rs.getString("Introduce"),
                        rs.getString("Image"),
                        rs.getString("Overview"),
                        rs.getString("Result")
                );
                Course.setCreatedAt(rs.getDate("CreatedAt"));
                User user=new User();
                user.setName(rs.getString("teacher"));
                user.setAvatar(rs.getString("avatar"));
                Course.setTeacher(user);
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
        String sql = "update Courses set Name=?,Introduce =?,Image=?,Overview=?,Result=?,TeacherId=?,CateId=?,Price=?" +
                "  " +
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
