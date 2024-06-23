package service;

import dao.Conn;
import model.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                        rs.getString("email")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void saveReview(Review review) {
        String query = "INSERT INTO rate (userId, productId, content, star, status, name, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getProductId());
            ps.setString(3, review.getContent());
            ps.setInt(4, review.getStar());
            ps.setInt(5, review.getStatus());
            ps.setString(6, review.getName());
            ps.setString(7, review.getEmail());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(getAllReviewsByProductId(1));
    }
}

