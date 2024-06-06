package dao;

import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Load {
    Connection conn;
    PreparedStatement ps;// nem cau lenh query sang sql server
    ResultSet rs;// nhan kq tra ve
    public static Map<String, Product> mapProduct = loadData();
    public static Map<String, Product> loadData(){
        Map<String, Product> mapTemp = new HashMap<String, Product>();
        try{
            String query = "select * from PRODUCTS";
            Connection conn = new Conn().getconnecttion();// mo ket noi
            PreparedStatement ps = conn.prepareStatement(query);// nem lenh query
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Integer proID = rs.getInt(1);
                Integer catID = rs.getInt(2);
                String namePro = rs.getString(3);
                String img = rs.getString(4);
                Double price = rs.getDouble(5);
                String description = rs.getString(6);
                String color = rs.getString(7);
                String size = rs.getString(8);
                Integer period = rs.getInt(9);
                Integer quantity = rs.getInt(10);


                Product product = new Product(proID, proID, namePro, img, price, description,color,size,period,quantity);
                mapTemp.put(Integer.toString(product.getProID()), product);

            }
        } catch(Exception e){

        }
        return mapTemp;
    }
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();// danh sach product
        String query = "select * from PRODUCTS";
        try {
            conn = new Conn().getconnecttion();// mo ket noi
            ps = conn.prepareStatement(query);// nem lenh query
            rs = ps.executeQuery();
            while (rs.next())
                list.add(new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10)
                        ));

        } catch (Exception e) {

        }

        return list;
    }
    // lấy all các danh mục
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn =new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next())
                list.add(new Category(rs.getInt(1), rs.getString(2)));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // lấy sp theo Cate
    public List<Product> getProductByCateID(String cid) {
        List<Product> list = new ArrayList<>();// danh sach san pham
        String query = "select * from PRODUCTS where catID= ?";
        try {
            conn = new Conn().getconnecttion();// mo ket noi
            ps = conn.prepareStatement(query);// nem lenh query
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next())
                list.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5),rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getInt(9),rs.getInt(10)));

        } catch (Exception e) {

        }

        return list;
    }

    // lay sp theo product id
    public Product getProductById(String proID) {
        String query = "select * from PRODUCTS where proID= ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setString(1, proID);
            rs = ps.executeQuery();
            while (rs.next())
                return new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5),rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getInt(9),rs.getInt(10));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public Category getCategoryById(String categoryId) {
        String query = "select * from category where catID=?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setCatID(rs.getInt("catID"));
                category.setNameCate(rs.getString("nameCate"));
                // Các thông tin khác của thể loại sản phẩm có thể thêm vào đây
                return category;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //tìm kiem
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM PRODUCTS WHERE namePro LIKE ?";
        try {
            conn = new Conn().getconnecttion();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // Debug statement to check the list size
        System.out.println("Number of products found: " + list.size());
        return list;
    }
}