package controller;

import model.Cart;
import model.Order;
import model.OrderItem;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/complete")
public class CompleteOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request và session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // Nếu người dùng chưa đăng nhập, có thể chuyển hướng về trang đăng nhập hoặc xử lý khác
            response.sendRedirect("login.jsp");
            return;
        }

        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String paymentMethod = request.getParameter("paymentMethod");
        double totalCost = Double.parseDouble(request.getParameter("totalCost")); // Giả sử tổng chi phí đã được tính toán trước đó
        List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("cartItems");

        // Tạo đối tượng Order
        Order order = new Order();
        order.setPhone(phone);
        order.setAddress(address);
        order.setProvince(province);
        order.setDistrict(district);
        order.setWard(ward);
        order.setPaymentMethod(paymentMethod);
        order.setTotalCost(totalCost);
        order.setOrderItems(orderItems);
        order.setOrderTime(new Timestamp(System.currentTimeMillis())); // Thời gian tạo đơn hàng
        // Trong thực tế, bạn nên có hệ thống tự động tạo ID đơn hàng
        order.setId(1); // ID đơn hàng (mặc định là 1)

        // Lưu thông tin đơn hàng vào session
        session.setAttribute("order", order);

        // Lấy giỏ hàng của người dùng từ session và cập nhật
        Cart cart = (Cart) session.getAttribute("cart_" + user.getId());
        if (cart != null) {
            // Xóa sản phẩm trong giỏ hàng (nếu cần)
            cart.clear();
            // Cập nhật giỏ hàng trong session
            session.setAttribute("cart_" + user.getId(), cart);

            // Cập nhật số lượng sản phẩm trong giỏ hàng
            int itemCount = cart.getTotalItems();
            session.setAttribute("itemCount", itemCount);
        }

        // Chuyển hướng đến trang Đơn hàng của tôi
        response.sendRedirect("myorders.jsp");
    }
}
