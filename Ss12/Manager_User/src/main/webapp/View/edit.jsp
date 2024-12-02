<%--
  Created by IntelliJ IDEA.
  User: bipro
  Date: 30/11/2024
  Time: 12:48 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h1>Form Edit</h1>
<a href="http://localhost:8080/Users?path=Home">Back Home</a>
<form action="http://localhost:8080/Users?path=edit" method="post">
    <input type="number" name="id" placeholder="Id" value="${user.id}">
    <br>
    <input type="text" name="name" placeholder="Name"value="${user.name}">
    <br>
    <input type="text" name="mail" placeholder="Mail"value="${user.mail}">
    <br>
    <input type="text" name="country" placeholder="Country"value="${user.country}">
    <br>
    <button>Submit</button>
</form>
</body>
</html>
