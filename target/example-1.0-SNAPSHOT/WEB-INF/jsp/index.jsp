<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021/1/26
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getScheme()+"://"+request.getServerName()+":"
        +request.getServerPort()+"/"+request.getContextPath()+"/";
%>
<html>
<head>
    <title>图书管理</title>
    <base href="<%=path%>">
    <script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#find").click(function(){
                var $bookid = $("#input").val();
                var $src = "book/"+$bookid+"/detail";
                $("#find").attr("href",$src);
            });
        });

        $(function () {
            $("button").click(function () {
                // alert("dianji")
                var $bookid = $("#bookid").val();
                var $studentid = $("#studentid").val();
                $.ajax({
                    url:"book/"+$bookid+"/appoint",
                    type:"post",
                    data:{
                        bookId: $bookid,
                        studentId :$studentid
                    },
                    dataType:"json",
                    success:function (resp) {
                        // alert(resp)
                        $("#side").html("");//清空info内容
                        if (resp.success === true){
                            var item = resp.data;
                            $("#side").append(
                                "<div>"+"书号："+item.bookId+"</div>"+
                                "<div>"+"结果"+item.stateInfo+"</div>"
                            );
                            if (item.appointment !== null){
                                var info = item.appointment;
                                var mydate = new Date(info.appointTime);
                                $("#side").append(
                                    "<h3>"+"预约信息"+"</h3>" +
                                    "<table border='2px'>" +
                                        "<tr>"+
                                        "<td>"+"图书编号"+"</td>"+
                                        "<td>"+"学号"+"</td>"+
                                        "<td>"+"预约时间"+"</td>"+
                                        "<td>"+"图书信息"+"</td>"+
                                        "</tr>"+
                                        "<tr>"+
                                        "<td>"+info.bookId+"</td>"+
                                        "<td>"+info.studentId+"</td>"+
                                        "<td>"+mydate.toUTCString()+"</td>"+
                                        "<td>"+"书名："+info.book.name+"  余量"+info.book.number+"</td>"+
                                        "</tr>"+
                                    "</table>"
                                )
                            }
                        }else{
                            alert(resp.error);
                            $("#bookid").val("");
                            $("#studentid").val("");
                        }
                    }
                })
            })
        })

    </script>
</head>
<body>
    <input type="text" id="input">
    <a style="text-decoration: none;color: black;border:2px" href="" methods="get" id="find">查询</a>
    <br/>
    <a href="book/list" methods="get">查询所有</a>
    <br/>

    <h2>预约图书</h2>

    <table border="2px">
        <tr>
            <td>图书编号</td>
            <td><input type="text" name="book_id" id="bookid"></td>
        </tr>
        <tr>
            <td>学号</td>
            <td><input type="text" name="student_id" id="studentid"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><button id="button">预约</button></td>
        </tr>
    </table>

    <aside id="side">

    </aside>



</body>
</html>
