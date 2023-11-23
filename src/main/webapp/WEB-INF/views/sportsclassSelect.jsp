<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/commonBody.css">
    <script src="js/functionjs.js"></script> <!-- Separate JavaScript file -->
    <script>
        $(document).ready(function(){

            $(document).on("click", "#All", function(){
                window.history.go(-1);
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
        <table>
            <tr>
                <td colspan="2" align="center">교실명:${list[0].clssrm_nm}</td>
            </tr>
            <tr>
                <td>종목명:${list[0].item_nm}</td>
                <td>부종목명:${list[0].subitem_nm}</td>
            </tr>
            <tr>
                <td>시도명:${list[0].ctprvn_nm}</td>
                <td>시군구명:${list[0].signgu_nm}</td>
            </tr>
            <tr>
                <td>장애유형명:${list[0].trobl_ty_nm}</td>
                <td>운영시간:${list[0].oper_time_cn}</td>
            </tr>
            <tr>
                <td>교실 소개</td>
                <td>${list[0].clssrm_intrcn_cn}</td>
            </tr>
            <tr>
                <td>모집기간:${list[0].oper_pd}</td>
                <td>운영기간:${list[0].rcrit_pd}</td>
            </tr>
        </table>
        <button type="button" id="All">목록</button>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>
