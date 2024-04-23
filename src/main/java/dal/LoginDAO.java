package dal;

import lib.AESUtil;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends DBContext {

    //doc tat ca ban ghi tu table KhachHang
    public LoginDAO() {
        super();
    }

    public User login(String username) {
        String sql = "select * from Users where Username=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
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
            throw new RuntimeException(e);
        }


        return null;
    }

    public boolean register(User user) {
        String sql = "insert into Users (Name,Username,Email,Password,Phone,Role,Balance) values(?,?,?,?,?,?,?)";
        String hashPassword = "";
        try {
            hashPassword = AESUtil.encrypt(user.getPassword());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getUsername());
            st.setString(3, user.getEmail());
            st.setString(4, hashPassword);
            st.setString(5, user.getPhone());
            st.setString(6, user.getRole());
            st.setInt(7, user.getBanlance());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return false;
    }
    public User getByUserName(String userName) {
        String sql = "select * from users where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
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
                String password = "";
                try {
                    password = AESUtil.decrypt(user.getPassword());
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                user.setPassword(password);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
