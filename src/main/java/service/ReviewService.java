package service;

import dao.Conn;
import model.Review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewService {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;

    public static List<Review> getAllReviewsByProductId(int productId) {
        List<Review> list = new ArrayList<>();
        String query = "SELECT * FROM rate WHERE productId = ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(
                        rs.getInt("userId"),
                        rs.getInt("productId"),
                        rs.getString("content"),
                        rs.getInt("star"),
                        rs.getInt("status"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getTimestamp("date")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static Review getReviewById(int rateId) {
        Review review = null;
        String query = "SELECT * FROM rate WHERE rateId = ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, rateId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                review = new Review(
                        rs.getInt("rateId"),
                        rs.getInt("userId"),
                        rs.getInt("productId"),
                        rs.getString("content"),
                        rs.getInt("star"),
                        rs.getInt("status"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getTimestamp("date")
                );
            }
            // Close resources
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return review;
    }

    public void saveReview(int userId, int productId, String content, int star, int status, String name, String email, Timestamp date) {
        String query = "INSERT INTO rate (userId, productId, content, star, status, name, email, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setString(3, content);
            ps.setInt(4, star);
            ps.setInt(5, status);
            ps.setString(6, name);
            ps.setString(7, email);
            ps.setTimestamp(8, new Timestamp(date.getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        System.out.println(getAllReviewsByProductId(1));
        System.out.println(getReviewById(3));

    }
}

