package model;

public class User {


    private int Id,Balance;
    private String Name,Username, Phone,Role,Email,Password,Avatar;

    public User() {
    }

    public User(int id, int balance, String name, String username, String phone, String role, String email,
                String password) {
        Id = id;
        Balance = balance;
        Name = name;
        Username = username;
        Phone = phone;
        Role = role;
        Email = email;
        Password = password;
    }

    public User(int balance, String name, String username, String phone, String role, String email, String password) {
        Balance = balance;
        Name = name;
        Username = username;
        Phone = phone;
        Role = role;
        Email = email;
        Password = password;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }


    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String role) {
        Role = role;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public int getBalance() {
        return Balance;
    }

    public void setBalance(int balance) {
        Balance = balance;
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setAvatar(String avatar) {
        Avatar = avatar;
    }
}
