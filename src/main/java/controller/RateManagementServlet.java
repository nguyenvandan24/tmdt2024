package controller;

import model.Review;
import service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/reviews")
public class RateManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
    }

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            List<Review> reviews = reviewService.getAllReviews();
        System.out.println("Number of reviews fetched: " + reviews.size()); // Log size of reviews list

            request.setAttribute("reviews", reviews);
            request.getRequestDispatcher("/admin/rateManagement.jsp").forward(request, response);

    }
}

