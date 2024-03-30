package dal;

import model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO extends DBContext {

    //doc tat ca ban ghi tu table KhachHang
    public UsersDAO() {
        super();
    }

    public List<Users> getAll() {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users kh = new Users(
                        rs.getInt("Id"),
                        rs.getString("NameUser"),
                        rs.getString("University"),
                        rs.getString("Class"),
                        rs.getDouble("Grade")
                );
                list.add(kh);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Users get(int id) {
        String sql = "select * from users where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Users users = new Users(
                        rs.getInt("Id"),
                        rs.getString("NameUser"),
                        rs.getString("University"),
                        rs.getString("Class"),
                        rs.getDouble("Grade")
                );
                return users;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void create(Users user) {
        String sql = "insert into users (NameUser,University,Class,Grade) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getUni());
            st.setString(3, user.getClas());
            st.setDouble(4, user.getGrade());

            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Users user) {
        String sql = "update users set NameUser=?,University=?,Class=?,Grade=? where id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getUni());
            st.setString(3, user.getClas());
            st.setDouble(4, user.getGrade());
            st.setInt(5, user.getId());
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
