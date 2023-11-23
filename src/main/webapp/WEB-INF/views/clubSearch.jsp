<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HHS
  Date: 2023-11-22
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/mainBody.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <title>메인페이지</title>
</head>
<script>
    $(document).ready(function(){
        $(".clubname").on("click", function() {
            var clubName = $(this).text();
            alert(clubName);
            window.location.href = "/sportsclubSelect" + '?club_nm=' + encodeURIComponent(clubName);
        });
    });
</script>
<style>
    table, td {
        border: 1px solid black;
    }
</style>
<body>
<div id="wrap">
    <!--Header include start-->
    <jsp:include page="header.jsp" />
    <!--Header include end-->

    <main>
        <div class="main_container">


                <table>
                    <tr>
                        <td>종목명</td>
                        <td>부종목명</td>
                        <td>시도명</td>
                        <td>시군구명</td>
                        <td>동호회명</td>
                    </tr>
                    <c:forEach var="lista" items="${list}">
                        <tr>
                            <td>${lista.item_nm}</td>
                            <td>${lista.subitem_nm}</td>
                            <td>${lista.ctprvn_nm}</td>
                            <td>${lista.signgu_nm}</td>
                            <td class="clubname">${lista.club_nm}</td>
                        </tr>
                    </c:forEach>
                </table>
        </div>
    </main>
    <!-- footer include start -->
    <jsp:include page="footer.jsp" />
    <!-- footer include end -->
</div>

</body>
</html>
