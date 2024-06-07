package controller;

import dao.UserDAO;
import model.EncryptPass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("repassword");

        // Kiểm tra định dạng email
        if (!isValidEmail(email)) {
            request.setAttribute("errorMessage", "Invalid email format.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

//        // Kiểm tra độ dài của mật khẩu
//        if (password.length() < 6) {
//            request.setAttribute("errorMessage", "Password must be at least 6 characters long.");
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//            return;
//        }
//
//        // Kiểm tra số điện thoại không quá số
//        if (phone.length() > 11) {
//            request.setAttribute("errorMessage", "Phone number is too long.");
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//            return;
//        }

        // Kiểm tra mật khẩu và mật khẩu xác nhận khớp nhau
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();

        if (!userDAO.checkUsername(username)) {
            password = EncryptPass.toSHA1(password);
            // Nếu username chưa tồn tại, thực hiện đăng ký
            userDAO.registerUser(fullname, username, email, phone, address, password);
            response.sendRedirect("login.jsp");
        } else {
            // Nếu username đã tồn tại, chuyển hướng lại trang đăng ký với thông báo lỗi
            request.setAttribute("errorMessage", "Username already exists.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward yêu cầu đến trang đăng ký
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    // Kiểm tra định dạng email bằng biểu thức chính quy
    private boolean isValidEmail(String email) {
        String regex = "^(.+)@(.+)$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}

