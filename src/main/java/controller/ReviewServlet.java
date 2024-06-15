package controller;

import com.google.gson.Gson;
import model.Review;
import model.User;
import service.ReviewService;
import model.User;
import model.Review;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("id"));
        String content = request.getParameter("content");
        int star = Integer.parseInt(request.getParameter("star"));
        int status = 1; // Assuming status = 1 means the review is active.
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Đảm bảo dữ liệu được truyền vào với định dạng UTF-8
        content = new String(content.getBytes("ISO-8859-1"), "UTF-8");
        name = new String(name.getBytes("ISO-8859-1"), "UTF-8");

        Review review = new Review(user.getId(), productId, content, star, status, name, email);

        reviewService.saveReview(review);

        // Load all reviews for the product
        List<Review> reviews = reviewService.getAllReviewsByProductId(productId);

        // Save reviews in the session
        HttpSession session = request.getSession();
        session.setAttribute("reviews", reviews);

        // Redirect to the product detail page with the reviews
        response.sendRedirect("DetailServlet?id=" + productId);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        List<Review> reviews = reviewService.getAllReviewsByProductId(productId);

        // Convert reviews list to JSON
        Gson gson = new Gson();
        String jsonReviews = gson.toJson(reviews);

        // Set content type and write JSON to response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonReviews);
    }
}


