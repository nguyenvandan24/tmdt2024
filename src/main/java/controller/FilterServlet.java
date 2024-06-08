package controller;

import dao.Load;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/filter")
public class FilterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] priceRanges = request.getParameterValues("price");

        List<Product> filteredProducts = new ArrayList<>();
        Load load = new Load();

        if (priceRanges != null) {
            filteredProducts = load.getProductsByMultiplePriceRanges(Arrays.asList(priceRanges));
        } else {
            filteredProducts = load.getAllProduct();
        }

        request.setAttribute("filteredProducts", filteredProducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
