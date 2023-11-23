<%--
  Created by IntelliJ IDEA.
  User: leekk
  Date: 2023-11-20
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.inyeon.paging.Paging" %>

<%
    Object obj = request.getAttribute("paging");
    Paging paging = (Paging) obj;
    int startPage = paging.getStartPage();
    int endPage = paging.getEndPage();
    boolean prev = paging.isPrev();
    boolean next = paging.isNext();

%>

<html>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/commonBody.css">
    <script src="js/sportsvoucherfunctionjs.js"></script> <!-- Separate JavaScript file -->
    <script>
        $(document).ready(function () {

            var startPage = "<%=startPage%>";
            var endPage = "<%=endPage%>";
            var prev = "<%=prev%>";
            var next = "<%=next%>";
            console.log(startPage);
            console.log(endPage);
            console.log(prev);
            console.log(next);

            paging(prev, startPage, endPage, next);

            $("#ctprvn_nm").change(function (){

                var ctprvn_nm = $("#ctprvn_nm").val();
                var main_item_nm = $("#main_item_nm").val();
                var page = 1;
                ajaxselect(ctprvn_nm, main_item_nm, page);
            });

            $("#main_item_nm").change(function () {
                var ctprvn_nm = $("#ctprvn_nm").val();
                var main_item_nm = $("#main_item_nm").val();
                var page = 1;
                ajaxselect(ctprvn_nm, main_item_nm, page);
            });

            $(".classname").on("mouseenter", function() {
                // 마우스를 가져다 대면 커서를 바꿈
                $(this).css("cursor", "pointer");
            });

            $(".classname").on("mouseleave", function() {
                // 마우스를 벗어나면 기본 커서로 변경
                $(this).css("cursor", "default");
            });

            $(".classname").on("click", function() {
                var classname = $(this).text();
                console.log("class" + classname);
                window.location.href = "/voucherselect" + '?fclty_nm=' + encodeURIComponent(classname);
            });

        });
    </script>
    <style>
        table, tr, td {
            border : 1px solid black;
            text-align: center;
        }
    </style>
</head>

<body>
<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
<main>
    <div class="mainContainer">
        <select id="ctprvn_nm" name="ctprvn_nm">
            <option value="-" selected>지역</option>
            <c:forEach var="citynamelist" items="${cityname}">
                <option value="${citynamelist}">${citynamelist}</option>
            </c:forEach>
        </select>

        <select id="main_item_nm" name="main_item_nm">
            <option value="-" selected>종목</option>
            <c:forEach var="itemnamelist" items="${itemname}">
                <option value="${itemnamelist}">${itemnamelist}</option>
            </c:forEach>
        </select>

        <span>* 시설명을 클릭하시면 상세정보로 이동합니다.</span>

        <table id="sportsclasslist">
            <tr>
                <td>시 도</td>
                <td>종목명</td>
                <td>주소</td>
                <td>시설명</td>
            </tr>
            <c:forEach var="lista" items="${list}">
                <tr>
                    <td>${lista.ctprvn_nm}</td>
                    <td>${lista.main_item_nm}</td>
                    <td>${lista.fclty_addr}, ${lista.fclty_detail_addr}</td>
                    <td class="classname">${lista.fclty_nm }</td>
                </tr>
            </c:forEach>
        </table>
        <ul class="paging" id="paging">

        </ul>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>