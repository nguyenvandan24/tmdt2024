package dao;

import model.Order;
import model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    // Save Order to Database
    public int saveOrder(Order order) {
        String query = "INSERT INTO orders (userID, orderTime, phone, province, district, ward, address, paymentMethod, totalCost, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int orderId = -1;
        try {
            conn = new Conn().getconnecttion();// mo ket noi
            ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);// nem lenh query
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

            // Lấy ID tự động sinh
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1); // Lấy ID của đơn hàng
            }
        } catch (Exception ex) {
            // Xử lý ngoại lệ nếu có
            ex.printStackTrace();
            // Có thể ném một ngoại lệ hoặc thông báo lỗi khác tùy thuộc vào yêu cầu
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            // Đóng PreparedStatement
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orderId;
    }

    // Lưu chi tiết đơn hàng vào cơ sở dữ liệu
    public void saveOrderDetail(OrderDetail detail) {
        String query = "INSERT INTO orderDetail (orderId, productID, namePro, price, quantity) VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new Conn().getconnecttion(); // Mở kết nối
            ps = conn.prepareStatement(query); // Chuẩn bị lệnh SQL

            ps.setInt(1, detail.getOrderId());         // Order ID (foreign key)
            ps.setInt(2, detail.getProductID()); // Product ID
            ps.setString(3, detail.getNamePro()); // Product name
            ps.setDouble(4, detail.getPrice());   // Product price
            ps.setInt(5, detail.getQuantity());  // Quantity ordered

            // Thực thi lệnh SQL
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
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

    // Get Orders by User ID
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE userID = ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
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

    // Retrieve Order by ID
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

    // Retrieve Order Details by Order ID
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

    // Update Order Status
    public boolean updateOrderStatus(int orderId, String newStatus) {
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

    // Xóa đơn hàng
    public boolean deleteOrder(int orderId) {
        String deleteOrderQuery = "DELETE FROM orders WHERE id = ?";
        boolean success = false;
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(deleteOrderQuery);
            ps.setInt(1, orderId);
            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return success;
    }
}
