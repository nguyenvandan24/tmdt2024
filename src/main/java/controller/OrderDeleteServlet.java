package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.OrderDAO;

@WebServlet("/orderdelete")
public class OrderDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request if needed
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request to delete order
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Common processing logic for both GET and POST requests
        String orderIdStr = request.getParameter("orderId");
        if (orderIdStr == null || orderIdStr.isEmpty()) {
            response.sendRedirect("myorders.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(orderIdStr);

            OrderDAO orderDAO = new OrderDAO();
            boolean success = orderDAO.updateOrderStatus(orderId, "Đã hủy");

            if (success) {
                response.sendRedirect("myorders.jsp");
            } else {
                response.sendRedirect("myorders.jsp"); // or handle failure scenario
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("myorders.jsp"); // handle invalid orderId
        }
    }
}

