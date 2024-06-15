<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page isELIgnored="false"%>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>

<%@ page import="model.Product" %>
<%@ page import="model.User" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>EShopper - Bootstrap Shop Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="Free HTML Templates" name="keywords">
  <meta content="Free HTML Templates" name="description">

  <!-- Favicon -->
  <link href="img/favicon.ico" rel="icon">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
</head>

<body>
<%@include file="header.jsp" %>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
  <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
    <h1 class="font-weight-semi-bold text-uppercase mb-3">Giỏ hàng</h1>

  </div>
</div>
<!-- Page Header End -->

<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <%
        // Lấy thông tin người dùng từ session
        User user = (User) session.getAttribute("user");
        // Kiểm tra người dùng và giỏ hàng của họ
        if (user != null) {
            Cart cart = (Cart) session.getAttribute("cart_" + user.getId());
            if (cart != null && !cart.getItems().isEmpty()) {
        %>
        <div class="col-lg-8">
            <div class="table-responsive mb-5">
                <table class="table table-bordered">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng cộng</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (Map.Entry<String, CartItem> entry : cart.getItems().entrySet()) {
                            CartItem cartItem = entry.getValue();
                            Product product = cartItem.getProduct();
                            int quantity = cartItem.getQuantity();
                        %>
                        <tr>
                            <td class="align-middle">
                                <img src="<%= product.getImg() %>" alt="<%= product.getNamePro() %>" style="width: 50px;">
                                <%= product.getNamePro() %>
                            </td>
                            <td class="align-middle price" data-price="<%= product.getPrice() %>"><%= product.getPrice() %></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" type="button">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="hidden" name="productId" value="<%= product.getProID() %>">
<input type="number" class="form-control form-control-sm bg-secondary text-center" value="<%= quantity %>" data-product-id="<%= product.getProID() %>">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus" type="button">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle"><span class="total-price" id="total_<%= product.getProID() %>"><%= product.getPrice() * quantity %></span></td>

                            <td class="align-middle">
                                 <form action="RemoveFromCartServlet" method="post">
                                <input type="hidden" name="productId" value="<%= product.getProID() %>">
                                                                           <button class="btn btn-sm btn-danger" type="submit">Xóa</button>
                                                                       </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Thanh toán</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Tiền sản phẩm</h6>
                        <h6 class="font-weight-medium" id="totalProductCost"><%= cart.getTotalCost() %></h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Phí ship</h6>
                        <h6 class="font-weight-medium">10000</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Tổng</h5>
                        <h5 class="font-weight-bold" id="totalAmount"><%= cart.getTotalCost() + 10000 %></h5>
                    </div>
                    <!-- Thêm form để thực hiện thanh toán -->
                    <form action="address" method="post">
                        <input type="hidden" name="totalCost" value="<%= cart.getTotalCost() + 10000 %>">
                        <button type="submit" class="btn btn-block btn-primary my-3 py-3">Thanh toán</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            } else {
        %>
        <div class="col-12">
            <div class="alert alert-warning text-center">
                Giỏ hàng của bạn trống.
            </div>
        </div>
        <%
            }
        } else {
            // Xử lý khi không có người dùng đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }
        %>
    </div>
</div>
<!-- Cart End -->

<!-- Footer Start -->
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
  <div class="row px-xl-5 pt-5">
    <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
      <a href="" class="text-decoration-none">
        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
      </a>
      <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
      <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
      <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
      <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
    </div>
    <div class="col-lg-8 col-md-12">
      <div class="row">
        <div class="col-md-4 mb-5">
          <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
          <div class="d-flex flex-column justify-content-start">
            <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
            <a class="text-dark mb-2" href="product.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
            <a class="text-dark mb-2" href="detail.jsp"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
            <a class="text-dark mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
              <a class="text-dark mb-2" href="myorders.jsp"><i class="fa fa-angle-right mr-2"></i>My Order</a>
            <a class="text-dark mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
            <a class="text-dark" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
          </div>
        </div>
        <div class="col-md-4 mb-5">
          <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
          <div class="d-flex flex-column justify-content-start">
            <a class="text-dark mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Home</a>
            <a class="text-dark mb-2" href="product.jsp"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
            <a class="text-dark mb-2" href="detail.jsp"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
            <a class="text-dark mb-2" href="cart.jsp"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
              <a class="text-dark mb-2" href="myorders.jsp"><i class="fa fa-angle-right mr-2"></i>My Order</a>
            <a class="text-dark mb-2" href="checkout.jsp"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
            <a class="text-dark" href="contact.jsp"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
          </div>
        </div>
        <div class="col-md-4 mb-5">
          <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
          <form action="">
            <div class="form-group">
              <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
            </div>
            <div class="form-group">
              <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                     required="required" />
            </div>
            <div>
              <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="row border-top border-light mx-xl-5 py-4">
    <div class="col-md-6 px-xl-0">
      <p class="mb-md-0 text-center text-md-left text-dark">
        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
        by
        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
        Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
      </p>
    </div>
    <div class="col-md-6 px-xl-0 text-center text-md-right">
      <img class="img-fluid" src="img/payments.png" alt="">
    </div>
  </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script>
$(document).ready(function() {
    // Function to handle quantity update when buttons are clicked
    $('.btn-minus, .btn-plus').click(function() {
        var input = $(this).closest('.input-group').find('input[type="number"]');
        var productId = input.data('product-id');
        var currentVal = parseInt(input.val());

        if (!isNaN(currentVal)) {
            var newQuantity = $(this).hasClass('btn-minus') ? Math.max(currentVal - 1, 1) : currentVal + 1;
            input.val(newQuantity);
            updateQuantity(productId, newQuantity); // Call function to update quantity via AJAX
        }
    });

    // Function to update quantity via AJAX
    function updateQuantity(productId, newQuantity) {
        $.ajax({
            type: 'POST',
            url: 'UpdateCartQuantityServlet', // Servlet URL to handle quantity update
            data: {
                productId: productId,
                quantity: newQuantity
            },
            dataType: 'json',
            success: function(response) {
                // Update data on the page
                $('#totalProductCost').text(response.totalProductCost);
                $('#totalAmount').text(response.totalAmount);
                $('#total_' + productId).text(response.productCost); // Update specific product total
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ' + status + ' - ' + error);
            }
        });
    }
});
</script>





</body>

</html>