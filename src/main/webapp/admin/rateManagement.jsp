<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modernize Free</title>
    <link rel="shortcut icon" type="image/png" href="../admin/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="../admin/assets/css/styles.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-EXAMPLE-HASH" crossorigin="anonymous" />

</head>
  <body>
  <style>
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }

  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
  }

  tr:nth-child(even) {
    background-color: #dddddd;
    .delete-review {
        background-color: #dc3545; /* Màu nền */
        color: white; /* Màu chữ */
        border: none; /* Không có viền */
        padding: 8px 16px; /* Độ dày của nút */
        cursor: pointer; /* Con trỏ khi rê chuột vào */
        border-radius: 4px; /* Bo tròn góc */
        transition: background-color 0.3s ease; /* Hiệu ứng khi hover */
      }
 .delete-review:hover {
    background-color: #c82333; /* Màu nền khi hover */
  }

  }
  </style>
    <!--  Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
      data-sidebar-position="fixed" data-header-position="fixed">
      <!-- Sidebar Start -->
      <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div>
          <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="./index.html" class="text-nowrap logo-img">
              <img src="../assets/images/logos/dark-logo.svg" width="180" alt="" />
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
                <a class="sidebar-link" href="./ui-buttons.html" aria-expanded="false">
                  <span>
                    <i class="ti ti-article"></i>
                  </span>
                  <span class="hide-menu">Buttons</span>
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
                  <img src="../assets/images/backgrounds/rocket.png" alt="" class="img-fluid">
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
                    <img src="../assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
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
                 <div class="container-fluid">
                   <div class="card">
                     <div class="card-body">
                       <h5 class="card-title fw-semibold mb-4">Alerts</h5>
                       <div class="card mb-0">
                         <div class="card-body p-4">
                           <table id="reviewsTable" class="table table-bordered table-hover">
                               <thead>
                                   <tr>
                                       <th>Tên khách hàng</th>
                                       <th>Email</th>
                                       <th>Sản phẩm</th>
                                       <th>Sao</th>
                                       <th>Nội dung</th>
                                       <th>Xóa</th>
                                   </tr>
                               </thead>
                               <tbody>
                                   <c:forEach var="review" items="${reviews}">
                                       <tr id="reviewRow-${review.id}">
                                           <td>${review.name}</td>
                                           <td>${review.email}</td>
                                           <td>${review.productId}</td>
                                           <td>${review.star}</td>
                                           <td>${review.content}</td>
                                           <td>
                                               <!-- Nút Xóa với sự kiện click sẽ gọi Ajax để xóa -->
<button class="delete-review btn btn-danger" data-review-id="${review.id}">Xóa</button>
                                           </td>
                                       </tr>
                                   </c:forEach>
                               </tbody>
                           </table>
                         </div>
                       </div>
                     </div>
                   </div>
                 </div>
               </div>
      </div>
    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/sidebarmenu.js"></script>
    <script src="../assets/js/app.min.js"></script>
    <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
   $(document).ready(function() {
       $('#reviewsTable').on('click', '.delete-review', function(event) {
           event.preventDefault(); // Ngăn chặn hành động mặc định của nút

           var reviewId = $(this).data('review-id'); // Lấy reviewId từ thuộc tính data-review-id

           // Gửi yêu cầu xóa review qua Ajax
           $.ajax({
               url: '/admin/deleteReview', // URL của Servlet hoặc Controller xử lý xóa
               type: 'POST',
               data: { reviewId: reviewId }, // Dữ liệu gửi đi, ở đây là reviewId
               success: function(data) {
                   // Xử lý kết quả thành công nếu cần thiết
                   console.log('Review deleted successfully');

                   // Cập nhật giao diện trang web mà không cần reload
                   // Ví dụ, có thể xóa dòng review khỏi bảng mà không cần load lại toàn bộ trang
                   $('#reviewRow-' + reviewId).remove();
               },
               error: function(jqXHR, textStatus, errorThrown) {
                   console.error('Error deleting review:', textStatus, errorThrown);
                   // Xử lý lỗi nếu cần thiết
               }
           });
       });
   });

</script>

  </body>
</html>
