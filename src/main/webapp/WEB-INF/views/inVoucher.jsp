<%--
  Created by IntelliJ IDEA.
  User: leekk
  Date: 2023-11-20
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>hello</p>

    <select>
        <c:forEach var="test1" items="${test}">
            <option value="${test1.ctprvn_nm}">${test1.ctprvn_nm}</option>
        </c:forEach>
    </select>


</body>
</html>
