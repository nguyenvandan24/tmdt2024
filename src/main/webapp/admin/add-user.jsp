<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/23/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%--<%--%>
<%--  // Check if the user has the admin role--%>
<%--  Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");--%>
<%--  if (isAdmin == null || !isAdmin) {--%>
<%--    // Redirect to an error page or the login page--%>
<%--    response.sendRedirect("404.jsp"); // Change this to the actual error page or login page--%>
<%--    return; // Ensure to stop further execution of the JSP--%>
<%--  }--%>
<%--%>--%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Modernize Free</title>
  <link rel="shortcut icon" type="image/png" href="../admin/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="../admin/assets/css/styles.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    /* Custom styles for the form */
    .form-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background: #ffffff;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .form-group button {
      padding: 12px 20px;
      font-size: 18px;
      background-color: #007bff;
      color: #ffffff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .form-group button:hover {
      background-color: #0056b3;
    }
    .error {
      color: red; /* Set the error message color to red */
      font-size: small;
      margin-top: 5px;
    }
  </style>
</head>

<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
  <!-- Sidebar Start -->
  <aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
      <div class="brand-logo d-flex align-items-center justify-content-between">
        <a href="./index.html" class="text-nowrap logo-img">
          <img src="../admin/assets/images/logos/dark-logo.svg" width="180" alt="" />
        </a>
        <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
          <i class="ti ti-x fs-8"></i>
        </div>
      </div>
      <!-- Sidebar navigation-->
      <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
        <ul id="sidebarnav">
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">Home</span>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./index.html" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
              <span class="hide-menu">Dashboard</span>
            </a>
          </li>
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">UI COMPONENTS</span>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="/showUsersAdmin" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
              <span class="hide-menu">Users</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./ui-alerts.html" aria-expanded="false">
                <span>
                  <i class="ti ti-alert-circle"></i>
                </span>
              <span class="hide-menu">Alerts</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./ui-card.html" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
              <span class="hide-menu">Card</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
              <span class="hide-menu">Forms</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false">
                <span>
                  <i class="ti ti-typography"></i>
                </span>
              <span class="hide-menu">Typography</span>
            </a>
          </li>
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">AUTH</span>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./authentication-login.html" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
              <span class="hide-menu">Login</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./authentication-register.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
              <span class="hide-menu">Register</span>
            </a>
          </li>
          <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">EXTRA</span>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                <span>
                  <i class="ti ti-mood-happy"></i>
                </span>
              <span class="hide-menu">Icons</span>
            </a>
          </li>
          <li class="sidebar-item">
            <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                <span>
                  <i class="ti ti-aperture"></i>
                </span>
              <span class="hide-menu">Sample Page</span>
            </a>
          </li>
        </ul>
        <div class="unlimited-access hide-menu bg-light-primary position-relative mb-7 mt-5 rounded">
          <div class="d-flex">
            <div class="unlimited-access-title me-3">
              <h6 class="fw-semibold fs-4 mb-6 text-dark w-85">Upgrade to pro</h6>
              <a href="https://adminmart.com/product/modernize-bootstrap-5-admin-template/" target="_blank" class="btn btn-primary fs-2 fw-semibold lh-sm">Buy Pro</a>
            </div>
            <div class="unlimited-access-img">
              <img src="../admin/assets/images/backgrounds/rocket.png" alt="" class="img-fluid">
            </div>
          </div>
        </div>
      </nav>
      <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
  </aside>
  <!--  Sidebar End -->
  <!--  Main wrapper -->
  <div class="body-wrapper">
    <!--  Header Start -->
    <header class="app-header">
      <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
          <li class="nav-item d-block d-xl-none">
            <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
              <i class="ti ti-menu-2"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link nav-icon-hover" href="javascript:void(0)">
              <i class="ti ti-bell-ringing"></i>
              <div class="notification bg-primary rounded-circle"></div>
            </a>
          </li>
        </ul>
        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
          <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
            <a href="https://adminmart.com/product/modernize-free-bootstrap-admin-dashboard/" target="_blank" class="btn btn-primary">Download Free</a>
            <li class="nav-item dropdown">
              <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                 aria-expanded="false">
                <img src="../admin/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
              </a>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                <div class="message-body">
                  <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                    <i class="ti ti-user fs-6"></i>
                    <p class="mb-0 fs-3">My Profile</p>
                  </a>
                  <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                    <i class="ti ti-mail fs-6"></i>
                    <p class="mb-0 fs-3">My Account</p>
                  </a>
                  <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                    <i class="ti ti-list-check fs-6"></i>
                    <p class="mb-0 fs-3">My Task</p>
                  </a>
                  <a href="./authentication-login.html" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <!--  Header End -->
    <div class="container-fluid">
      <div class="py-4">
        <h2 class="text-center mb-4">Add User</h2>
        <div class="form-container">
          <form id="registerForm" action="/add-user" method="POST">
            <p class="text-danger">${errorMessage}</p>
            <div class="form-group">
              <label for="fullname">Full Name</label>
              <input type="text" id="fullname" name="fullname" placeholder="Enter your full name." required>
              <span id="fullnameError" class="error"></span>
            </div>
            <div class="form-group">
              <label for="username">Username</label>
              <input type="text" id="username" name="username" placeholder="Enter your username." required>
              <span id="usernameError" class="error"></span>
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" id="email" name="email" placeholder="Enter your email." required>
              <span id="emailError" class="error"></span>
            </div>
            <div class="form-group">
              <label for="phone">Phone</label>
              <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
              <span id="phoneError" class="error"></span>
            </div>
            <div class="form-group">
              <label for="address">Address</label>
              <input type="text" id="address" name="address" placeholder="Enter your address." required>
              <span id="addressError" class="error"></span>
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" id="password" name="password" placeholder="Enter your password." required>
              <span id="passwordError" class="error"></span>
            </div>
            <div class="form-group">
              <label for="repassword">Confirm Password</label>
              <input type="password" id="repassword" name="repassword" placeholder="Enter your password again." required>
              <span id="repasswordError" class="error"></span>
            </div>
            <div class="form-group">
              <button type="submit">Add User</button>
            </div>
          </form>
        </div>
      </div>

      <!--  Footer -->
      <div class="py-6 text-center">
        <p class="mb-0 fs-4">Design and Developed by <a href="https://adminmart.com/" target="_blank" class="pe-1 text-primary text-decoration-underline">AdminMart.com</a> Distributed by <a href="https://themewagon.com">ThemeWagon</a></p>
      </div>
    </div>
  </div>
</div>
<script src="../admin/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="../admin/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../admin/assets/js/sidebarmenu.js"></script>
<script src="../admin/assets/js/app.min.js"></script>
<script src="../admin/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="../admin/assets/libs/simplebar/dist/simplebar.js"></script>
<script src="../admin/assets/js/dashboard.js"></script>

<script src="../admin/assets/js/register.js"></script>
</body>

</html>

