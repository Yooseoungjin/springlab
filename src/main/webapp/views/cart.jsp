<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .medium_img{
        width:200px;
    }
</style>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>My Cart</h3>
        <c:set var="total" value="0"/> <%--총계를 구하기 위해 변수 선언--%>
        <div class = "row content">
            <div class="col-sm-9 text-left">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ITEM_ID</th>
                        <th>NAME</th>
                        <th>Price</th>
                        <th>Count</th>
                        <th>Total</th>
                        <th>RegDate</th>
                        <th>DELETE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allcart}"> <%--clist의 객채 1개씩 c라는 이름으로 끄집어 내겟다--%>
                        <tr>
                            <td><img class="medium_img" src="/uimg/${obj.item_imgname}"></td>
                            <td><a href="/item/get?id=${obj.item_id}">${obj.item_id}</a></td>
                            <td>${obj.item_name}</td>
                            <td><fmt:formatNumber value="${obj.item_price}" pattern="###,###원" /></td>
                            <td>${obj.cnt}</td>
                            <td><fmt:formatNumber value="${obj.cnt * obj.item_price}" pattern="###,###원" /></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>
                            <td><a href="/item/delcart?id=${obj.id}" class="btn btn-info" role="button">DELETE</a></td>
                        </tr>
                        <c:set var="total" value="${total + (obj.cnt * obj.item_price)}" />
                    </c:forEach>
                    </tbody>
                </table>
                <h4>장바구니 총계: <fmt:formatNumber value="${total}" pattern="###,###원" /></h4>
            </div>
        </div>

    </div>
</div>