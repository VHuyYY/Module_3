<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> ->--%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Quản Lí Sản Phẩm" %>
</h1>
<br/>
<p><a href="${pageContext.request.contextPath}/products"></a></p>
<p><a href="${pageContext.request.contextPath}/add.jsp">Thêm mới</a></p>
<table border="1">
    <tr>
        <th>Ten</th>
        <th>Gia</th>
        <th>Mo Ta</th>
        <th>Tac Gia</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach items='${list}' var="Product">
        <tr>
            <td>${Product.name}</td>
            <td>${Product.price}</td>
            <td>${Product.description}</td>
            <td>${Product.author}</td>
            <td>
                <a href="/products?action=edit&id=${Product.id}">
                    <button>Sua</button>
                </a>
            </td>
            <td>
                <a href="/products?action=delete&id=${Product.id}">
                    <button>Xoa</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>


</body>
</html>