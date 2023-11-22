<%@ page import="com.example.inyeon.main.dto.SportsclassDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-17
  Time: 오후 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/commonBody.css">
</head>
<script>
    $(document).ready(function (){

        $("#ctprvn_nm").change(function (){

                var ctitemnm = {ctprvn_nm: $("#ctprvn_nm").val(),
                                item_nm: $("#item_nm").val(),};
                console.log(ctprvn_nm);
                console.log(item_nm);
                $.ajax({
                    url: "/sportsclasscityname",
                    method: "GET",
                    data: ctitemnm,
                    success: function (data) {
                        console.log(data);
                        var dataList = data.list;
                        selectCity(dataList);

                    }, error: function (e) {
                        console.log(e.responseText);
                    }

                });

        });

        $("#item_nm").change(function (){

            var ctitemnm = {ctprvn_nm: $("#ctprvn_nm").val(),
                             item_nm: $("#item_nm").val(),};
            console.log(ctprvn_nm);
            console.log(item_nm);
            $.ajax({
                url: "/sportsclasscityname",
                method: "GET",
                data: ctitemnm,
                success: function (data) {
                    console.log(data);
                    var dataList = data.list;
                    selectCity(dataList);

                }, error: function (e) {
                    console.log(e.responseText);
                }

            });

        });



        function selectCity(data){

            $("#sportsclasslist").empty();

            $("#sportsclasslist").append('<tr>' + '<td>' + '종목명' + '</td>'
                + '<td>' + '부종목명' + '</td>'
                + '<td>' + '시도명' + '</td>'
                + '<td>' + '시군구명' + '</td>'
                + '<td>' + '교실명' + '</td>'
                +'</tr>');

            $.each(data, function (index, lists){
                console.log("bbbbb>>> : " + lists.item_nm);
                $("#sportsclasslist").append('<tr>' + '<td>' + lists.item_nm + '</td>'
                                                    + '<td>' + lists.subitem_nm + '</td>'
                                                    + '<td>' + lists.ctprvn_nm + '</td>'
                                                    + '<td>' + lists.signgu_nm + '</td>'
                                                    + '<td>' + lists.clssrm_nm + '</td>'
                                                    +'</tr>');

                console.log($("#ctprvn_nm").val());
            });
        }

    });
</script>
<style>
    table, tr, td {
        border : 1px solid black;
        text-align: center;
    }
</style>
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
        <select id="item_nm" name="item_nm">
            <option value="-" selected>종목</option>
            <c:forEach var="itemnamelist" items="${itemname}">
                <option value="${itemnamelist}">${itemnamelist}</option>
            </c:forEach>
        </select>
        <table id="sportsclasslist">
            <tr>
                <td>종목명</td>
                <td>부종목명</td>
                <td>시도명</td>
                <td>시군구명</td>
                <td>교실명</td>
            </tr>
            <c:forEach var="lista" items="${list}">
               <tr>
                   <td>${lista.item_nm}</td>
                   <td>${lista.subitem_nm}</td>
                   <td>${lista.ctprvn_nm}</td>
                   <td>${lista.signgu_nm}</td>
                   <td>${lista.clssrm_nm}</td>
               </tr>
            </c:forEach>
        </table>
        <ul class="paging">
            <c:if test="${paging.prev}">
                <span><a href='<c:url value="/sportsclass?page=${paging.startPage-1}"/>'>이전</a></span>
            </c:if>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                <span><a href='<c:url value="/sportsclass?page=${num}"/>'>${num}</a></span>
            </c:forEach>
            <c:if test="${paging.next && paging.endPage>0}">
                <span><a href='<c:url value="/sportsclass?page=${paging.endPage+1}"/>'>다음</a></span>
            </c:if>
        </ul>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>
