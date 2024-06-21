package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/address")
public class AddressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
//        String totalCost = request.getParameter("totalCost");
        String phone = request.getParameter("phone");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String address = request.getParameter("address");

        // Lưu vào session để sử dụng sau này
        HttpSession session = request.getSession();
//        session.setAttribute("totalCost", totalCost);
        session.setAttribute("phone", phone);
        session.setAttribute("province", province);
        session.setAttribute("district", district);
        session.setAttribute("ward", ward);
        session.setAttribute("address", address);

        // Chuyển hướng đến trang Địa chỉ giao hàng
        response.sendRedirect("address.jsp");
    }
}


