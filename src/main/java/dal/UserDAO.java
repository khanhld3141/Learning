package dal;

import lib.AESUtil;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public UserDAO() {
        super();
    }

    public List<User> getAll(int page, int recordsPerPage) {
        List<User> list = new ArrayList<>();
        String sql =  "SELECT * FROM Users ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
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
    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql =  "SELECT * FROM Users ";

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
    public List<User> getAllTeacher() {
        List<User> list = new ArrayList<>();
        String sql =  "SELECT * FROM Users Where Role='R2'";

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
    public int getTotalPages(int recordsPerPage) {
        int totalPages = 0;
        String sql = "SELECT COUNT(*) AS total FROM Users";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int totalRecords = rs.getInt("total");
                totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalPages;
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
    public void create(User user) {
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
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(User user) {
        String sql = "update users set Name=?,UserName=?,Email=?,Password=?,Phone=?,Role=?,Balance=? where Id=? ";
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
