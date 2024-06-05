package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
    private static Connection connection;

    public static Connection getconnecttion()throws ClassNotFoundException, SQLException {
        if(connection != null){
            return connection;
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/tmdt";
            String user = "root";
            String pass = "24082002";
//            String pass = "1234567890";

            connection =  DriverManager.getConnection(url, user, pass);
            return connection;

        } catch (ClassNotFoundException e) {
            System.out.println("Error");
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) throws ClassNotFoundException {
		// TODO Auto-generated method stub
        try (Connection con = Conn.getconnecttion()) {
            System.out.println("Kết nối thnhf công");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
