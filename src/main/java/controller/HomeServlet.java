    package controller;

    import dao.Load;
    import model.Category;
    import model.Product;

    import javax.servlet.*;
    import javax.servlet.http.*;
    import javax.servlet.annotation.*;
    import java.io.IOException;
    import java.util.List;

    @WebServlet("/HomeServlet")
    public class HomeServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String categoryID = request.getParameter("category");
            if (categoryID != null) {
                // If a category is selected, retrieve products for that category
                List<Product> products = new Load().getProductByCateID(categoryID);
                request.setAttribute("products", products);
            } else {
                // If no category is selected, retrieve all products
                List<Product> products = new Load().getAllProduct();
                request.setAttribute("products", products);
            }

            // Retrieve categories to display in the navbar
            List<Category> categories = new Load().getAllCategory();
            request.setAttribute("categories", categories);

            // Forward the request to index.jsp for rendering
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
        }
    }
