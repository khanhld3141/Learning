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
    public void create(Category Category) {
        String sql = "insert into Categoryies (Name,Image) values(?,?)";
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
