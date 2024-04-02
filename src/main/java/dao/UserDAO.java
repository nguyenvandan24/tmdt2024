package dao;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    Connection conn;
    PreparedStatement ps;// nem cau lenh query sang sql server
    ResultSet rs;// nhan kq tra ve
    public UserDAO() {
        try {
            conn = Conn.getconnecttion();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
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
    public void registerUser(String fullname, String username, String email, String phone, String address, String password) {
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
    public User login(String uname, String pass) {
        String query = "SELECT * FROM USERS WHERE userName = ? and upassword = ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("fullname"),
                        rs.getString("userName"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("upassword"),
                        rs.getInt("roles")
                );
            }
        } catch (Exception e) {

        }
        return null;

    }


}
