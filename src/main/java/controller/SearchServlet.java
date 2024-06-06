package controller;

import dao.Load;
import model.Product;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ensure proper encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String txtSearch = request.getParameter("txtSearch");
        // Debug statement to check the search parameter
        System.out.println("Search query: " + txtSearch);

        Load dao = new Load();
        List<Product> search_products = dao.searchByName(txtSearch);

        // Debug statement to check the search results
        System.out.println("Number of products found: " + search_products.size());

        request.setAttribute("search_products", search_products);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
}