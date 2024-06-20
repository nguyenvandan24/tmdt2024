<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>

<%@ page import="model.Product" %>
<%@ page import="model.User" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Xác nhận thanh toán</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="Free HTML Templates">
    <meta name="description" content="Free HTML Templates">

    <!-- Favicon -->
    <link rel="icon" href="img/favicon.ico">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="css/style.css">

    <style>
        .address-section, .payment-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .order-summary {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table thead th {
            background-color: #6c757d;
            color: #fff;
        }
        .btn-primary, .btn-secondary {
            width: 100%;
            margin-bottom: 10px;
        }
        .back-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }
    </style>

</head>

<body>

<%@include file="header.jsp" %>

<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Address Section -->
        <div class="col-md-6 address-section">
            <h2>Địa chỉ giao hàng</h2>
            <p><strong>Số điện thoại:</strong> <%= new String(((String) session.getAttribute("phone")).getBytes("ISO-8859-1"), "UTF-8") %></p>
            <p><strong>Tỉnh/Thành phố:</strong> <%= new String(((String) session.getAttribute("province")).getBytes("ISO-8859-1"), "UTF-8") %></p>
            <p><strong>Quận/Huyện:</strong> <%= new String(((String) session.getAttribute("district")).getBytes("ISO-8859-1"), "UTF-8") %></p>
            <p><strong>Phường/Xã:</strong> <%= new String(((String) session.getAttribute("ward")).getBytes("ISO-8859-1"), "UTF-8") %></p>
            <p><strong>Địa chỉ cụ thể:</strong> <%= new String(((String) session.getAttribute("address")).getBytes("ISO-8859-1"), "UTF-8") %></p>
            <a href="address.jsp" class="btn btn-primary">Sửa địa chỉ</a>
        </div>

        <!-- Payment Section -->
        <div class="col-md-6 payment-section">
            <h2>Phương thức thanh toán</h2>
            <form id="orderForm" action="complete" method="post">
                <div class="btn-group-toggle" data-toggle="buttons">
                    <label class="btn btn-secondary">
                        <input type="radio" name="paymentMethod" id="cash" value="cash" autocomplete="off"> Thanh toán bằng tiền mặt khi nhận hàng
                    </label>
                    <label class="btn btn-secondary">
                        <input type="radio" name="paymentMethod" id="bank" value="bank" autocomplete="off"> Thanh toán bằng chuyển khoản ngân hàng
                    </label>
                </div>

                <!-- Order Summary Section -->
                <div class="order-summary mt-4">
                    <h3 class="text-center">Thông tin đơn hàng</h3>
                    <div class="table-responsive mb-3">
                        <table class="table table-bordered">
                            <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                            </tr>
                            </thead>
                            <tbody class="align-middle">
                            <%
                                // Lấy thông tin người dùng từ session
                                User user = (User) session.getAttribute("user");
                                // Kiểm tra người dùng và giỏ hàng của họ
                                if (user != null) {
                                    Cart cart = (Cart) session.getAttribute("cart_" + user.getId());
                                    if (cart != null && !cart.getItems().isEmpty()) {
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
                            </tr>

                            </tbody>
                        </table>
                    </div>

                    <!-- Order Summary Card -->
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary text-white">
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
                            <!-- Complete Payment Form -->
                            <input type="hidden" name="totalCost" value="<%= cart.getTotalCost() + 10000 %>">
                            <button type="submit" class="btn btn-block btn-primary my-3 py-3">Hoàn tất thanh toán</button>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </form>
        </div>
    </div>
</div>

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
    document.getElementById('orderForm').addEventListener('submit', function(event) {
        var selectedPaymentMethod = document.querySelector('input[name="paymentMethod"]:checked');

        if (!selectedPaymentMethod) {
            alert('Vui lòng chọn phương thức thanh toán');
            event.preventDefault(); // Prevent form submission if no payment method is selected
        }
    });
</script>

</body>
</html>
