package dao;

import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManageProductsDAO {
    Connection conn;
    PreparedStatement ps;// nem cau lenh query sang sql server
    ResultSet rs;// nhan kq tra ve
    public ManageProductsDAO() {
        try {
            conn = Conn.getconnecttion();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getProductsByPage(int page, int recordsPerPage) {
        List<Product> productList = new ArrayList<>();
        int start = (page - 1) * recordsPerPage;
        String query = "SELECT * FROM products LIMIT ?, ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, start);
            ps.setInt(2, recordsPerPage);
            rs = ps.executeQuery();

            while (rs.next()) {
                int proID = rs.getInt("proID");
                int catID = rs.getInt("catID");
                String namePro = rs.getString("namePro");
                String img = rs.getString("img");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String color = rs.getString("color");
                String size = rs.getString("size");
                int period = rs.getInt("period");
                int quantity = rs.getInt("quantity");

                Product product = new Product(proID, catID, namePro, img, price, description, color, size, period, quantity);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return productList;
    }

    public int getTotalProductCount() {
        int total = 0;
        String query = "SELECT COUNT(*) AS total FROM products";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return total;
    }

//    public List<Product> getAllProducts() {
//        List<Product> productList = new ArrayList<>();
//        String query = "SELECT * FROM products"; // Modify the query as per your database schema
//
//        try {
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                // Retrieve each product's details from the result set
//                int proID = rs.getInt("proID");
//                int catID = rs.getInt("catID");
//                String namePro = rs.getString("namePro");
//                String img = rs.getString("img");
//                double price = rs.getDouble("price");
//                String description = rs.getString("description");
//                String color = rs.getString("color");
//                String size = rs.getString("size");
//                int period = rs.getInt("period");
//                int quantity = rs.getInt("quantity");
//
//                // Create a Product object and add it to the list
//                Product product = new Product(proID, catID, namePro, img, price, description, color, size, period, quantity);
//                productList.add(product);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            // Close resources in a finally block
//            try {
//                if (rs != null) rs.close();
//                if (ps != null) ps.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//
//        return productList;
//    }
}
