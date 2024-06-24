<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ManageOrdersDAO" %>
<%@ page import="model.Order" %>
<%@ page import="model.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Duyệt đơn hàng</title>

    <link rel="shortcut icon" type="image/png" href="../admin/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="../admin/assets/css/styles.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
                                                                              <a class="sidebar-link" href="/admin/reviews" aria-expanded="false">
                                                                      <span>
                                                                        <i class="ti ti-article"></i>
                                                                      </span>
                                                                                  <span class="hide-menu">Quản lý đánh giá</span>
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
                <h2 class="mb-4">Thông tin đơn hàng</h2>
                    <%
                        String orderIdStr = request.getParameter("orderId");
                        if (orderIdStr == null) {
                            response.sendRedirect("404.jsp");
                        return;
                        }

                        int orderId = Integer.parseInt(orderIdStr);
                        ManageOrdersDAO mnorderDAO = new ManageOrdersDAO();
                        Order order = mnorderDAO.getOrderById(orderId);
                        if (order == null) {
                            response.sendRedirect("404.jsp");
                        return;
                        }

                         List<OrderDetail> orderDetails = mnorderDAO.getOrderDetailsByOrderId(orderId);
                    %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> </h5>
                        <p>Mã đơn hàng: <%= order.getId() %></p>
                        <p>Ngày đặt hàng: <fmt:formatDate value="<%= order.getOrderTime() %>" pattern="dd/MM/yyyy HH:mm:ss"/></p>
                        <p>Tổng tiền: <%= order.getTotalCost() %> VND</p>
                        <p>Phương thức thanh toán: <%= order.getPaymentMethod() %></p>
                        <p>Trạng thái đơn hàng: <%= order.getStatus() %></p>

                        <!-- Status Update Form -->
                        <form action="updateOrderStatus.jsp" method="post">
                            <input type="hidden" name="orderId" value="<%= order.getId() %>">
                            <div class="form-group">
                                <label for="status">Cập nhật trạng thái đơn hàng:</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="Đã duyệt đơn hàng">Đã duyệt đơn hàng</option>
                                    <option value="Đang giao hàng">Đang giao hàng</option>
                                    <option value="Giao hàng thành công">Giao hàng thành công</option>
                                    <option value="Huỷ đơn hàng">Hủy đơn hàng</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Cập nhật</button>
                        </form>
                    </div>
                </div>

                <div class="mt-4">
                    <h5> </h5>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int stt = 1;
                            double total = 0;
                            for (OrderDetail detail : orderDetails) {
                                double amount = detail.getPrice() * detail.getQuantity();
                                total += amount;
                        %>
                        <tr>
                            <th scope="row"><%= stt++ %></th>
                            <td><%= new String(((String) detail.getNamePro()).getBytes("ISO-8859-1"), "UTF-8") %></td>
                            <td><%= detail.getPrice() %> VND</td>
                            <td><%= detail.getQuantity() %></td>
                            <td><%= amount %> VND</td>
                        </tr>
                        <% } %>
                        </tbody>
                        <tfoot>
                        <%--            <tr>--%>
                        <%--                <th colspan="4">Tổng cộng</th>--%>
                        <%--                <th><%= total %> VND</th>--%>
                        <%--            </tr>--%>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
