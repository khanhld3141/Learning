package dal;

import model.Status;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatusDAO extends DBContext{
    public StatusDAO(){
        super();
    }
    public List<Status> getAllStatuss(){
        List <Status> list = new ArrayList<>();
        String sql = "select * from Statuss";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Status Status = new Status(
                       rs.getInt("Id"),
                        rs.getString("Name")
                );
                list.add(Status);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Status get(int id) {
        String sql = "select * from Statuss where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Status Status = new Status(
                        rs.getInt("Id"),
                        rs.getString("Name")
                );
                return Status;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Status Status) {
        String sql = "insert into Statuss (Name) values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Status.getName());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Status Status) {
        String sql = "update Statuss Name=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Status.getName());
            st.setInt(2, Status.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Statuss where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
