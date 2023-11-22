<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Object obj = request.getAttribute("list");
    if (obj == null) return;

    List<SportsclubDTO> list = (List<SportsclubDTO>) obj;
    int nCnt = list.size();

    SportsclubDTO dto = null;
    if (nCnt == 1){
        dto = list.get(0);
    }
%>
<html>
<head>
    <title>SportsClub</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<script>
    $(document).ready(function(){

        $(document).on("click", "#All", function(){
            $(".clubSelect").attr({"method":"GET", "action":"sportsclubSelectAll"}).submit();
        });
    });
</script>
<style>
    table, th, td{
        border: 1px solid black;
    }
</style>
<body>

<form class="clubSelect" name="clubSelect">
    <table>
        <tr>
            <td colspan="2" align="center">동호회명:<%= dto.getClub_nm() %></td>
        </tr>
        <tr>
            <td>종목명:<%= dto.getItem_nm()%></td>
            <td>부종목명:<%= dto.getSubitem_nm()%></td>
        </tr>
        <tr>
            <td>시도명:<%= dto.getCtprvn_nm()%></td>
            <td>시군구명:<%= dto.getSigngu_nm()%></td>
        </tr>
        <tr>
            <td>장애유형명:<%= dto.getTrobl_ty_nm()%></td>
            <td>운영시간:<%= dto.getOper_time_cn()%></td>
        </tr>
        <tr>
            <td>동호회 소개</td>
            <td><%= dto.getClub_intrcn_cn()%></td>
        </tr>
    </table>
    <button type="button" id="All">목록</button>
</form>

</body>
</html>