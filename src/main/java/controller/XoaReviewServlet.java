package controller;

import service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/deleteReview")
public class XoaReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReviewService reviewService;

    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        String reviewIdStr = request.getParameter("reviewId");
//        if (reviewIdStr != null && !reviewIdStr.isEmpty()) {
//            try {
//                int reviewId = Integer.parseInt(reviewIdStr);
//
//                // Xóa đánh giá khỏi cơ sở dữ liệu
//                boolean isDeleted = reviewService.deleteReviewById(reviewId);
//
//                // Log kết quả và chuyển hướng
//                System.out.println("Review deleted: " + isDeleted);
//            } catch (NumberFormatException e) {
//                e.printStackTrace();
//                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid review ID format.");
//                return;
//            } catch (Exception e) {
//                e.printStackTrace();
//                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete review.");
//                return;
//            }
//        } else {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Review ID is required.");
//            return;
//        }
//
//        // Chuyển hướng đến trang quản lý đánh giá
//        response.sendRedirect(request.getContextPath() + "/admin/reviews");
//    }
        int reviewId = Integer.parseInt(request.getParameter("reviewId"));

        // Xóa review từ cơ sở dữ liệu
        boolean isDeleted = reviewService.deleteReviewById(reviewId);

        // Gửi kết quả về cho Ajax
        if (isDeleted) {
            response.getWriter().write("Review deleted successfully");
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.getWriter().write("Failed to delete review");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}