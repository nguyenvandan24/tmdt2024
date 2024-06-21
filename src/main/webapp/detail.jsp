<%@ page import="model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="service.ReviewService" %>
<%@ page import="model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="Vi">

<head>
  <meta charset="UTF-8">
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
<c:import url="header.jsp" />

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
  <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
    <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
    <div class="d-inline-flex">
      <p class="m-0"><a href="">Home</a></p>
      <p class="m-0 px-2">-</p>
      <p class="m-0">Shop Detail</p>
    </div>
  </div>
</div>
<!-- Page Header End -->


<!-- Shop Detail Start -->
<div class="container-fluid py-5">
  <div class="row px-xl-5">
    <div class="col-lg-5 pb-5">
      <div id="product-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner border">
          <div class="carousel-item active">
            <img class="w-100 h-100" src="<c:out value='${request.contextPath}${product.img}' />" alt="Image">
          </div>

        </div>
        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
          <i class="fa fa-2x fa-angle-left text-dark"></i>
        </a>
        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
          <i class="fa fa-2x fa-angle-right text-dark"></i>
        </a>
      </div>
    </div>

    <div class="col-lg-7 pb-5">
      <h3 class="font-weight-semi-bold"><c:out value="${product.namePro}" /></h3>
      <div class="d-flex mb-3">
        <div class="text-primary mr-2">
          <small class="fas fa-star"></small>
          <small class="fas fa-star"></small>
          <small class="fas fa-star"></small>
          <small class="fas fa-star-half-alt"></small>
          <small class="far fa-star"></small>
        </div>
        <small class="pt-1">(50 Reviews)</small>
      </div>
      <h3 class="font-weight-semi-bold mb-4"><c:out value="${product.price}" />VND</h3>
      <p class="mb-4">${product.description}</p>
      <div class="d-flex mb-3">
        <p class="text-dark font-weight-medium mb-0 mr-3">Kích cỡ:<c:out value="${product.size}" /></p>

      </div>
      <div class="d-flex mb-4">
        <p class="text-dark font-weight-medium mb-0 mr-3">Màu sắc: <c:out value="${product.color}" /></p>

      </div>
      <div class="d-flex align-items-center mb-4 pt-2">
        <div class="input-group quantity mr-3" style="width: 130px;">
          <div class="input-group-btn">
            <button class="btn btn-primary btn-minus" >
              <i class="fa fa-minus"></i>
            </button>
          </div>
          <input type="text" class="form-control bg-secondary text-center" value="1">
          <div class="input-group-btn">
            <button class="btn btn-primary btn-plus">
              <i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
       <form action="cartServlet" method="post" class="m-0">
      <input type="hidden" name="productId" value="${product.proID}">
               <input type="hidden" name="quantity" value="1"> <!-- Số lượng mặc định là 1 -->
                   <button type="submit" class="btn btn-sm text-dark p-0">
                           <i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm giỏ hàng
                                  </button>
       </form>
      </div>

    </div>
  </div>
  <div class="row px-xl-5">
    <div class="col">
      <div class="nav nav-tabs justify-content-center border-secondary mb-4">
        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Đánh giá (0)</a>
      </div>
      <div class="tab-content">
        <div class="tab-pane fade show active" id="tab-pane-1">
          <h4 class="mb-3"></h4>
          <p><c:out value="${product.description}" /></p>
        </div>


        <div class="tab-pane fade" id="tab-pane-2">
          <div class="row">
            <div class="col-md-6">
              <h4 class="mb-4">Đánh giá</h4>
              <c:forEach var="review" items="${reviews}">
                <div class="media mb-4">
                  <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                  <div class="media-body">
                    <h6>${review.name}<small> - <i>${review.email}</i></small></h6>
                    <div class="text-primary mb-2">
                      <c:forEach var="i" begin="1" end="${review.star}">
                        <i class="fas fa-star"></i>
                      </c:forEach>
                      <c:forEach var="i" begin="${review.star + 1}" end="5">
                        <i class="far fa-star"></i>
                      </c:forEach>
                    </div>
                    <p>${review.content}</p>
                  </div>
                </div>
              </c:forEach>
            </div>

            <div class="col-md-6">
              <h4 class="mb-4">Để lại đánh giá</h4>
              <small>Địa chỉ email của bạn sẽ không được công bố. Các trường bắt buộc được đánh dấu *</small>
              <form action="ReviewServlet" method="post">
                <div class="d-flex my-3">
                  <p class="mb-0 mr-2">Đánh giá của bạn * :</p>
                  <div class="text-primary">
                    <input type="hidden" id="star" name="star" value="0">
                    <i class="far fa-star" onclick="changeStar(1)" id="star1" style="cursor: pointer;"></i>
                    <i class="far fa-star" onclick="changeStar(2)" id="star2" style="cursor: pointer;"></i>
                    <i class="far fa-star" onclick="changeStar(3)" id="star3" style="cursor: pointer;"></i>
                    <i class="far fa-star" onclick="changeStar(4)" id="star4" style="cursor: pointer;"></i>
                    <i class="far fa-star" onclick="changeStar(5)" id="star5" style="cursor: pointer;"></i>
                  </div>
                </div>
                <div class="form-group">
                  <label for="content">Đánh giá của bạn *</label>
                  <textarea id="content" name="content" cols="30" rows="5" class="form-control" required></textarea>
                </div>
                <div class="form-group">
                  <label for="name">Tên của bạn *</label>
                  <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                  <label for="email">Email của bạn *</label>
                  <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group mb-0">
                  <input type="hidden" name="id" value="${param.id}">
                  <input type="submit" value="Để lại đánh giá của bạn" class="btn btn-primary px-3">
                </div>
              </form>
            </div>

          </div>
        </div>



      </div>
    </div>
  </div>
</div>
<!-- Shop Detail End -->




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
    $('.btn-minus, .btn-plus').click(function() {
        var input = $(this).closest('.input-group').find('input[type="number"]');
        var productId = input.data('product-id');
        var currentVal = parseInt(input.val());
        if (!isNaN(currentVal)) {
            var newQuantity = $(this).hasClass('btn-minus') ? Math.max(currentVal - 1, 1) : currentVal + 1;
            input.val(newQuantity);
            updateQuantity(productId, newQuantity);
        }
    });

    function updateQuantity(productId, newQuantity) {
        $.ajax({
            type: 'POST',
            url: 'UpdateCartQuantityServlet',
            data: {
                productId: productId,
                quantity: newQuantity
            },
            success: function(response) {
                // Cập nhật dữ liệu trên trang
                $('#totalProductCost').text(response.totalProductCost);
                $('#totalAmount').text(response.totalAmount);
                $('#total').text(response.productCost);
            }
        });
    }
});

</script>
<script>
  // Hàm thay đổi số sao đánh giá
  function changeStar(star) {
    document.getElementById('star').value = star;
    for (var i = 1; i <= 5; i++) {
      var starElement = document.getElementById('star' + i);
      if (i <= star) {
        starElement.classList.remove('far');
        starElement.classList.add('fas');
      } else {
        starElement.classList.remove('fas');
        starElement.classList.add('far');
      }
    }
  }

</script>
</body>

</html>