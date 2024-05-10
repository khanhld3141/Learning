package dal;

import model.Voucher;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VoucherDAO extends DBContext{
    public VoucherDAO(){
        super();
    }
    public List<Voucher> getAllVouchers(int page, int recordsPerPage ){
        List <Voucher> list = new ArrayList<>();
        String sql = "select * from Vouchers  ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Voucher Voucher = new Voucher(
                        rs.getString("Code"),
                        rs.getString("StartDay"),
                        rs.getString("EndDay"),
                        rs.getInt("Id"),
                        rs.getInt("Quantity"),
                        rs.getInt("Used"),
                        rs.getInt("Discount")
                );
                list.add(Voucher);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Voucher> searchByName(String name){
        List <Voucher> list = new ArrayList<>();
        String sql = "select * from Vouchers where code like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Voucher Voucher = new Voucher(
                        rs.getString("Code"),
                        rs.getString("StartDay"),
                        rs.getString("EndDay"),
                        rs.getInt("Id"),
                        rs.getInt("Quantity"),
                        rs.getInt("Used"),
                        rs.getInt("Discount")
                );
                list.add(Voucher);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Voucher findCode(String code){
        String sql = "select * from Vouchers where code=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Voucher Voucher = new Voucher(
                        rs.getString("Code"),
                        rs.getString("StartDay"),
                        rs.getString("EndDay"),
                        rs.getInt("Id"),
                        rs.getInt("Quantity"),
                        rs.getInt("Used"),
                        rs.getInt("Discount")
                );
               return Voucher;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Voucher get(int id) {
        String sql = "select * from Vouchers where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Voucher Voucher = new Voucher(
                        rs.getString("Code"),
                        rs.getString("StartDay"),
                        rs.getString("EndDay"),
                        rs.getInt("Id"),
                        rs.getInt("Quantity"),
                        rs.getInt("Used"),
                        rs.getInt("Discount")
                );
                return Voucher;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Voucher Voucher) {
        String sql = "insert into Vouchers (Code,Quantity,Used,Discount,StartDay,EndDay) values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,Voucher.getCode());
            st.setInt(2, Voucher.getQuantity());
            st.setInt(3, Voucher.getUsed());
            st.setInt(4, Voucher.getDiscount());
            st.setString(5, Voucher.getStartDay());
            st.setString(6, Voucher.getEndDay());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Voucher Voucher) {
        String sql = "update Vouchers set Code=?,Quantity=?,Used=?,Discount=?,StartDay=?,EndDay=? where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,Voucher.getCode());
            st.setInt(2, Voucher.getQuantity());
            st.setInt(3, Voucher.getUsed());
            st.setInt(4, Voucher.getDiscount());
            st.setString(5, Voucher.getStartDay());
            st.setString(6, Voucher.getEndDay());
            st.setInt(7, Voucher.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Vouchers where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
