<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
    html {
        background: #FFEBDB;
        text-align: center;
        font-size: 10px;
    }

    body {
        margin: 0;
        font-size: 2rem;
        display: flex;
        flex: 1;
        min-height: 100vh;
        align-items: center;
    }

    .clock {
        width: 30rem;
        height: 30rem;
        border: 7px solid #FFEBDB;
        box-shadow: -4px -4px 10px rgba(67,67,67,0.1),
        inset 4px 4px 10px rgba(168, 145, 128,0.6),
        inset -4px -4px 10px rgba(201, 175, 155,0.2),
        4px 4px 10px rgba(168, 145, 128,0.5);
        border-radius: 50%;
        margin: 50px auto;
        position: relative;
        padding: 2rem;
        background-image: url('https://every-tuesday.com/wp-content/themes/et2017_sage/assets/images/teachable/watercolor-florals/video-corner-a.jpg');
        background-size: 111%;
    }

    .outer-clock-face {
        position: relative;
        width: 100%;
        height: 99%;
        border-radius: 100%;
        overflow: hidden;

    }

    .outer-clock-face::after {
        -webkit-transform: rotate(90deg);
        -moz-transform: rotate(90deg);
        transform: rotate(90deg)
    }

    .outer-clock-face::before,
    .outer-clock-face::after,
    .outer-clock-face .marking{
        content: '';
        position: absolute;
        width: 10px;
        height: 100%;
        background: #596235;
        z-index: 0;
        left: 49%;
        border-radius: 8px;
    }

    .outer-clock-face .marking {
        background: #596235;
        width: 3px;
    }

    .outer-clock-face .marking.marking-one {
        -webkit-transform: rotate(30deg);
        -moz-transform: rotate(30deg);
        transform: rotate(30deg)
    }

    .outer-clock-face .marking.marking-two {
        -webkit-transform: rotate(60deg);
        -moz-transform: rotate(60deg);
        transform: rotate(60deg)
    }

    .outer-clock-face .marking.marking-three {
        -webkit-transform: rotate(120deg);
        -moz-transform: rotate(120deg);
        transform: rotate(120deg)
    }

    .outer-clock-face .marking.marking-four {
        -webkit-transform: rotate(150deg);
        -moz-transform: rotate(150deg);
        transform: rotate(150deg)
    }

    .inner-clock-face {
        position: absolute;
        top: 10%;
        left: 11%;
        width: 80%;
        height: 80%;
        background: #FFEBDB;
        -webkit-border-radius: 100%;
        -moz-border-radius: 100%;
        border-radius: 100%;
        z-index: 1;
        background-image: url('https://every-tuesday.com/wp-content/themes/et2017_sage/assets/images/teachable/watercolor-florals/video-corner-a.jpg');
        background-size: 126%;
    }

    .inner-clock-face::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 16px;
        height: 16px;
        border-radius: 18px;
        margin-left: -9px;
        margin-top: -6px;
        background: #4d4b63;
        z-index: 11;
    }

    .hand {
        width: 50%;
        right: 50%;
        height: 6px;
        background: #b03715;
        position: absolute;
        top: 50%;
        border-radius: 6px;
        transform-origin: 100%;
        transform: rotate(90deg);
        transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
    }

    .hand.hour-hand {
        width: 30%;
        z-index: 3;
    }

    .hand.min-hand {
        height: 3px;
        z-index: 10;
        width: 40%;
    }

    .hand.second-hand {
        background: #b3b3b3;
        width: 45%;
        height: 2px;
    }
</style>

<script>
    let s = {
        init:function (){
            const now = new Date();
            const seconds = now.getSeconds();
            const mins = now.getMinutes();
            const hour = now.getHours();
            const secondHand = document.querySelector('.second-hand');
            const minsHand = document.querySelector('.min-hand');
            const hourHand = document.querySelector('.hour-hand');
            const secondsDegrees = ((seconds / 60) * 360) + 90;
            const minsDegrees = ((mins / 60) * 360) + ((seconds/60)*6) + 90;
            const hourDegrees = ((hour / 12) * 360) + ((mins/60)*30) + 90;

            function setDate() {
                secondHand.style.transform = `rotate(\${secondsDegrees}deg)`;
                minsHand.style.transform = `rotate(\${minsDegrees}deg)`;
                hourHand.style.transform = `rotate(\${hourDegrees}deg)`;
            }
            setInterval(setDate(), 1000);
            // setDate();
            // setInterval(() => setDate(), 1000);
        }
    }
    $(function (){
        s.init();
    });
</script>
<html>
<body>
<div class="clock">
    <div class="outer-clock-face">
        <div class="marking marking-one"></div>
        <div class="marking marking-two"></div>
        <div class="marking marking-three"></div>
        <div class="marking marking-four"></div>
        <div class="inner-clock-face">
            <img src="">
            <div class="hand hour-hand"></div>
            <div class="hand min-hand"></div>
            <div class="hand second-hand"></div>
        </div>
    </div>
</div>
</body>
</html>