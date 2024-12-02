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
    <title>Add User</title>
</head>
<body>
<h1>Form ADD</h1>
<a href="http://localhost:8080/Users?path=Home">Back Home</a>
<form action="http://localhost:8080/Users?path=Add" method="post">
    <input type="text" name="name" placeholder="Name">
    <br>
    <input type="text" name="mail" placeholder="Mail">
    <br>
    <input type="text" name="country" placeholder="Country">
    <br>
    <button>Submit</button>
</form>
</body>
</html>
