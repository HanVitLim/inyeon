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

    // 현재 페이지 번호 강조
    document.addEventListener("DOMContentLoaded", function() {
        // 현재 페이지 URL 가져오기
        var currentPage = window.location.href;

        // 모든 링크에 대해 반복
        var links = document.querySelectorAll("a");
        links.forEach(function(link) {
            // 링크의 href 속성과 현재 페이지 URL 비교
            if (link.href === currentPage) {
                // 현재 페이지와 일치하면 클래스 추가
                link.classList.add("current-page");
            }
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
            <div class="ul_container">
                <ul class="paging">
                    <c:if test="${paging.prev}">

                        <span><a href='<c:url value="/clubSearch?page=${paging.startPage-1}"/>'><img src="img/prev_icon.png" width="15px">이전</a></span>
                    </c:if>
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                        <span><a href='<c:url value="/clubSearch?page=${num}"/>'>${num}</a></span>
                    </c:forEach>
                    <c:if test="${paging.next && paging.endPage>0}">
                        <span><a href='<c:url value="/clubSearch?page=${paging.endPage+1}"/>'>다음<img src="img/next_icon.png" width="15px"></a></span>

                    </c:if>
                </ul>
            </div>
        </div>
    </main>
    <!-- footer include start -->
    <jsp:include page="footer.jsp" />
    <!-- footer include end -->
</div>

</body>
</html>
