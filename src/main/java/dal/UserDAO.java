package dal;

import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    //doc tat ca ban ghi tu table KhachHang
    public UserDAO() {
        super();
    }

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("Id"),
                        rs.getInt("Balance"),
                        rs.getString("Name"),
                        rs.getString("Username"),
                        rs.getString("Phone"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        rs.getString("Password")
                );
                list.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public User get(int id) {
        String sql = "select * from users where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("Id"),
                        rs.getInt("Balance"),
                        rs.getString("Name"),
                        rs.getString("Username"),
                        rs.getString("Phone"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        rs.getString("Password")
                );
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void create(User user) {
        String sql = "insert into Users (Name,Username,Email,Password,Phone,Role,Balance) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getUsername());
            st.setString(3, user.getEmail());
            st.setString(4, user.getPassword());
            st.setString(5, user.getPhone());
            st.setString(6, user.getRole());
            st.setInt(7, user.getBanlance());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(User user) {
        String sql = "update users set Name=?,UserName=?,Email=?,Password=?,Phone=?,Role=?,Balance=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getUsername());
            st.setString(3, user.getEmail());
            st.setString(4, user.getPassword());
            st.setString(5, user.getPhone());
            st.setString(6, user.getRole());
            st.setInt(7, user.getBanlance());
            st.setInt(8, user.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from users where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
