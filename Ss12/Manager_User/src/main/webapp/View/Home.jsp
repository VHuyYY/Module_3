<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bipro
  Date: 28/11/2024
  Time: 8:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản Lí Người Dùng</title>
</head>
<body>

<h1><%= "Quản Lí Người Dùng" %>
</h1>
<a href="http://localhost:8080/Users?path=Add">Add User</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Mail</th>
        <th>Country</th>
        <th colspan="2">Action</th>
    </tr>
    <e:forEach items="${list}" var="item" varStatus="loop">
        <tr>
            <td>${item.id}</td>
            <td>${item.name}</td>
            <td>${item.mail}</td>
            <td>${item.country}</td>
            <td>
                <a href="http://localhost:8080/Users?path=delete&id=${item.id}">
                    <button>Xoá</button>
                </a>
            </td>
            <td>
                <a href="http://localhost:8080/Users?path=edit&id=${item.id}">
                    <button>Sửa</button>
                </a>
            </td>
        </tr>
    </e:forEach>
</table>
</body>
</html>
