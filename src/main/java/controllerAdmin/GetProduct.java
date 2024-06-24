package controllerAdmin;

import dao.ManageProductsDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getPro")
public class GetProduct extends HttpServlet {
    private static final int RECORDS_PER_PAGE = 5;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        ManageProductsDAO productsDAO = new ManageProductsDAO();
        List<Product> productList = productsDAO.getProductsByPage(page, RECORDS_PER_PAGE);
        int totalRecords = productsDAO.getTotalProductCount();
        int totalPages = (int) Math.ceil(totalRecords * 1.0 / RECORDS_PER_PAGE);

        request.setAttribute("productList", productList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/admin/manage-pro.jsp").forward(request, response);
    }
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//
//        // Create instance of ManageProductsDAO to fetch products
//        ManageProductsDAO productsDAO = new ManageProductsDAO();
//        List<Product> productList = productsDAO.getAllProducts();
//
//        // Set productList as attribute in request
//        request.setAttribute("productList", productList);
//
//        // Forward the request to a JSP page to display the products
//        request.getRequestDispatcher("/admin/manage-pro.jsp").forward(request, response);
//    }


}
