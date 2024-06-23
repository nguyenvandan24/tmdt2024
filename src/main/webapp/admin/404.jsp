<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/23/2024
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>404</title>
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap" rel="stylesheet");

    @import url("https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700");

    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
    }

    body{
      overflow:hidden;
      background-color: #f4f6ff;
    }

    .container{
      width:100vw;
      height:100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: "Poppins", sans-serif;
      position: relative;
      left:6vmin;
      text-align: center;
    }

    .cog-wheel1, .cog-wheel2{
      transform:scale(0.7);
    }

    .cog1, .cog2{
      width:40vmin;
      height:40vmin;
      border-radius:50%;
      border:6vmin solid #f3c623;
      position: relative;
    }


    .cog2{
      border:6vmin solid #4f8a8b;
    }

    .top, .down, .left, .right, .left-top, .left-down, .right-top, .right-down{
      width:10vmin;
      height:10vmin;
      background-color: #f3c623;
      position: absolute;
    }

    .cog2 .top,.cog2  .down,.cog2  .left,.cog2  .right,.cog2  .left-top,.cog2  .left-down,.cog2  .right-top,.cog2  .right-down{
      background-color: #4f8a8b;
    }

    .top{
      top:-14vmin;
      left:9vmin;
    }

    .down{
      bottom:-14vmin;
      left:9vmin;
    }

    .left{
      left:-14vmin;
      top:9vmin;
    }

    .right{
      right:-14vmin;
      top:9vmin;
    }

    .left-top{
      transform:rotateZ(-45deg);
      left:-8vmin;
      top:-8vmin;
    }

    .left-down{
      transform:rotateZ(45deg);
      left:-8vmin;
      top:25vmin;
    }

    .right-top{
      transform:rotateZ(45deg);
      right:-8vmin;
      top:-8vmin;
    }

    .right-down{
      transform:rotateZ(-45deg);
      right:-8vmin;
      top:25vmin;
    }

    .cog2{
      position: relative;
      left:-10.2vmin;
      bottom:10vmin;
    }

    h1{
      color:#142833;
    }

    .first-four{
      position: relative;
      left:6vmin;
      font-size:40vmin;
    }

    .second-four{
      position: relative;
      right:18vmin;
      z-index: -1;
      font-size:40vmin;
    }

    .wrong-para{
      font-family: "Montserrat", sans-serif;
      position: absolute;
      bottom:15vmin;
      padding:3vmin 12vmin 3vmin 3vmin;
      font-weight:600;
      color:#092532;
    }
    .back-to-home {
      text-decoration: none;
      color: #142833;
      font-weight: 600;
      font-size: 18px;
      padding: 10px 20px;
      background-color: #f3c623;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .back-to-home:hover {
      background-color: #e0b400;
      color: #ffffff;
    }
  </style>
</head>
<body>
<div class="container">
  <h1 class="first-four">4</h1>
  <div class="cog-wheel1">
    <div class="cog1">
      <div class="top"></div>
      <div class="down"></div>
      <div class="left-top"></div>
      <div class="left-down"></div>
      <div class="right-top"></div>
      <div class="right-down"></div>
      <div class="left"></div>
      <div class="right"></div>
    </div>
  </div>

  <div class="cog-wheel2">
    <div class="cog2">
      <div class="top"></div>
      <div class="down"></div>
      <div class="left-top"></div>
      <div class="left-down"></div>
      <div class="right-top"></div>
      <div class="right-down"></div>
      <div class="left"></div>
      <div class="right"></div>
    </div>
  </div>
  <h1 class="second-four">4</h1>
  <p class="wrong-para">Uh Oh! Page not found for you!</p>
  <div>
    <a class="back-to-home" style="padding-top: 20px" href="/index.jsp">Back to Home</a>
  </div>
</div>

</body>
</html>
