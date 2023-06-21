<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    #w2{
        width:500px;
        border: 2px solid red;
    }
</style>

<script>
// 음...기존의 weather1 방식으로 HTML에 $로 직접 반영...아래 방식 weather3도 연습해보자
/*    let todayFlower = {
        init:function (){
            $.ajax({
                url:'/todayflower',
                success:function (data){
                    center.display(data);
                }
            });
        },display:function (data){
            var result = data.response.body.items.item;
            var txt = '';
            $(result).each(function (index,item){ //배열안에 있는 객체 만큼 돌아간다.
                txt +='<h5>';
                txt += item.flowerName
                txt +='<h5>';
            });
            $('#w2').html(txt);
        }
    };
    $(function (){
        todayFlower.init();
    });*/
</script>

<div class="col-sm-8 text-left">
    <h1>오늘의꽃: ${todayFlower.flowerName}</h1>
    <h3>꽃   말: ${todayFlower.flowerMeaning}</h3>
    <hr>
    <H8>${todayFlower.fContent}</H8>
    <hr>
    <H8>${todayFlower.fMonthDay}</H8>
    <br>
    <img src="${todayFlower.imgUrl1}" width="200px">
    <img src="${todayFlower.imgUrl2}" width="200px">
    <img src="${todayFlower.imgUrl3}" width="200px">
</div>