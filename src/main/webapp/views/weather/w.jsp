<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let w = {
        init:function (){
            window.onload=function(){
                getWeather();
            };

            const tempSection = document.querySelector('.temperature');
            const placeSection = document.querySelector('.place');
            const descSection = document.querySelector('.description');
            const humiditySection = document.querySelector('.humidity');
            const mainSection = document.querySelector('.main');
            const windSection = document.querySelector('.wind');
            const cloudsSection = document.querySelector('.clouds');
            const iconSection = document.querySelector('.icon')

            const getWeather = () => {
                fetch(
                    `https://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=2a46eaaf77ed481752c3b3e338fd7a02&units=metric`
                )
                .then((response) => {
                    return response.json();
                })
                .then((json) => {
                    const temperature = json.main.temp;
                    const place = json.name;
                    const description = json.weather[0].description;
                    const humidity = json.main.humidity;
                    const main = json.weather[0].main;
                    const wind = json.wind.speed;
                    const clouds = json.clouds.all;

                    tempSection.innerText = temperature;
                    placeSection.innerText = place;
                    descSection.innerText = description;
                    humiditySection.innerText = humidity;
                    mainSection.innerText = main;
                    windSection.innerText = wind;
                    cloudsSection.innerText = clouds;

                    const icon = json.weather[0].icon;
                    const iconURL = "http://openweathermap.org/img/wn/"+icon+".png";
                    iconSection.setAttribute('src', iconURL);
                })
            }
        },
    };
    $(function (){
        w.init();
    })
</script>
<!-- CONTENT -->
<body>
<dl>
    <dt>위치</dt>
    <dd class="place"></dd>
    <dt>메인</dt>
    <dd class="main"></dd>
    <dt>기온</dt>
    <dd class="temperature"></dd>
    <dt>습도</dt>
    <dd class="humidity"></dd>
    <dt>바람</dt>
    <dd class="wind"></dd>
    <dt>구름</dt>
    <dd class="clouds"></dd>
    <dt>설명</dt>
    <img class="icon"/>
    <dd class="description"></dd>
</dl>
</body>


