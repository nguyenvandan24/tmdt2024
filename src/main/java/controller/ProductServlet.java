package controller;

import dao.Load;
import model.Product;
import model.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        Load load = new Load();
        List<Product> list = load.getAllProduct();
        request.setAttribute("listP", list);

        // Lấy danh sách các danh mục từ cơ sở dữ liệu
        List<Category> categories = load.getAllCategory();
        request.setAttribute("categories", categories);

        // Lấy ID danh mục từ tham số yêu cầu
        String categoryId = request.getParameter("cid");

        if (categoryId != null && !categoryId.isEmpty()) {
            // Tải danh sách sản phẩm dựa trên ID danh mục
            List<Product> products = load.getProductByCateID(categoryId);
            request.setAttribute("products", products);
            // Lấy tên danh mục từ ID danh mục để hiển thị
            Category category = load.getCategoryById(categoryId);
            request.setAttribute("categoryName", category.getNameCate());
        }

        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
