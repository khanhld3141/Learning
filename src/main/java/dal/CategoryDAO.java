package dal;

import model.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext{
    public CategoryDAO(){
        super();
    }
    public List<Category> getAllCategorys(){
        List <Category> list = new ArrayList<>();
        String sql = "select * from Categories";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category Category = new Category(
                        rs.getInt("Id"),
                        rs.getString("Name"),
                        rs.getString("Image")
                );
                list.add(Category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Category get(int id) {
        String sql = "select * from Categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Category Category = new Category(
                        rs.getInt("Id"),
                        rs.getString("Name"),
                        rs.getString("Image")
                );
                return Category;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Category> getWithNumberOfCourses(){
        List <Category> list = new ArrayList<>();
        String sql = "SELECT Categories.id, Categories.Name, COUNT(courses.Id) AS Total\n" +
                "FROM Categories\n" +
                "LEFT JOIN courses ON Categories.Id = courses.CateId\n" +
                "GROUP BY Categories.id, Categories.Name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category Category = new Category(
                        rs.getInt("Id"),
                        rs.getString("Name"),
                        ""
                );
                Category.setTotalCourse(rs.getInt("Total"));
                list.add(Category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public void create(Category Category) {
        String sql = "insert into Categories (Name,Image) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Category.getName());
            st.setString(2, Category.getImage());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Category Category) {
        String sql = "update Categories set Name=?,Image=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Category.getName());
            st.setString(2, Category.getImage());
            st.setInt(3, Category.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Categories where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
