<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<div>
    <c:forEach var="obj" items="${Name}"> <%--clist의 객채 1개씩 c라는 이름으로 끄집어 내겟다--%>
        <td>${obj}</td><br>
    </c:forEach>
</div>
</body>


