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
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        pass = EncryptPass.toSHA1(pass);
        User u = userDAO.login(user, pass);
        if (u == null) {
            request.setAttribute("message", "Sai thông tin đăng nhập");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", u);

            // Set user ID and email to be sent to the client-side
            String userId = String.valueOf(u.getId());
            String userEmail = u.getEmail();
            request.setAttribute("userId", userId);
            request.setAttribute("userEmail", userEmail);

            // Forward to the response JSP page
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}
