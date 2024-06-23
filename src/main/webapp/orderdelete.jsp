<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="dao.OrderDAO" %>
<%@ page import="model.Order" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int orderId = Integer.parseInt(request.getParameter("orderId"));
    OrderDAO orderDAO = new OrderDAO();
    Order order = orderDAO.getOrderById(orderId);

    if (order == null || order.getUserID() != user.getId()) {
        // Handle error: Order not found or does not belong to the user
        response.sendRedirect("myorders.jsp");
        return;
    }

    // Check if the order status is "Đang xử lý" (Processing)
    if (!order.getStatus().equals("Đang xử lý")) {
        // Handle error: Order cannot be cancelled
        response.sendRedirect("myorders.jsp");
        return;
    }

    // Update order status to "Đã hủy" (Cancelled)
    boolean success = orderDAO.updateOrderStatus(orderId, "Đã hủy");
    if (success) {
        // Success message or redirect to confirmation page
        response.sendRedirect("myorders.jsp");
    } else {
        // Handle error: Update failed
        // You can redirect to an error page or handle it accordingly
        response.sendRedirect("myorders.jsp");
    }
%>
