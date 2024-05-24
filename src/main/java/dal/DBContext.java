package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=db4;encrypt=false";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String username = "sa";
            String password = "giabao123123";
            connection = DriverManager.getConnection(url, username , password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

    }
}
