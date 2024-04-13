package dal;

import model.Deposit;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepositDAO extends DBContext{
    public DepositDAO(){
        super();
    }
    public List<Deposit> getAllDeposits(){
        List <Deposit> list = new ArrayList<>();
        String sql = "select * from Deposits";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Deposit Deposit = new Deposit(
                        rs.getInt("Id"),
                        rs.getInt("UserId"),
                        rs.getInt("AmountOfMoney"),
                        rs.getInt("StatusId")
                );
                list.add(Deposit);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Deposit get(int id) {
        String sql = "select * from Deposits where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Deposit Deposit = new Deposit(
                        rs.getInt("Id"),
                        rs.getInt("UserId"),
                        rs.getInt("AmountOfMoney"),
                        rs.getInt("StatusId")
                );
                return Deposit;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void create(Deposit Deposit) {
        String sql = "insert into Deposits (UserId,AmountOfMoney,StatusId) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Deposit.getUserId());
            st.setInt(2, Deposit.getAmountOfMoney());
            st.setInt(3, Deposit.getStatusId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Deposit Deposit) {
        String sql = "update Deposits UserId=?,AmountOfMoney =?,StatusId=?  where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Deposit.getUserId());
            st.setInt(2, Deposit.getAmountOfMoney());
            st.setInt(3, Deposit.getStatusId());
            st.setInt(4, Deposit.getId());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "delete from Deposits where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
