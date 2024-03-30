package dal;

import model.Login;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends DBContext {

    //doc tat ca ban ghi tu table KhachHang
    public LoginDAO() {
        super();
    }

    public Login check(String username, String password) {
        String sql = "select * from user2 where username=? and password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Login user = new Login(
                        rs.getInt("Id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role")
                );
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return null;
    }

}
