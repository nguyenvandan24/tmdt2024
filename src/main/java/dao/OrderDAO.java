package dao;

import model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    // Save Order to Database
    public void saveOrder(Order order) {
        String query = "INSERT INTO orders (userID, orderTime, phone, province, district, ward, address, paymentMethod, totalCost, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new Conn().getconnecttion();// mo ket noi
            ps = conn.prepareStatement(query);// nem lenh query
//            rs = ps.executeQuery();

            ps.setInt(1, order.getUserID());
            ps.setTimestamp(2, order.getOrderTime());
            ps.setString(3, order.getPhone());
            ps.setString(4, order.getProvince());
            ps.setString(5, order.getDistrict());
            ps.setString(6, order.getWard());
            ps.setString(7, order.getAddress());
            ps.setString(8, order.getPaymentMethod());
            ps.setDouble(9, order.getTotalCost());
            ps.setString(10, order.getStatus());


            // Execute update
            ps.executeUpdate();
        } catch (Exception ex) {
            // Xử lý ngoại lệ nếu có
            ex.printStackTrace();
            // Có thể ném một ngoại lệ hoặc thông báo lỗi khác tùy thuộc vào yêu cầu
        } finally {
            // Đóng PreparedStatement
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
