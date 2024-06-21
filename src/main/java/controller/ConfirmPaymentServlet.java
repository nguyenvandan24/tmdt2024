package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/confirm")
public class ConfirmPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");

        // Lưu địa chỉ vào session
        HttpSession session = request.getSession();

        session.setAttribute("phone", phone);
        session.setAttribute("province", province);
        session.setAttribute("district", district);
        session.setAttribute("ward", ward);
        session.setAttribute("address", address);

        // Chuyển hướng đến trang Xác nhận thanh toán
        response.sendRedirect("confirm.jsp");
    }
}

