<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d7d471db687c23809bd48aaf7da534a"></script>
<head>
    <title>SportsClub</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="your_external_script.js"></script>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>

<c:if test="${not empty listS}">
    <c:set var="firstItem" value="${listS[0]}" />
    <c:forEach var="item" items="${listS}">
        <form class="clubSelect" name="clubSelect">
            <table>
                <tr>
                    <td colspan="2" align="center">동호회명: ${item.fclty_nm}</td>
                </tr>
                <tr>
                    <td>종목명: ${item.fclty_nm}</td>
                    <td>부종목명: ${item.fclty_nm}</td>
                </tr>
                <tr>
                    <td>시도명: ${item.ctprvn_nm}</td>
                    <td>시군구명: ${item.signgu_nm}</td>
                </tr>
                <tr>
                    <td>장애유형명: ${item.fclty_nm}</td>
                    <td>운영시간: ${item.fclty_nm}</td>
                </tr>
                <tr>
                    <td>동호회 소개</td>
                    <td>${item.fclty_nm}</td>
                </tr>
            </table>
            <button type="button" id="All">목록</button>
        </form>
    </c:forEach>
</c:if>

<div id="map" style="width:500px;height:400px;"></div>

<script>
    <c:if test="${not empty listS}">
    var mapOption = {
        center: new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo}),
        level: 3
    };

    var markerPosition = new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo});

    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    </c:if>

    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo}),
        level: 3
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);

    var mapTypeControl = new kakao.maps.MapTypeControl();

    var markerPosition = new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo});

    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    marker.setMap(map);

    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    function getInfo() {
        var center = map.getCenter();
        var level = map.getLevel();
        var mapTypeId = map.getMapTypeId();
        var bounds = map.getBounds();
        var swLatLng = bounds.getSouthWest();
        var neLatLng = bounds.getNorthEast();
        var boundsStr = bounds.toString();
    }
</script>

</body>
</html>
