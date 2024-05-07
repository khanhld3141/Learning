package dal;

import model.Banner;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BannerDAO extends DBContext{
    public BannerDAO(){
        super();
    }
    public List<Banner> getAllBanners(){
        List <Banner> list = new ArrayList<>();
        String sql = "select * from Banners";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Banner banner = new Banner(
                        rs.getInt("Id"),
                        rs.getString("Image"),
                        rs.getString("Content"),
                        rs.getString("Startday"),
                        rs.getString("Endday")
                );
                list.add(banner);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Banner> searchByName(String name){
        List <Banner> list = new ArrayList<>();
        String sql = "select * from Banners WHERE Content LIKE ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Banner banner = new Banner(
                        rs.getInt("Id"),
                        rs.getString("Image"),
                        rs.getString("Content"),
                        rs.getString("Startday"),
                        rs.getString("Endday")
                );
                list.add(banner);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Banner get(int id) {
        String sql = "select * from Banners where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Banner banner = new Banner(
                        rs.getInt("Id"),
                        rs.getString("Image"),
                        rs.getString("Content"),
                        rs.getString("Startday"),
                        rs.getString("Endday")
                );
                return banner;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Banner banner) {
        String sql = "insert into Banners (Image,Content,Startday,Endday) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, banner.getImage());
            st.setString(2, banner.getContent());
            st.setString(3, banner.getStartDay());
            st.setString(4, banner.getEndDay());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Banner banner) {
        String sql = "update banners set Image=?,Content=?,Starday=?,Endday=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, banner.getImage());
            st.setString(2, banner.getContent());
            st.setString(3, banner.getStartDay());
            st.setString(4, banner.getEndDay());
            st.setInt(5, banner.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from banners where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
