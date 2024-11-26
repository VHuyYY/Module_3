<%--
  Created by IntelliJ IDEA.
  User: bipro
  Date: 26/11/2024
  Time: 10:03 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add Product</h1>
<a href="http://localhost:8080/products">Back</a>
<form action="http://localhost:8080/products?action=add" method="post">

    <ul>
        <li>
            <p>Nhập Id</p>
            <input type="text" name="id" placeholder="Nhập Vào Id">
        </li>
        <li>
            <p>Nhập Tên</p>
            <input type="text" name="name" placeholder="Nhập Tên">
        </li>
        <li>
            <p>Nhập Giá</p>
            <input type="text" name="price" placeholder="Nhập Giá">
        </li>
        <li>
            <p>Nhập Mô Tả</p>
            <input type="text" name="description" placeholder="Nhập Mô Tả">
        </li>
        <li>
            <p>Nhập Tác Giả</p>
            <input type="text" name="author" placeholder="Nhập Tác Giả"></li>
        <li>
            <button name="submit">Thêm Sản Phẩm</button>
        </li>
    </ul>
</form>

</body>
</html>
