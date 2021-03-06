<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<! DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

      <style>
          div.query1, div.query2, div.query3, div.query4{
              float: left;
              margin-right: 3%;

          }
          div.result{
              float: left;
              margin-bottom: 15px;
              width: 60%;
              margin-left: 20%;
              font-size: 150%;
              text-align: center;
          }

      </style>

  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>

        <a>
          <cite>用户信息</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="background-color: #248cf5;line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row" style="" align="center">
        <form class="layui-form layui-col-md12 x-so" method="post" action="${ctx}/Searchall">
          <!-- <input class="layui-input" placeholder="开始日" name="start" id="start">
          <input class="layui-input" placeholder="截止日" name="end" id="end"> -->
            <div class="outer-query">
                <div class="query1">
                    <p >性别：
                        <span class="c_right"><select name="sex">
                                <option value="不限" selected>不限</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select><br></span></p>
                </div>
                <div class="query2">
                    <p >年龄：
                        <span class="c_right"><select name="age">
                                <option value="不限" selected>不限</option>
                                <option value="小于20">小于20</option>
                                <option value="20~30">20~30</option>
                                <option value="30~40">30~40</option>
                                <option value="40~50">40~50</option>
                                <option value="大于50">大于50</option>
                            </select><br></span></p>
                </div>
                <div class="query3">
                    <p >身高：
                        <span class="c_right"><select name="height">
                                <option value="不限" selected>不限</option>
                                <option value="小于150">小于150</option>
                                <option value="150~155">150~155</option>
                                <option value="155~160">155~160</option>
                                <option value="160~165">160~165</option>
                                <option value="165~170">165~170</option>
                                <option value="170~175">170~175</option>
                                <option value="175~180">175~180</option>
                                <option value="180~185">180~185</option>
                                <option value="185~190">185~190</option>
                                <option value="大于190">大于190</option>
                        </select><br></span></p>
                </div>
                <div class="query4">
                    <p >月薪：
                        <span class="c_right"><select name="salary">
                                <option value="不限" selected>不限</option>
                                <option value="小于1500">小于1500</option>
                                <option value="1500~4000">1500~4000</option>
                                <option value="4000~7000">4000~7000</option>
                                <option value="7000~10000">7000~10000</option>
                                <option value="10000~30000">10000~30000</option>
                                <option value="大于30000">大于30000</option>
                            </select><br></span></p>
                </div>
                <button class="layui-btn" style="background-color: #248cf5;" lay-submit="" lay-filter="sreach"><i class="layui-icon" style="background-color: #248cf5;">&#xe615;</i></button>
            </div>


        </form>
      </div>
      <%-- <xblock>
 <!--        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button> -->
        <button class="layui-btn" onclick="x_admin_show('添加用户','${ctx}/dept/add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock> --%>
        <div class="result">${requestScope.queryRes}</div>
      
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>用户名</th>
            <th>姓名</th>
            <th>性别</th>
              <th>年龄</th>
              <th>身高</th>
              <th>月薪</th>
              <th>住址</th>
              <th>邮箱</th>
              <th>电话</th>
         <!-- <th>状态</th> -->

        </thead>
        <tbody>
        <c:forEach items="${requestScope.userAll}" var="user" varStatus="stat">
     <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${user.uname}</td>
            <td>${user.name }</td>
            <td>${user.sex }</td>
            <td>${user.age }</td>
            <td>${user.height }</td>
            <td>${user.salary }</td>
            <td>${user.address }</td>
            <td>${user.email }</td>
            <td>${user.phonenum }</td>

     </tr>

        </c:forEach>




        </tbody>
      </table>


    </div>

  </body>

</html>