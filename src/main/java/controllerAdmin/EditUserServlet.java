package controllerAdmin;

import dao.ManagerUsersDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/lockUser")
public class EditUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));

        // Call DAO method to lock user
        ManagerUsersDAO dao = new ManagerUsersDAO();
        dao.lockUser(userId);

        // Redirect back to user management page
        response.sendRedirect(request.getContextPath() + "/showUsersAdmin");
    }

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy thông tin từ request
//        int userId = Integer.parseInt(request.getParameter("userId"));
//        String action = request.getParameter("action");
//
//        // Kiểm tra action để xác định hành động (lock hoặc unlock)
//        if ("lock".equals(action)) {
//            lockUser(request, response, userId);
//        } else if ("unlock".equals(action)) {
//            unlockUser(request, response, userId);
//        } else {
//            response.sendRedirect(request.getContextPath() + "/admin/showUsersAdmin");
//        }
//    }
//
//    private void lockUser(HttpServletRequest request, HttpServletResponse response, int userId) throws ServletException, IOException {
//        ManagerUsersDAO managerUsersDAO = new ManagerUsersDAO();
//        boolean success = managerUsersDAO.lockUserAccount(userId);
//
//        JSONObject jsonResponse = new JSONObject();
//        if (success) {
//            jsonResponse.put("status", "success");
//        } else {
//            jsonResponse.put("status", "error");
//            jsonResponse.put("message", "Failed to lock user account.");
//        }
//
//        response.setContentType("application/json");
//        PrintWriter out = response.getWriter();
//        out.print(jsonResponse.toString());
//        out.flush();
//    }
//
//    private void unlockUser(HttpServletRequest request, HttpServletResponse response, int userId) throws ServletException, IOException {
//        ManagerUsersDAO managerUsersDAO = new ManagerUsersDAO();
//        boolean success = managerUsersDAO.unlockUserAccount(userId);
//
//        JSONObject jsonResponse = new JSONObject();
//        if (success) {
//            jsonResponse.put("status", "success");
//        } else {
//            jsonResponse.put("status", "error");
//            jsonResponse.put("message", "Failed to unlock user account.");
//        }
//
//        response.setContentType("application/json");
//        PrintWriter out = response.getWriter();
//        out.print(jsonResponse.toString());
//        out.flush();
//    }
}

