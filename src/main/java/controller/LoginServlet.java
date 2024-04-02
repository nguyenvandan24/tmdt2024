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
            session.setMaxInactiveInterval(600);

            if (u.getRoles() == 0) {
                session.setAttribute("isAdmin", true);
                response.sendRedirect("/admin/admin-index.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        }

    }

}
