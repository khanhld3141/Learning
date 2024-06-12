package dal;

import model.Deposit;
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

    public List<Deposit> getAllDeposits(int page,int recordsPerPage) {
        List<Deposit> list = new ArrayList<>();
        String sql = "select Users.*,AmountOfMoney,Status,Deposits.Id as IdD from Deposits \n" +
                "left join Users on Deposits.UserId=Users.Id   ORDER BY Id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
            ResultSet rs = st.executeQuery();
            Deposit deposit = new Deposit();
            while (rs.next()) {
                deposit = new Deposit(
                        rs.getInt("IdD"),
                        rs.getInt("Id"),
                        rs.getInt("AmountOfMoney"),
                        rs.getString("Status")
                );

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
    public List<Deposit> getAllMyDeposits(int userid) {
        List<Deposit> list = new ArrayList<>();
        String sql = "select Deposits.* from Deposits " +
                "where userid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userid);
            ResultSet rs = st.executeQuery();
            Deposit deposit = new Deposit();
            while (rs.next()) {
                deposit = new Deposit(
                        rs.getInt("Id"),
                        rs.getInt("Userid"),
                        rs.getInt("AmountOfMoney"),
                        rs.getString("Status")
                );
                list.add(deposit);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Deposit> searchByName(int page,int recordsPerPage,String name) {
        List<Deposit> list = new ArrayList<>();
        String sql = "select Users.*,AmountOfMoney,Status,Deposits.Id as IdD from Deposits \n" +
                "left join Users on Deposits.UserId=Users.Id where Status like ?  ORDER BY Id OFFSET ? ROWS " +
                "FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (page - 1) * recordsPerPage;
            st.setString(1,"%"+name+"%");
            st.setInt(2, offset);
            st.setInt(3, recordsPerPage);
            ResultSet rs = st.executeQuery();
            Deposit deposit = new Deposit();
            while (rs.next()) {
                deposit = new Deposit(
                        rs.getInt("IdD"),
                        rs.getInt("Id"),
                        rs.getInt("AmountOfMoney"),
                        rs.getString("Status")
                );

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
        String sql = "select Users.*,AmountOfMoney,Status,Deposits.Id as IdD from " +
                "Deposits \n" +
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
                        rs.getString("Status")
                );

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
        String sql = "insert into Deposits (UserId,AmountOfMoney,Status) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Deposit.getUserId());
            st.setInt(2, Deposit.getAmountOfMoney());
            st.setString(3, Deposit.getStatus());
            // Execute the update
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Deposit Deposit) {
        String sql = "update Deposits set UserId=?,AmountOfMoney =?,Status=?  where Id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Deposit.getUserId());
            st.setInt(2, Deposit.getAmountOfMoney());
            st.setString(3, Deposit.getStatus());
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
