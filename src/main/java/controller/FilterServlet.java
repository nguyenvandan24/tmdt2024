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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] priceRanges = request.getParameterValues("price");
        List<String> priceRangeList = (priceRanges != null) ? Arrays.asList(priceRanges) : new ArrayList<>();

        String[] colors = request.getParameterValues("color");
        List<String> colorList = (colors != null) ? Arrays.asList(colors) : new ArrayList<>();

        Load load = new Load();
        List<Product> filteredProducts = load.getProductsByMultipleFilters(priceRangeList, colorList);

        request.setAttribute("productList", filteredProducts);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
