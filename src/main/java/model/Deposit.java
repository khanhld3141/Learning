package model;

public class Deposit {

    private int Id,UserId,AmountOfMoney,StatusId;
    private User user;
    private Status status;
    public Deposit() {
        user = new User();
    }

    public Deposit(int userId, int amountOfMoney, int status) {
        UserId = userId;
        AmountOfMoney = amountOfMoney;
        this.StatusId = status;
        user = new User();
    }

    public Deposit(int id, int userId, int amountOfMoney, int status) {
        Id = id;
        UserId = userId;
        AmountOfMoney = amountOfMoney;
        this.StatusId = status;
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

    public int getStatusId() {
        return StatusId;
    }

    public void setStatusId(int statusId) {
        StatusId = statusId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
