<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    //오늘 날짜출력
    $(document).ready(function () {

        function convertTime() {
            var now = new Date();
            var month = now.getMonth() + 1;
            var date = now.getDate();
            return month + '월' + date + '일';
        }
        var currentTime = convertTime();
        $('.nowtime').append(currentTime);
    });

    //제이쿼리사용
    $.getJSON('https://api.openweathermap.org/data/2.5/weather?q=london,kr&appid=2a46eaaf77ed481752c3b3e338fd7a02&units=metric',
        function (WeatherResult) {
            //기온출력
            $('.SeoulNowtemp').append(WeatherResult.main.temp);
            $('.SeoulLowtemp').append(WeatherResult.main.temp_min);
            $('.SeoulHightemp').append(WeatherResult.main.temp_max);

            //날씨아이콘출력
            //WeatherResult.weater[0].icon
            var weathericonUrl =
                '<img src= "http://openweathermap.org/img/wn/'
                + WeatherResult.weather[0].icon +
                '.png" alt="' + WeatherResult.weather[0].description + '"/>'

            $('.SeoulIcon').html(weathericonUrl);
        });
</script>
<!-- CONTENT -->
<body>
    <span class="nowtime"></span>
    <span>현재날씨</span>

    <h3>서울날씨</h3>
    <h3 class="SeoulIcon"></h3>
    <h3 class="SeoulNowtemp">현재기온:</h3>
    <h3 class="SeoulLowtemp">최저기온:</h3>
    <h3 class="SeoulHightemp">최대기온:</h3>
</body>