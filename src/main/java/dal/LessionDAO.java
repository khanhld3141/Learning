package dal;

import model.Lession;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LessionDAO extends DBContext{
    public LessionDAO(){
        super();
    }
    public List<Lession> getAllLessions(int chapterid){
        List <Lession> list = new ArrayList<>();
        String sql = "select * from Lessions where chapterid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,chapterid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Lession Lession = new Lession(
                        rs.getInt("Id"),
                        rs.getInt("ChapterId"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Link")
                );
                list.add(Lession);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Lession get(int id) {
        String sql = "select * from Lessions where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Lession Lession = new Lession(
                        rs.getInt("Id"),
                        rs.getInt("ChapterId"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Link")
                );
                return Lession;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Lession Lession) {
        String sql = "insert into Lessions (ChapterId,Name,Description,Link) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Lession.getChapterId());
            st.setString(2, Lession.getName());
            st.setString(3, Lession.getDescription());
            st.setString(4, Lession.getLink());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Lession Lession) {
        String sql = "update Lessions ChapterId=?,Name =?,Description=?,Link=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Lession.getChapterId());
            st.setString(2, Lession.getName());
            st.setString(3, Lession.getDescription());
            st.setString(4, Lession.getLink());
            st.setInt(5, Lession.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Lessions where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
