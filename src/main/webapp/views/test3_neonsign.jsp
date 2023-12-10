<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    html,
    body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        display: table;
        background-color: black;
    }

    @font-face {
        font-family: neon;
        src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
    }

    .container {
        display: table-cell;
        text-align: center;
        vertical-align: middle;
    }

    .neon {
        font-family: neon;
        color: #FB4264;
        font-size: 25px;
        text-shadow: 0 0 3vw #F40A35;
    }

    .flux {
        font-family: neon;
        color: #426DFB;
        font-size: 25px;
        text-shadow: 0 0 3vw #2356FF;
    }

    .neon {
        animation: neon 1s ease infinite;
        -moz-animation: neon 1s ease infinite;
        -webkit-animation: neon 1s ease infinite;
    }

    @keyframes neon {
        0%,
        100% {
            text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
            color: #FED128;
        }
        50% {
            text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
            color: #806914;
        }
    }

    .flux {
        animation: flux 2s linear infinite;
        -moz-animation: flux 2s linear infinite;
        -webkit-animation: flux 2s linear infinite;
        -o-animation: flux 2s linear infinite;
    }

    @keyframes flux {
        0%,
        100% {
            text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
            color: #28D7FE;
        }
        50% {
            text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
            color: #146C80;
        }
    }
</style>

<div  class="col-sm-8">
    <div class="container">
        <div class="neon">환영</div>
        <div class="flux">합니다</div>
    </div>
</div>