package controller;

import dao.OrderDAO;
import model.Cart;
import model.Order;
import model.OrderDetail;
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
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy thông tin từ session và form

        // Retrieve product details
        String[] productIds = request.getParameterValues("productId");
//        String[] productImgs = request.getParameterValues("productImg");
        String[] productNames = request.getParameterValues("productName");
        String[] productPrices = request.getParameterValues("productPrice");
        String[] productQuantities = request.getParameterValues("productQuantity");

        String phone = (String) session.getAttribute("phone");
        String province = (String) session.getAttribute("province");
        String district = (String) session.getAttribute("district");
        String ward = (String) session.getAttribute("ward");
        String address = (String) session.getAttribute("address");
        String paymentMethod = request.getParameter("paymentMethod");
        double totalCost = Double.parseDouble(request.getParameter("totalCost"));
//        List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("cartItems");

//        if (orderItems == null || orderItems.isEmpty()) {
//            session.setAttribute("orderError", "Giỏ hàng trống. Vui lòng thêm sản phẩm vào giỏ hàng trước khi đặt hàng.");
//            response.sendRedirect("cart.jsp"); // Redirect to the cart page
//            return;
//        }

        // Tạo đối tượng Order
        Order order = new Order();
        order.setUserID(user.getId());
        order.setPhone(phone);
        order.setProvince(province);
        order.setDistrict(district);
        order.setWard(ward);
        order.setAddress(address);
        order.setPaymentMethod(paymentMethod);
        order.setTotalCost(totalCost);
        order.setOrderTime(new Timestamp(System.currentTimeMillis()));
//        order.setOrderItems(orderItems);
        order.setStatus("Dang xu ly");

        try {
            int orderId = orderDAO.saveOrder(order);

            // Lưu chi tiết đơn hàng
            if (orderId != -1) {
                // Lưu chi tiết đơn hàng
                for (int i = 0; i < productIds.length; i++) {
                    OrderDetail detail = new OrderDetail();
                    detail.setOrderId(orderId);
                    detail.setProductID(Integer.parseInt(productIds[i]));
                    detail.setNamePro(productNames[i]);
                    detail.setPrice(Double.parseDouble(productPrices[i]));
                    detail.setQuantity(Integer.parseInt(productQuantities[i]));

                    orderDAO.saveOrderDetail(detail);
                }

                Cart cart = (Cart) session.getAttribute("cart_" + user.getId());
                if (cart != null) {
                    cart.clear();
                    session.setAttribute("cart_" + user.getId(), cart);
                    session.setAttribute("itemCount", cart.getTotalItems());
                }

                session.setAttribute("orderSuccess", "Đặt hàng thành công!");
                response.sendRedirect("myorders.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("confirm.jsp");
        }
    }
}
