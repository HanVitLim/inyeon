<%--
  Created by IntelliJ IDEA.
  User: HHS
  Date: 2023-11-22
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/mainBody.css">

    <title>메인페이지</title>
</head>
<body>
    <div id="wrap">
        <!--Header include start-->
        <jsp:include page="header.jsp" />
        <!--Header include end-->

        <main>
            <div class="main_container">
                <div class="search">
                    <select>
                        <option value="sel_default">메뉴 선택</option>
                        <option value="sel_voucher">강좌이용권 시설정보</option>
                        <option value="sel_class">생활체육 교실</option>
                        <option value="sel_club">생활체육 동호회</option>
                    </select>
                    <input id="search_box" type="text" placeholder="검색어 입력">
                    <img id="search_icon" src="./img/search_icon.png">
                </div>

                <div class="botton_container">
                    <div id="sportvoucher_div">
                        <div id="voucher_title">
                            강좌이용권 시설정보
                        </div>
                        <div id="voucher_image" onclick="navigateToPage('/voucher')">
                        </div>
                    </div>
                    <div id="sportclass_div">
                        <div id="class_title">
                            생활체육 교실
                        </div>
                        <div id="class_image" onclick="navigateToPage('/sportsclass')">

                        </div>
                    </div>
                    <div id="sportclub_div">
                        <div id="club_title">
                            생활체육 동호회
                        </div>
                        <div id="club_image" onclick="navigateToPage('/sportsclub')">

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- footer include start -->
        <jsp:include page="footer.jsp" />
        <!-- footer include end -->
    </div>

    <script>
        function navigateToPage(pageUrl) {
            window.location.href = pageUrl;
        }
    </script>
</body>
</html>
