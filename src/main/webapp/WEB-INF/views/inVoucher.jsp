<%--
  Created by IntelliJ IDEA.
  User: leekk
  Date: 2023-11-20
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="css/commonBody.css">

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

    </head>
    <body>
    <!-- header include start -->
    <jsp:include page="header.jsp"/>
    <!-- header include end -->
    <main>
    <div class="mainContainer">
        <select>
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
        </script>
        <script>
            $(document).ready(function(){
                $(".voname").on("click", function() {
                    var voName = $(this).text();
                    window.location.href = "/voucherselect" + '?fclty_nm=' + encodeURIComponent(voName);
                });
            });
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
                <td class="voname">${lista.fclty_nm}</td>
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
        </div>
        </main>
        <!-- footer include start-->
        <jsp:include page="footer.jsp" />
        <!-- footer include end-->
    </body>
</html>