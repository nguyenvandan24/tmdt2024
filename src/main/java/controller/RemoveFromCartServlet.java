package controller;

import dao.Load;
import model.Cart;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy productId từ request
        String productIdParam = request.getParameter("productId");

        if (productIdParam == null || productIdParam.isEmpty()) {
            response.sendRedirect("cart.jsp"); // Chuyển hướng đến trang giỏ hàng nếu không có productId
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        // Lấy session và người dùng hiện tại
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            // Lấy giỏ hàng của người dùng từ session
            Cart cart = (Cart) session.getAttribute("cart_" + user.getId());

            if (cart != null) {
                // Xóa sản phẩm khỏi giỏ hàng
                cart.removeItem(productId);
                // Cập nhật số lượng sản phẩm trong giỏ hàng
                int itemCount = cart.getTotalItems();
                session.setAttribute("itemCount", itemCount);

                // Cập nhật giỏ hàng trong session
                session.setAttribute("cart_" + user.getId(), cart);
            }
        }

        // Chuyển hướng người dùng đến trang giỏ hàng sau khi xóa
        response.sendRedirect("cart.jsp");
    }
}