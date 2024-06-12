package controller;

import com.google.gson.JsonObject;
import model.Cart;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateCartQuantityServlet")
public class UpdateCartQuantityServlet extends HttpServlet {
    //    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String productIdParam = request.getParameter("productId");
//        String quantityParam = request.getParameter("quantity");
//
//        if (productIdParam == null || quantityParam == null) {
//            response.sendRedirect("cart.jsp");
//            return;
//        }
//
//        int productId = Integer.parseInt(productIdParam);
//        int quantity = Integer.parseInt(quantityParam);
//
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//
//        if (user != null) {
//            Cart cart = (Cart) session.getAttribute("cart_" + user.getId());
//            if (cart != null) {
//                cart.updateItemQuantity(productId, quantity);
//                session.setAttribute("cart_" + user.getId(), cart);
//                response.setContentType("application/json");
//                response.getWriter().write("{\"success\": true}");
//                return;
//            }
//        }
//
//        response.setContentType("application/json");
//        response.getWriter().write("{\"success\": false}");
//    }
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy productId và số lượng mới từ request
//        String productId = request.getParameter("productId");
//        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
//
//        // Lấy giỏ hàng từ session
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        Cart cart = (Cart) session.getAttribute("cart_" + user.getId());
//
//        // Kiểm tra nếu giỏ hàng không tồn tại hoặc sản phẩm không tồn tại trong giỏ hàng
//        if (cart == null || !cart.getItems().containsKey(productId)) {
//            response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Trả về mã lỗi 404 nếu không tìm thấy sản phẩm hoặc giỏ hàng
//            return;
//        }
//
//        // Cập nhật số lượng cho sản phẩm trong giỏ hàng
//        cart.updateQuantity(productId, newQuantity);
//
//        // Trả về dữ liệu JSON với giá mới của sản phẩm và tổng cộng của giỏ hàng
//        double totalPrice = cart.getItems().get(productId).getProduct().getPrice() * newQuantity;
//        double totalCost = cart.getTotalCost();
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        out.print("{\"totalPrice\": " + totalPrice + ", \"totalCost\": " + totalCost + "}");
//        out.flush();
//    }
//}
//
//
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy productId và số lượng mới từ request
        String productId = request.getParameter("productId");
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart_" + user.getId());

        // Kiểm tra nếu giỏ hàng không tồn tại hoặc sản phẩm không tồn tại trong giỏ hàng
        if (cart == null || !cart.getItems().containsKey(productId)) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Trả về mã lỗi 404 nếu không tìm thấy sản phẩm hoặc giỏ hàng
            return;
        }

        // Cập nhật số lượng cho sản phẩm trong giỏ hàng
        cart.updateQuantity(productId, newQuantity);

        // Tính toán lại tổng giá trị và giá tiền sản phẩm
        double totalProductCost = cart.getTotalCost();
        double totalAmount = totalProductCost + 10000; // Phí ship là 10000
        double productCost = cart.getItems().get(productId).getProduct().getPrice() * newQuantity;

        // Tạo đối tượng JSON chứa dữ liệu mới
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("totalProductCost", totalProductCost);
        jsonResponse.addProperty("totalAmount", totalAmount);
//        jsonResponse.addProperty("productCost", cart.getItems().get(productId).getProduct().getPrice() * newQuantity);
        jsonResponse.addProperty("productCost", productCost);

        // Gửi phản hồi JSON về client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}