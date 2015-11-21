<%--
  Created by IntelliJ IDEA.
  User: sibylla
  Date: 15/11/21
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>用户简介 | Wanted</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="/assets/i/favicon.png">
  <link rel="stylesheet" href="/assets/css/amazeui.css"/>
  <script src="/assets/js/jquery.min.js"></script>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
    .am-g {
      font-size: 1.6rem;
    }
    .am-form{
      position: relative;
    }
    .p-img{
      width: 100px;
      height: 100px;
      position: absolute;
      right: 5%;
      top: 10%;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>Wanted</h1>
    <p>I WANT YOU,YOU NEED ME<br/>寻伴，交友，互助</p>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>用户简介</h3>
    <hr>
    <!--     <div class="am-btn-group">
          <a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a>
          <a href="#" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i> Google+</a>
          <a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a>
        </div>
        <br>
        <br> -->

    <form class="am-form">
      <label for="name">姓名:</label>
      <span name="" id="name"></span>
      <br>
      <label for="sex">性别:</label>
      <span name="" id="sex"></span>
      <br>
      <label for="school">学校:</label>
      <span name="" id="school"></span>
      <br>
      <label for="tel">联系电话:</label>
      <span name="" id="tel">188****2222</span>
      <br>
      <label for="email">电子邮箱:</label>
      <span name="" id="email">example@163.com</span>
      <br>
      <label for="rank">信誉评分:</label>
      <span name="" id="rank">111</span>
      <br>
      <label for="time">注册时间:</label>
      <span name="" id="time">2015年11月21日</span>
      <br>
      <img src="/assets/img/default.jpg" class="p-img">
    </form>
    <hr>
    <p>©2015-11-21 hackathon by HiGirlsZJU</p>
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function(){


    //接收单个对象
    $.ajax({
      url: "/user/userInfo",
      dataType: "json",
      success: function(data) {
        if(data.status==200) {
          console.log(data.data);
          data = data.data;
          $("#name").html(data.name)
          if (0 == data.sex) {
            $("#sex").html('男')
          } else {
            $("#sex").html('女')
          }
          $("#school").html(data.school);
          $("#rank").html(data.rank);
          $("#property").html(data.property);
        }
        else{
          alert(data.msg); //报错信息
        }
      },
      error: function() {
        alert("get info fail");
      }
    });
    //上传单个对象
    var userData = {name:"zkl",school:"Zhejiang University"};
    $.ajax({
      url: "/user/saveInfo?id=1",
      data:userData,
      dataType: "json",
      success: function(data) {
        if(data.status==200) {
          alert("save info successfully!");
        }
        else{
          alert(data.msg); //报错信息
        }
      },
      error: function() {
        alert("save info fail");
      }
    });

    //接收对象列表
    $.ajax({
      url: "/user/listInfo",
      dataType: "json",
      success: function(data) {
        if(data.status==200) {
          console.log(data.data);
          var list = data.data.list;
          console.log("列表第一个对象");
          console.log(list[0]);
          console.log("列表第二个对象");
          console.log(list[1]);
        }
        else{
          alert(data.msg); //报错信息
        }
      },
      error: function() {
        alert("list info fail");
      }
    });








  });
</script>
</body>
</html>
