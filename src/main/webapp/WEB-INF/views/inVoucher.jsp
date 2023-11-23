<%--
  Created by IntelliJ IDEA.
  User: leekk
  Date: 2023-11-20
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    table, tr, td {
        border: 1px solid black;
        text-align: center;
    }
</style>
<html>
<head>
    <title>Title</title>
    <!-- Kakao Maps API Script -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d7d471db687c23809bd48aaf7da534a"></script>
    <link rel="stylesheet" href="css/commonBody.css">

</head>
<body>
<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
<main>
    <div class="mainContainer">
    <select id="selectCtprvn" onchange="updateSignguOptions()">
    <c:forEach var="selecta" items="${select}">
        <option value="${selecta.ctprvn_cd}">${selecta.ctprvn_nm}</option>
    </c:forEach>
</select>

<!-- Second select box -->
<select id="selectSigngu">
    <!-- Options will be dynamically populated using JavaScript -->
</select>

<script>
    function updateSignguOptions() {

        // Get the selected value from the first select box
        var selectedCtprvnCd = document.getElementById("selectCtprvn").value;

        // Clear the current options in the second select box
        var selectSigngu = document.getElementById("selectSigngu");
        selectSigngu.innerHTML = "";

        // Iterate over the select2 items and add options based on the selected value
        <c:forEach var="selectb" items="${select2}">
        if ("${selectb.ctprvn_cd}" === selectedCtprvnCd) {
            var option = document.createElement("option");
            option.value = "${selectb.signgu_nm}";
            option.text = "${selectb.signgu_nm}";
            selectSigngu.appendChild(option);
        }
        </c:forEach>
    }

    function openKakaoMap(fclty_crdnt_la, fclty_crdnt_lo) {
        // You can customize the map options and marker based on your requirements
        var mapContainer = document.getElementById('kakao-map');
        var mapOptions = {
            center: new kakao.maps.LatLng(fclty_crdnt_la, fclty_crdnt_lo), // Seoul coordinates (you can set your default center)
            level: 3
        };
        var map = new kakao.maps.Map(mapContainer, mapOptions);

        var geocoder = new kakao.maps.services.Geocoder();

        geocoder.addressSearch(locationName, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // Add a marker for the location
                var marker = new kakao.maps.Marker({
                    position: coords
                });

                marker.setMap(map);

                // Set the map center to the location coordinates
                map.setCenter(coords);
            }
        });

        // Show a modal or overlay with the map
        // You can customize the styling and behavior based on your requirements
        // For simplicity, I'll just show a basic example using an alert
        alert('Kakao Map for ' + locationName);
    }
</script>

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
            <td>${lista.main_item_nm}</td>
            <td>${lista.fclty_nm}</td>
            <td>${lista.ctprvn_nm}</td>
            <td>${lista.signgu_nm}</td>
            <td>
                <!-- Clickable link to open Kakao Map -->
                <a href="#" onclick="openKakaoMap('${lista.fclty_crdnt_la}','${lista.fclty_crdnt_lo}')">${lista.fclty_nm}</a>
            </td>
        </tr>
    </c:forEach>
</table>
<ul class="paging">
    <c:if test="${paging.prev}">
        <span><a href='<c:url value="/voucher?page=${paging.startPage-1}"/>'>이전</a></span>
    </c:if>
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
        <span><a href='<c:url value="/voucher?page=${num}"/>'>${num}</a></span>
    </c:forEach>
    <c:if test="${paging.next && paging.endPage>0}">
        <span><a href='<c:url value="/voucher?page=${paging.endPage+1}"/>'>다음</a></span>
    </c:if>
</ul>
<!-- Container for Kakao Map -->
<div id="kakao-map" style="width: 300px; height: 300px;"></div>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>
