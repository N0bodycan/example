<%@ page import="java.util.List" %>
<%@ page import="com.mycode.pcy.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021/1/26
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息</title>
</head>
<body>
    <% Object list =  request.getAttribute("list");
        List<Book> bookList = (List<Book>) list;
    %>
    <table border="2px">
        <tr>
            <td>图书编号</td>
            <td>图书名称</td>
            <td>图书数量</td>
        </tr>
        <% for (Book b : bookList){ %>
        <tr>
            <td><%=b.getBookId()%></td>
            <td><%=b.getName()%></td>
            <td><%=b.getNumber()%></td>
        </tr>
        <%}%>
    </table>
</body>
</html>
