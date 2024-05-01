package controller;

import dao.Load;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy ID sản phẩm từ request parameter
        String productId = request.getParameter("id");
        System.out.println("Product ID: " + productId);


        // Kiểm tra xem productId có giá trị không
        if (productId != null && !productId.isEmpty()) {
            // Lấy thông tin chi tiết của sản phẩm từ cơ sở dữ liệu bằng phương thức trong DAO
            Load load = new Load();
            Product product = load.getProductById(productId);

            // Kiểm tra xem sản phẩm có tồn tại không
            if (product != null) {
                // Đặt thông tin chi tiết sản phẩm vào request attribute
                request.setAttribute("product", product);

                // Chuyển hướng (forward) sang trang JSP chi tiết sản phẩm
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            } else {
                // Nếu không tìm thấy sản phẩm, chuyển hướng về trang 404 hoặc trang thông báo lỗi khác
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            // Nếu không có ID sản phẩm, chuyển hướng về trang 404 hoặc trang thông báo lỗi khác
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
