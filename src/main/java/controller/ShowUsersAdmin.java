package controller;

import dao.ManagerUsersDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/showUsersAdmin")
public class ShowUsersAdmin extends HttpServlet {
    private ManagerUsersDAO userDao;

    public ShowUsersAdmin() {
        super();
        userDao = new ManagerUsersDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userDao.getAllUsers();
        request.setAttribute("users", userList);
        request.getRequestDispatcher("/admin/manager-u.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
