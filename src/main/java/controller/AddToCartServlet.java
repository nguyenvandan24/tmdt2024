package controller;


import dao.Load;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/cartServlet")
public class AddToCartServlet extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Lấy session hiện tại hoặc tạo mới nếu không tồn tại
    HttpSession session = request.getSession();
    // Kiểm tra người dùng từ session
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Chuyển hướng đến trang đăng nhập nếu người dùng chưa đăng nhập
        return;
    }

    // Tạo key cho giỏ hàng của người dùng
        String cartKey = "cart_" + user.getId();

        // Lấy giỏ hàng từ session
        Cart cart = (Cart) session.getAttribute(cartKey);
        if (cart == null) {
            cart = new Cart();
            session.setAttribute(cartKey, cart);
        }
        // Lấy giỏ hàng từ session
//        Cart cart = (Cart) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new Cart();
//            session.setAttribute("cart", cart);
//        }

    // Lấy productId từ tham số yêu cầu và kiểm tra
    String productIdParam = request.getParameter("productId");
    if (productIdParam == null || productIdParam.isEmpty()) {
        response.sendRedirect("product.jsp");
        return;
    }
    int productId = Integer.parseInt(productIdParam);
    Load load = new Load();
    Product product = load.getProductById(String.valueOf(productId));

    // Kiểm tra nếu sản phẩm tồn tại và thêm vào giỏ hàng
    if (product != null) {
        cart.addItem(product, 1);
    } else {
        // Xử lý khi sản phẩm không tìm thấy
        response.sendRedirect("error.jsp");
        return;
    }
    // Cập nhật số lượng sản phẩm trong giỏ hàng
    int itemCount = cart.getTotalItems(); // Assuming getTotalItems() returns the count of items in the cart

    // Set itemCount as a session attribute
    session.setAttribute("itemCount", itemCount);


    // Chuyển hướng người dùng đến trang giỏ hàng để xem giỏ hàng cập nhật
    response.sendRedirect("cart.jsp");
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
