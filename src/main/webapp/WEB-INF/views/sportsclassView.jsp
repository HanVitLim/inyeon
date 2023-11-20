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
<%
%>
<style>
    table, tr, td {
        border : 1px solid black;
        text-align: center;
    }

</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
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
</body>
</html>
