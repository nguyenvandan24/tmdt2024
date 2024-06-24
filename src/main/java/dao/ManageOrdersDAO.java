package dao;

import model.Order;
import model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManageOrdersDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    // lây tất cả đơn hàng của các user
    public List<Order> getOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserID(rs.getInt("userID"));
                order.setOrderTime(rs.getTimestamp("orderTime"));
                order.setPhone(rs.getString("phone"));
                order.setProvince(rs.getString("province"));
                order.setDistrict(rs.getString("district"));
                order.setWard(rs.getString("ward"));
                order.setAddress(rs.getString("address"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setTotalCost(rs.getDouble("totalCost"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orders;
    }

    // update trạng thái của đơn hàng
    public boolean updateOrder(int orderId, String newStatus) {
        String query = "UPDATE orders SET status = ? WHERE id = ?";
        boolean success = false;
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            // (rs and ps should be closed here as in other methods)
        }
        return success;
    }

    // lấy thông tin chi tiết của 1 đh
    public Order getOrderById(int orderId) {
        Order order = null;
        String query = "SELECT * FROM orders WHERE id = ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserID(rs.getInt("userID"));
                order.setOrderTime(rs.getTimestamp("orderTime"));
                order.setPhone(rs.getString("phone"));
                order.setProvince(rs.getString("province"));
                order.setDistrict(rs.getString("district"));
                order.setWard(rs.getString("ward"));
                order.setAddress(rs.getString("address"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setTotalCost(rs.getDouble("totalCost"));
                order.setStatus(rs.getString("status"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return order;
    }

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM orderDetail WHERE orderId = ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setDetailID(rs.getInt("detailID"));
                detail.setOrderId(rs.getInt("orderId"));
                detail.setProductID(rs.getInt("productID"));
                detail.setNamePro(rs.getString("namePro"));
                detail.setPrice(rs.getDouble("price"));
                detail.setQuantity(rs.getInt("quantity"));
                orderDetails.add(detail);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orderDetails;
    }
}
