<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SportsClub</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="css/commonBody.css">

</head>

<script>
    $(document).ready(function(){
        $(".clubname").on("click", function() {
            var clubName = $(this).text();
            alert("club" + clubName);
            window.location.href = "/sportsclubSelect" + '?club_nm=' + encodeURIComponent(clubName);

        });
    });

</script>

<style>
    table, td {
        border: 1px solid black;
        text-align: center;
    }

    table {
        width: 100%;
    }
</style>
<body>
<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
<main>
    <div class="mainContainer">
    <p>SportsClub</p>
    <select>
        <option>종목</option>
        <option>검도</option>
        <option>게이트볼</option>
        <option>골볼</option>
        <option>기타</option>
        <option>농구</option>
        <option>다트</option>
        <option>당구</option>
        <option>댄스스포츠</option>
        <option>럭비</option>
        <option>론볼</option>
        <option>바둑</option>
        <option>배구</option>
        <option>배드민턴</option>
        <option>보치아</option>
        <option>볼링</option>
        <option>사격</option>
        <option>사이클</option>
        <option>수영</option>
        <option>슐런</option>
        <option>스키</option>
        <option>승마</option>
        <option>아이스슬레지하키</option>
        <option>야구소프트볼</option>
        <option>양궁</option>
        <option>역도</option>
        <option>요트</option>
        <option>육상</option>
        <option>조정</option>
        <option>축구</option>
        <option>컬링</option>
        <option>탁구</option>
        <option>태권도</option>
        <option>테니스</option>
        <option>파워싸커</option>
        <option>파워골프</option>
        <option>펜싱</option>
        <option>플로어볼</option>
    </select>
    <table>
        <tr>
            <td>종목명</td>
            <td>부종목명</td>
            <td>시도명</td>
            <td>시군구명</td>
            <td>동호회명</td>
        </tr>
        <c:forEach var="club" items="${sportsclub}">
            <tr>
                <td>${club.item_nm}</td>
                <td>${club.subitem_nm}</td>
                <td>${club.ctprvn_nm}</td>
                <td>${club.signgu_nm}</td>
                <td class="clubname">${club.club_nm}</td>
            </tr>
        </c:forEach>
    </table>
    <ul class="paging">
        <c:if test="${paging.prev}">
            <span><a href='<c:url value="/sportsclub?page=${paging.startPage-1}"/>'>이전</a></span>
        </c:if>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
            <span><a href='<c:url value="/sportsclub?page=${num}"/>'>${num}</a></span>
        </c:forEach>
        <c:if test="${paging.next && paging.endPage>0}">
            <span><a href='<c:url value="/sportsclub?page=${paging.endPage+1}"/>'>다음</a></span>
        </c:if>
    </ul>
    </div>
</main>
    <!-- footer include start-->
    <jsp:include page="footer.jsp" />
    <!-- footer include end-->
</body>
</html>
