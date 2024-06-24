<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ManageOrdersDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%--<%@page isELIgnored="false"%>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Orders</title>

    <link rel="shortcut icon" type="image/png" href="../admin/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="../admin/assets/css/styles.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        .delete-icon {
            color: red;
        }
        .pagination-wrapper {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .table-custom th, .table-custom td {
            padding: 15px;
            vertical-align: middle;
        }
        .table-custom th {
            background-color: #f8f9fa;
        }
        .table-custom tbody tr:hover {
            background-color: #f1f1f1;
        }
        .table-wrapper {
            margin-top: 20px;
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
                  <i class="fa-solid fa-user"></i>
                </span>
                            <span class="hide-menu">Users</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="/getProd" aria-expanded="false">
                <span>
                  <i class="fa-solid fa-list"></i>
                </span>
                            <span class="hide-menu">Products</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="manage-or.jsp" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                            <span class="hide-menu">Orders</span>
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
            <!--  User Management Table -->
            <div class="py-6 px-6">
                <h2 class="mb-4">Order Management</h2>
                <%
                    ManageOrdersDAO mnorderDAO = new ManageOrdersDAO();
                    List<Order> orders = mnorderDAO.getOrders();
                %>
                <div class="table-wrapper">
                    <div class="table-responsive">
                        <table class="table table-custom table-striped table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>User ID</th>
                                <th>Order Time</th>
                                <th>Phone</th>
                                <th>Province</th>
                                <th>District</th>
                                <th>Ward</th>
                                <th>Address</th>
                                <th>Payment Method</th>
                                <th>Total Cost</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% if (orders != null && !orders.isEmpty()) {
                                for (Order order : orders) { %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><%= order.getUserID() %></td>
                                <td><fmt:formatDate value="<%= order.getOrderTime() %>" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                <td><%= order.getPhone() %></td>
                                <td><%= new String(((String) order.getProvince()).getBytes("ISO-8859-1"), "UTF-8") %></td>
                                <td><%= new String(((String) order.getDistrict()).getBytes("ISO-8859-1"), "UTF-8") %></td>
                                <td><%= new String(((String) order.getWard()).getBytes("ISO-8859-1"), "UTF-8") %></td>
                                <td><%= new String(((String) order.getAddress()).getBytes("ISO-8859-1"), "UTF-8") %></td>
                                <td><%= order.getPaymentMethod() %></td>
                                <td><%= order.getTotalCost() %></td>
                                <td><%= new String(((String) order.getStatus()).getBytes("ISO-8859-1"), "UTF-8") %></td>
                                <td>
                                    <a href="editOrder.jsp?orderId=<%= order.getId() %>" title="Edit"><i class="fas fa-edit"></i></a>
<%--                                    <a href="#" title="Delete"><i class="fas fa-trash-alt delete-icon"></i></a>--%>
                                </td>
                            </tr>
                            <% }
                            } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--                <c:if test="${totalPages > 1}">--%>
<%--                    <div class="pagination-wrapper">--%>
<%--                        <nav aria-label="Page navigation">--%>
<%--                            <ul class="pagination">--%>
<%--                                <c:if test="${currentPage > 1}">--%>
<%--                                    <li class="page-item">--%>
<%--                                        <a class="page-link" href="${pageContext.request.contextPath}/showOrders?page=${currentPage - 1}">Previous</a>--%>
<%--                                    </li>--%>
<%--                                </c:if>--%>
<%--                                <c:forEach var="i" begin="1" end="${totalPages}">--%>
<%--                                    <li class="page-item ${i == currentPage ? 'active' : ''}">--%>
<%--                                        <a class="page-link" href="${pageContext.request.contextPath}/showOrders?page=${i}">${i}</a>--%>
<%--                                    </li>--%>
<%--                                </c:forEach>--%>
<%--                                <c:if test="${currentPage < totalPages}">--%>
<%--                                    <li class="page-item">--%>
<%--                                        <a class="page-link" href="${pageContext.request.contextPath}/showOrders?page=${currentPage + 1}">Next</a>--%>
<%--                                    </li>--%>
<%--                                </c:if>--%>
<%--                            </ul>--%>
<%--                        </nav>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
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

</body>
</html>