package controller;

import dao.UserDAO;
import model.EncryptPass;
import model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        password = EncryptPass.toSHA1(password);
        User user = userDAO.login(username, password);

        if (user == null) {
            // If user is null, login failed
            request.setAttribute("message", "Sai thông tin đăng nhập");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Check if the user's account is locked
            if (user.getRoles() == 2) {
                // If account is locked, set appropriate message and forward to login.jsp
                request.setAttribute("message", "Tài khoản của bạn đã bị khóa");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Login successful, proceed with setting session attributes
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Set user ID and email to be sent to the client-side
                String userId = String.valueOf(user.getId());
                String userEmail = user.getEmail();
                request.setAttribute("userId", userId);
                request.setAttribute("userEmail", userEmail);

                // Set isAdmin attribute based on user's roles
                boolean isAdmin = (user.getRoles() == 0); // Assuming roles 0 means admin
                session.setAttribute("isAdmin", isAdmin);

                // Check the user's role and redirect accordingly
                if (isAdmin) {
                    response.sendRedirect(request.getContextPath() + "/admin/admin-index.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            }
        }
    }

}
