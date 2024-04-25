package dal;

import model.Deposit;
import model.Status;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepositDAO extends DBContext {
    public DepositDAO() {
        super();
    }

    public List<Deposit> getAllDeposits() {
        List<Deposit> list = new ArrayList<>();
        String sql = "select Users.*,AmountOfMoney,StatusId,Statuss.Name as NameStatus,Deposits.Id as IdD from Deposits \n" +
                "left join Statuss on Deposits.StatusId=Statuss.Id\n" +
                "left join Users on Deposits.UserId=Users.Id";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Deposit deposit = new Deposit();
            while (rs.next()) {
                deposit = new Deposit(
                        rs.getInt("IdD"),
                        rs.getInt("Id"),
                        rs.getInt("AmountOfMoney"),
                        rs.getInt("StatusId")
                );
                deposit.setStatus(new Status(
                        rs.getInt("StatusId"),
                        rs.getString("NameStatus")
                ));
                deposit.setUser(new User(
                        rs.getInt("Id"),
                        rs.getInt("Balance"),
                        rs.getString("Name"),
                        rs.getString("Username"),
                        rs.getString("Phone"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        ""
                ));
                list.add(deposit);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Deposit get(int id) {
        List<Deposit> list = new ArrayList<>();
        String sql = "select Users.*,AmountOfMoney,StatusId,Statuss.Name as NameStatus,Deposits.Id as IdD from Deposits \n" +
                "left join Statuss on Deposits.StatusId=Statuss.Id\n" +
                "left join Users on Deposits.UserId=Users.Id WHERE  Deposits.Id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,id);
            ResultSet rs = st.executeQuery();
            Deposit deposit = new Deposit();
            while (rs.next()) {
                deposit = new Deposit(
                        rs.getInt("IdD"),
                        rs.getInt("Id"),
                        rs.getInt("AmountOfMoney"),
                        rs.getInt("StatusId")
                );
                deposit.setStatus(new Status(
                        rs.getInt("StatusId"),
                        rs.getString("NameStatus")
                ));
                deposit.setUser(new User(
                        rs.getInt("Id"),
                        rs.getInt("Balance"),
                        rs.getString("Name"),
                        rs.getString("Username"),
                        rs.getString("Phone"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        ""
                ));
                return deposit;
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
        String sql = "update Deposits set UserId=?,AmountOfMoney =?,StatusId=?  where Id=? ";
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
