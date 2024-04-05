package dal;

import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends DBContext {

    //doc tat ca ban ghi tu table KhachHang
    public LoginDAO() {
        super();
    }

    public User check(String username, String password) {
        String sql = "select * from Users where Username=? and Password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
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

}
