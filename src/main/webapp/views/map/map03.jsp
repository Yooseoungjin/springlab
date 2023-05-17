<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #map03 > #map{
        width:800px;
        height:400px;
        border: 2px solid blue;
        margin-top: 10px;
    }
</style>
<script>
    let map03 = {
        map:null,
        init:function (){
            this.display();
            $('#s_btn').click(function (){
                map03.go(37.63844,127.01202,'s'); /*서버에 'S' 데이터 줘*/
            });
            $('#b_btn').click(function (){
                map03.go(35.179645,129.078543,'b'); /*서버에 'B' 데이터 줘*/
            });
            $('#j_btn').click(function (){
                map03.go(33.4997002,126.539178,'j'); /*서버에 'J' 데이터 줘*/
            });
        },
        display:function (){
            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(37.5192199, 126.9271762), // 지도의 시작좌표
                level: 5 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(37.5192199, 126.9271762);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },
        go:function (lat,lng,loc){

            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            // var moveLatLon = new kakao.maps.LatLng(lat,lng);
            // map.panTo(moveLatLon);

            var markerPosition  = new kakao.maps.LatLng(lat,lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            map03.markers(loc);
        },
        markers:function (loc){
            $.ajax({
               url:'/markers',
               data:{'loc':loc},
               success:function (data){
                   map03.displaymarkers(data);
                   // alert(data);
               }
            });
        },
        displaymarkers:function (positions){
               var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                for (var i = 0; i < positions.length; i ++) {
                    var imageSize = new kakao.maps.Size(20, 30);
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                    var markerPosition = new kakao.maps.LatLng(positions[i].lat,positions[i].lng);

                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: markerPosition,
                        title : positions[i].title,
                        image : markerImage
                    });
                    // infoWindow
                    var iwContent = '<h2>'+positions[i].title+'</h2>';
                    iwContent += '<img src="/uimg/'+positions[i].img+'" style="width:50px">';

                    var infowindow = new kakao.maps.InfoWindow({
                        position : markerPosition,
                        content : iwContent
                    });

                    kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                    kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                    kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].id));


                    function mouseoverListener(marker, infowindow) {
                        return function(){
                            infowindow.open(map, marker);
                        };
                    }
                    function mouseoutListener(marker, infowindow) {
                        return function(){
                            infowindow.close();
                        };
                    }
                    function mouseclickListener(target) {
                        return function(){
                            location.href = '/map/detail?id='+target;
                        };
                    }

                } // end for
        }
    };

    $(function (){
        map03.init();
    })

</script>

<div class="col-sm-8 text-left">
    <div class="container" id="map03">
        <h3>map03</h3>
        <button id="s_btn" type="button" class="btn btn-primary">SEOUL</button>
        <button id="b_btn"type="button" class="btn btn-primary">BUSAN</button>
        <button id="j_btn"type="button" class="btn btn-primary">JEJU</button>
        <div id="map"></div>
    </div>
</div>