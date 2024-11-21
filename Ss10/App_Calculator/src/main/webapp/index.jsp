<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Simple Calculator" %>
</h1>
<form action="/calucator" method="post">
    <ul>
        <li>
            <p>First operand:
                <input type="number" name="num1" id="num1" placeholder="Nhập Số"></p>
            <p>Second operand:
                <input type="number" name="num2" id="num2" placeholder="Nhập Số "></p>
        </li>
        <li>
            <p>Operator:
                <select name="operation" id="">
                    <option value="add">Cộng</option>
                    <option value="subtract">Trừ</option>
                    <option value="multiply">Nhân</option>
                    <option value="divide">Chia</option>
                </select></p>
        </li>
    </ul>
    <div>
        <button type="submit">Calculate</button>
    </div>
</form>
</body>
</html>