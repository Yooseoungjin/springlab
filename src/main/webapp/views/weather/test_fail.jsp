<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let w = {
        init:function (){
            $('#btn').click(function (){
                console.log(btn);
                navigator.geolocation.getCurrentPosition(success);
            });

            const success = (position) => {
                console.log(position);
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;
                getWeather(latitude, longitude);
            }

            const tempSection = document.querySelector('.temperature');
            const placeSection = document.querySelector('.place');
            const descSection = document.querySelector('.description');

            const getWeather = (lat, lon) => {
                fetch(
                    `https://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=2a46eaaf77ed481752c3b3e338fd7a02&units=metric&lang=kr`

                )
                    .then((response) => {
                        return response.json();
                        console.log(json);
                    })
                    .then((json) => {
                        console.log(json);
                        const temperature = json.main.temp;
                        const place = json.name;
                        const description = json.weather[0].description;

                        tempSection.innerText = temperature;
                        placeSection.innerText = place;
                        descSection.innerText = description;
                    })
                    .then((json) => {
                        const icon = json.weather[0].icon;
                        const iconURL = `http://openweathermap.org/img/wn/${icon}@2x.png`;

                        iconSection.setAttribute('src', iconURL);
                    })
            }
            const fail = () => {
              alert("좌표를 받아올 수 없음");
            }
        },
    };
    $(function (){
        w.init();
    })
</script>
<!-- CONTENT -->
<body>
    <button id="btn" type="button">현재 날씨는?</button>
    <dl>
        <dt>기온</dt>
        <dd class="temperature"></dd>
        <dt>위치</dt>
        <dd class="place"></dd>
        <dt>설명</dt>
        <dd class="description"></dd>
    </dl>
</body>


