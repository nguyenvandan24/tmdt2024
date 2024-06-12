<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%@page isELIgnored="false"%>
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
<c:import url="header.jsp" />


<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Sản phẩm của chúng tôi</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="index.jsp">Trang chủ</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shop</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
<%--            <!-- Price Start -->--%>
<%--            <div class="border-bottom mb-4 pb-4">--%>
<%--                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>--%>
<%--                <form id="priceFilterForm" action="filter" method="get">--%>
<%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
<%--                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-0-500000" name="price" value="0-500000"--%>
<%--                               onchange="submitPriceFilter()" ${param.price == '0-500000' ? 'checked' : ''}>--%>
<%--                        <label class="custom-control-label" for="price-0-500000">0 - 500,000</label>--%>
<%--                    </div>--%>
<%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
<%--                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-500000-1000000" name="price" value="500000-1000000"--%>
<%--                               onchange="submitPriceFilter()" ${param.price == '500000-1000000' ? 'checked' : ''}>--%>
<%--                        <label class="custom-control-label" for="price-500000-1000000">500,000 - 1,000,000</label>--%>
<%--                    </div>--%>
<%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
<%--                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-1000000-1800000" name="price" value="1000000-1800000"--%>
<%--                               onchange="submitPriceFilter()" ${param.price == '1000000-1800000' ? 'checked' : ''}>--%>
<%--                        <label class="custom-control-label" for="price-1000000-1800000">1,000,000 - 1,800,000</label>--%>
<%--                    </div>--%>
<%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
<%--                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-1800000-2500000" name="price" value="1800000-2500000"--%>
<%--                               onchange="submitPriceFilter()" ${param.price == '1800000-2500000' ? 'checked' : ''}>--%>
<%--                        <label class="custom-control-label" for="price-1800000-2500000">1,800,000 - 2,500,000</label>--%>
<%--                    </div>--%>
<%--                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">--%>
<%--                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-2500000-3500000" name="price" value="2500000-3500000"--%>
<%--                               onchange="submitPriceFilter()" ${param.price == '2500000-3500000' ? 'checked' : ''}>--%>
<%--                        <label class="custom-control-label" for="price-2500000-3500000">2,500,000 - 3,500,000</label>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <!-- Price End -->--%>
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Lọc theo giá</h5>
                <form id="priceFilterForm" action="filter" method="get">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-all" name="price" value="all"
                               onchange="submitPriceFilter()" ${param.price == 'all' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-all">Tất cả giá</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-0-500000" name="price" value="0-500000"
                               onchange="submitPriceFilter()" ${param.price == '0-500000' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-0-500000">0 - 500,000</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-500000-1000000" name="price" value="500000-1000000"
                               onchange="submitPriceFilter()" ${param.price == '500000-1000000' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-500000-1000000">500,000 - 1,000,000</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-1000000-1500000" name="price" value="1000000-1500000"
                               onchange="submitPriceFilter()" ${param.price == '1000000-1500000' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-1000000-1500000">1,000,000 - 1,500,000</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-1500000-2000000" name="price" value="1500000-2000000"
                               onchange="submitPriceFilter()" ${param.price == '1500000-2000000' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-1500000-2000000">1,500,000 - 2,000,000</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-2000000-2500000" name="price" value="2000000-2500000"
                               onchange="submitPriceFilter()" ${param.price == '2000000-2500000' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-2000000-2500000">2,000,000 - 2,500,000</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input price-checkbox" id="price-2500000-3000000" name="price" value="2500000-3000000"
                               onchange="submitPriceFilter()" ${param.price == '2500000-3000000' ? 'checked' : ''}>
                        <label class="custom-control-label" for="price-2500000-3000000">2,500,000 - 3,000,000</label>
                    </div>
                </form>
            </div>
            <!-- Price End -->
            <!-- Color Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Lọc theo màu</h5>
                <form id="colorFilterForm" action="filter" method="get">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-all" name="color" value="all"
                               onchange="submitColorFilter()" ${param.color == 'all' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-all">Tất cả màu</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-red" name="color" value="Đen"
                               onchange="submitColorFilter()" ${param.color == 'Đen' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-red">Đen</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-blue" name="color" value="Nâu"
                               onchange="submitColorFilter()" ${param.color == 'Nâu' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-blue">Nâu</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-green" name="color" value="Cà phê"
                               onchange="submitColorFilter()" ${param.color == 'Cà phê' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-green">Cà phê</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-yellow" name="color" value="Vàng nâu"
                               onchange="submitColorFilter()" ${param.color == 'Vàng nâu' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-yellow">Vàng nâu</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-bro-cow" name="color" value="Nâu da bò"
                               onchange="submitColorFilter()" ${param.color == 'Nâu da bò' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-bro-cow">Nâu da bò</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-br" name="color" value="Nâu bò"
                               onchange="submitColorFilter()" ${param.color == 'Nâu bò' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-br">Nâu bò</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-br-cow-" name="color" value="Màu bò nhạt"
                               onchange="submitColorFilter()" ${param.color == 'Màu bò nhạt' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-br-cow-">Màu bò nhạt</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-br-cow-n" name="color" value="Màu bò đậm"
                               onchange="submitColorFilter()" ${param.color == 'Màu bò đậm' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-br-cow-n">Màu bò đậm</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input color-checkbox" id="color-br-y" name="color" value="Nâu vàng"
                               onchange="submitColorFilter()" ${param.color == 'Nâu vàng' ? 'checked' : ''}>
                        <label class="custom-control-label" for="color-br-y">Nâu vàng</label>
                    </div>
                </form>
            </div>
            <!-- Color End -->

            <!-- Size Start -->
            <div class="mb-5">
                <h5 class="font-weight-semi-bold mb-4">Filter by size</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="size-all">
                        <label class="custom-control-label" for="size-all">All Size</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-1">
                        <label class="custom-control-label" for="size-1">XS</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-2">
                        <label class="custom-control-label" for="size-2">S</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-3">
                        <label class="custom-control-label" for="size-3">M</label>
                        <span class="badge border font-weight-normal">246</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="size-4">
                        <label class="custom-control-label" for="size-4">L</label>
                        <span class="badge border font-weight-normal">145</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="size-5">
                        <label class="custom-control-label" for="size-5">XL</label>
                        <span class="badge border font-weight-normal">168</span>
                    </div>
                </form>
            </div>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="SearchServlet" method="get">
                            <div class="input-group">
                                <input type="text" name="txtSearch" value="${param.txtSearch}" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>
                 <c:choose>
                     <c:when test="${not empty products}">
                         <c:forEach items="${products}" var="product">
                             <!-- Hiển thị sản phẩm -->
                             <div class="col-lg-4 col-md-6 col-sm-12">
                                 <!-- Thẻ card sản phẩm -->
                                 <div class="card product-item border-0 mb-4">
                                     <!-- Hình ảnh sản phẩm -->
                                     <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                         <img class="img-fluid w-100" src="${product.img}" alt="">
                                     </div>
                                     <!-- Thân sản phẩm -->
                                     <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                         <h6 class="text-truncate mb-3">${product.namePro}</h6>
                                         <div class="d-flex justify-content-center">
                                             <h6 class="product-price">${product.price}</h6><h6 class="text-muted ml-2"></h6>
                                         </div>
                                     </div>
                                     <!-- Chân sản phẩm -->
                                     <div class="card-footer d-flex justify-content-between bg-light border">
                                         <a href="DetailServlet?id=${product.proID}" class="btn btn-sm text-dark p-0">
                                             <i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết
                                         </a>
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
                         </c:forEach>
                     </c:when>
                     <c:otherwise>
                         <c:forEach items="${listP}" var="product">
                                                      <div class="col-lg-4 col-md-6 col-sm-12">
                                                          <div class="card product-item border-0 mb-4">
                                                              <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                                                  <img class="img-fluid w-100" src="${product.img}" alt="">
                                                              </div>
                                                              <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                                                  <h6 class="text-truncate mb-3">${product.namePro}</h6>
                                                                  <div class="d-flex justify-content-center">
                                                                      <h6 class="product-price">${product.price}</h6><h6 class="text-muted ml-2"></h6>
                                                                  </div>
                                                              </div>
                                                              <div class="card-footer d-flex justify-content-between bg-light border">
                                                                  <a href="DetailServlet?id=${product.proID}" class="btn btn-sm text-dark p-0">
                                                                      <i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết
                                                                  </a>
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
                                                  </c:forEach>
                     </c:otherwise>
                 </c:choose>


                <c:forEach items="${search_products}" var="product">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="${product.img}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${product.namePro}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6 class="product-price">${product.price}</h6><h6 class="text-muted ml-2"></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="DetailServlet?id=${product.proID}" class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-eye text-primary mr-1"></i>View Detail
                                </a>
                                <a href="cart.jsp" class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach var="product" items="${requestScope.productList}">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100 size_image" src="${product.img}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${product.namePro}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6 class="product-price">${product.price}</h6><h6 class="text-muted ml-2"></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="DetailServlet?id=${product.proID}" class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-eye text-primary mr-1"></i>View Detail
                                </a>
                                <a href="cart.jsp" class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
<%--                <c:forEach var="product" items="${filteredProducts}">--%>
<%--                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>
<%--                        <div class="card product-item border-0 mb-4">--%>
<%--                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
<%--                                <img class="img-fluid w-100 size_image" src="${product.img}" alt="">--%>
<%--                            </div>--%>
<%--                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
<%--                                <h6 class="text-truncate mb-3">${product.namePro}</h6>--%>
<%--                                <div class="d-flex justify-content-center">--%>
<%--                                    <h6 class="product-price">${product.price}</h6><h6 class="text-muted ml-2"></h6>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="card-footer d-flex justify-content-between bg-light border">--%>
<%--                                <a href="detail.jsp?proID=${product.proID}" class="btn btn-sm text-dark p-0">--%>
<%--                                    <i class="fas fa-eye text-primary mr-1"></i>View Detail--%>
<%--                                </a>--%>
<%--                                <a href="" class="btn btn-sm text-dark p-0">--%>
<%--                                    <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


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
    function submitPriceFilter() {
        const checkboxes = document.querySelectorAll('.price-checkbox');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    checkboxes.forEach(box => {
                        if (box !== this) {
                            box.checked = false;
                        }
                    });
                }
                document.getElementById('priceFilterForm').submit();
            });
        });
    }

    function submitColorFilter() {
        const checkboxes = document.querySelectorAll('.color-checkbox');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    checkboxes.forEach(box => {
                        if (box !== this) {
                            box.checked = false;
                        }
                    });
                }
                document.getElementById('colorFilterForm').submit();
            });
        });
    }

    function submitSizeFilter() {
        const checkboxes = document.querySelectorAll('.size-checkbox');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    checkboxes.forEach(box => {
                        if (box !== this) {
                            box.checked = false;
                        }
                    });
                }
            });
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        submitPriceFilter();
        submitColorFilter();
        submitSizeFilter();
    });
    // Hàm để định dạng giá theo định dạng 500,000 VNĐ
    function formatPrice(price) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
    }

    // Lặp qua tất cả các thẻ h6 chứa giá và định dạng chúng
    document.querySelectorAll('.product-price').forEach(function(element) {
        const price = parseFloat(element.innerText);
        element.innerText = formatPrice(price);
    });
</script>
</body>

</html>