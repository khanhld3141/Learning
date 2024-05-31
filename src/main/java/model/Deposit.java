package model;

public class Deposit {

    private int Id,UserId,AmountOfMoney;
    private String Status;
    private User user;

    public Deposit() {
        user = new User();
    }

    public Deposit(int userId, int amountOfMoney, String status) {
        UserId = userId;
        AmountOfMoney = amountOfMoney;
        this.Status = status;
        user = new User();
    }

    public Deposit(int id, int userId, int amountOfMoney, String status) {
        Id = id;
        UserId = userId;
        AmountOfMoney = amountOfMoney;
        this.Status = status;
        user = new User();
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getAmountOfMoney() {
        return AmountOfMoney;
    }

    public void setAmountOfMoney(int amountOfMoney) {
        AmountOfMoney = amountOfMoney;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
