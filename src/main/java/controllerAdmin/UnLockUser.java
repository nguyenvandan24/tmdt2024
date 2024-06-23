package controllerAdmin;

import dao.ManagerUsersDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/unlockUser")
public class UnLockUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user id from request parameter
        int userId = Integer.parseInt(request.getParameter("id"));

        // Call DAO method to lock user
        ManagerUsersDAO dao = new ManagerUsersDAO();
        dao.unLockUser(userId);

        // Redirect back to user management page
        response.sendRedirect(request.getContextPath() + "/showUsersAdmin");
    }
}
