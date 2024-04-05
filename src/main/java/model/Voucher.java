package model;

public class Voucher {
    private String Code,StartDay,EndDay;
    private int Id,Quantity,Used,Discount;
    public Voucher(){

    }

    public Voucher(String code, String startDay, String endDay, int id, int quantity, int used, int discount) {
        Code = code;
        StartDay = startDay;
        EndDay = endDay;
        Id = id;
        Quantity = quantity;
        Used = used;
        Discount = discount;
    }

    public Voucher(String code, String startDay, String endDay, int quantity, int used, int discount) {
        Code = code;
        StartDay = startDay;
        EndDay = endDay;
        Quantity = quantity;
        Used = used;
        Discount = discount;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getStartDay() {
        return StartDay;
    }

    public void setStartDay(String startDay) {
        StartDay = startDay;
    }

    public String getEndDay() {
        return EndDay;
    }

    public void setEndDay(String endDay) {
        EndDay = endDay;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public int getUsed() {
        return Used;
    }

    public void setUsed(int used) {
        Used = used;
    }

    public int getDiscount() {
        return Discount;
    }

    public void setDiscount(int discount) {
        Discount = discount;
    }
}
