<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ManageOrdersDAO" %>
<%@ page import="model.Order" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Order Status</title>
</head>
<body>
<%
    String orderIdStr = request.getParameter("orderId");
    String newStatus = request.getParameter("status");

    if (orderIdStr != null && newStatus != null) {
        int orderId = Integer.parseInt(orderIdStr);
        ManageOrdersDAO mnorderDAO = new ManageOrdersDAO();
        boolean success = mnorderDAO.updateOrder(orderId, newStatus);

        if (success) {
            response.sendRedirect("manage-or.jsp");
        } else {
            response.sendRedirect("404.jsp");
        }
    } else {
        response.sendRedirect("404.jsp");
    }
%>
</body>
</html>
