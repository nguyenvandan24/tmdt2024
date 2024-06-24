package controllerAdmin;

import dao.UserDAO;
import model.EncryptPass;
import model.PasswordGenerator;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

@WebServlet("/forgotPass")
public class ForgotPass extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        // Generate random password using PasswordGenerator class
        String newPassword = PasswordGenerator.generateRandomPassword(8); // Generate password with length 8

        // Update password in database
        UserDAO userDAO = new UserDAO();
        userDAO.updatePassword(username, newPassword);

        // Display the new password to the user (for demo purposes)
        request.setAttribute("newPassword", newPassword);
        request.getRequestDispatcher("forgotPass.jsp").forward(request, response);
    }
}