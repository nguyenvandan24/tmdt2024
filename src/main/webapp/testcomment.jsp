<%--
  Created by IntelliJ IDEA.
  User: Toshiba
  Date: 6/15/2024
  Time: 1:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% NumberFormat nf = new NumberFormat();
    Product p= (Product) request.getAttribute("product");
    String error = (String) request.getAttribute("error");
    System.out.println(error);
%>

<!-- Shop Detail Start -->
<%List<Comment> listComment =  ProductService.getListCommentById(p.getId());%>
<div class="container-fluid pb-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 mb-30">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner bg-light">
                    <div class="carousel-item active">
                        <img class="w-100 h-100" <%if(p.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%>src="<%= p.getImg().get(0).getImg()%>"<%}%> alt="Image">
                    </div>
                    <% for(int i = 1;i<p.getImg().size();i++){%>
                    <div class="carousel-item">
                        <img class="w-100 h-100" src="<%=p.getImg().get(i).getImg()%>" alt="Image">
                    </div>

                    <%}%>
                </div>
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                </a>
            </div>
        </div>

        <div class="col-lg-7 h-auto mb-30">
            <div class="h-100 bg-light p-30">
                <h3><%=p.getName()%></h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <%for (int j=1;j<=p.getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((p.getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                    </div>
                    <small class="pt-1">(<%= p.getAmount() %> đánh giá)</small>
                </div>
</body>
</html>
