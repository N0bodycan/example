<%@ page import="com.mycode.pcy.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021/1/26
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息</title>
</head>
<body>
    <% Book book = (Book) request.getAttribute("book");%>
    <table border="2px">
        <tr>
            <td>图书编号</td>
            <td>图书名称</td>
            <td>图书数量</td>
        </tr>
        <tr>
            <td><%=book.getBookId()%></td>
            <td><%=book.getName()%></td>
            <td><%=book.getNumber()%></td>
        </tr>
    </table>
</body>
</html>
