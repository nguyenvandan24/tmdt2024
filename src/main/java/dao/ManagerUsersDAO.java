package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManagerUsersDAO {
    Connection conn;
    PreparedStatement ps;// nem cau lenh query sang sql server
    ResultSet rs;// nhan kq tra ve
    public ManagerUsersDAO() {
        try {
            conn = Conn.getconnecttion();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            String query = "SELECT * FROM users";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setUsername(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("upassword"));
                user.setRoles(rs.getInt("roles"));
                users.add(user);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return users;
    }
    public boolean checkUsername(String username) {
        boolean exists = false;
        try {
            // Thực hiện truy vấn SQL
            String query = "SELECT * FROM users WHERE userName = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            // Kiểm tra kết quả trả về
            exists = rs.next(); // Nếu có bản ghi tồn tại, trả về true, ngược lại trả về false
        } catch (Exception ex) {
            // Xử lý ngoại lệ nếu có
            ex.printStackTrace();
            // Có thể ném một ngoại lệ hoặc thông báo lỗi khác tùy thuộc vào yêu cầu
        } finally {
            // Đóng kết nối, PreparedStatement và ResultSet
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return exists;
    }
    public void registerUserAdmin(String fullname, String username, String email, String phone, String address, String password) {
        try {
            // Kiểm tra xem username đã tồn tại hay chưa
            if (!checkUsername(username)) {
                // Nếu username chưa tồn tại, thực hiện truy vấn SQL để đăng ký người dùng mới
                String query = "INSERT INTO users (fullname, userName, email, phone, address, upassword, roles ) VALUES (?, ?, ?, ?, ?, ?, 1)";
                ps = conn.prepareStatement(query);
                ps.setString(1, fullname);
                ps.setString(2, username);
                ps.setString(3, email);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setString(6, password);

                // Thực hiện truy vấn INSERT
                ps.executeUpdate();
            } else {
                // Nếu username đã tồn tại, in ra thông báo lỗi
                System.out.println("Username already exists.");
            }
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
