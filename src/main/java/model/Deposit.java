package model;

public class Deposit {

    private int Id,UserId,AmountOfMoney,StatusId;

    public Deposit() {
    }

    public Deposit(int userId, int amountOfMoney, int statusId) {
        UserId = userId;
        AmountOfMoney = amountOfMoney;
        StatusId = statusId;
    }

    public Deposit(int id, int userId, int amountOfMoney, int statusId) {
        Id = id;
        UserId = userId;
        AmountOfMoney = amountOfMoney;
        StatusId = statusId;
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
}