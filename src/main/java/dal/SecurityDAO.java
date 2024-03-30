package dal;

import model.Security;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SecurityDAO extends DBContext {

    //doc tat ca ban ghi tu table KhachHang
    public SecurityDAO() {
        super();
    }

    public Security check(String username, String password) {
        String sql = "select * from user2 where username=? and password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Security user = new Security(
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
