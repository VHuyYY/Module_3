<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--<h1><%= "Ss10" %>--%>
<%--</h1>--%>
<br/>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<h1>Danh Sách Khách Hàng</h1>
<div>
    <%--    <form action="//hello-servlet" method="post">--%>
    <table border="1">
        <tr>
            <th>Tên</th>
            <th>Ngày Sinh</th>
            <th>Địa Chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach items="${list}" var="customer">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.date}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.img}" width="50px" alt=""></td>
            </tr>
        </c:forEach>
    </table>
    <%--    </form>--%>
</div>
</body>
</html>