<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnKt8_N4-FKOnhI_pSaDL7g_g-XI1-R9E"></script>
<script src="./assets/js/vendor.bundle.js"></script>
<script src="./assets/js/theme.bundle.js"></script>



<style>
    #w2{
        width:500px;
        border: 2px solid gray;
    }
</style>

<script>
    let weather = {
        init:function (){
            $.ajax({
                url:'/weather2',
                success:function (data){
                    weather.display(data);
                    console.log(data);
                }
            });
        },display:function (data){
            var result = data.response.body.items.item;
            var txt = '';
            $(result).each(function (index,item){ //배열안에 있는 객체 만큼 돌아간다.
                txt +='<h8>';
                txt += item.tm+'  '+'기온 '+item.ta+'  '+'일조 '+item.ss+'  '+'풍속 '+item.ws;
                txt += '  '+'습도 '+item.hm+'  '+'강수량 '+item.rn;
                txt +='<h8><br>';
            });
            $('#w2').html(txt);
        }
    };
    $(function (){
        weather.init();
    });
</script>
<script>

</script>
<!-- CONTENT -->
<body>
    <div>
        <div class="row">
            <div class="col">
                <span style="font-size: smaller">${weatherinfo}</span>
            </div>
            <div class="col" id="w2" style="font-size: smaller; overflow: auto">
            </div>
        </div>
    </div>
</body>


