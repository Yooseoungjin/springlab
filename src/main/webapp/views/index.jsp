<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html lang="ko">
<head>
    <title>유성진의 싸이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/js/index0421.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec38c6135c4252732539ced707a33ad6"></script>

    <%--HighChart Library--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/cylinder.js"></script>
    <script src="https://code.highcharts.com/modules/funnel3d.js"></script>
    <script src="https://code.highcharts.com/modules/pyramid3d.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>

    <%--web socket--%>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>

    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;

        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 650px}

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #555;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }

        #scroll-btn {
            opacity: 0;
            width: 50px;
            height: 50px;
            color: #fff;
            background-color: #ef476f;
            position: fixed;
            bottom: 13%;
            right: 10%;
            border: 2px solid #fff;
            border-radius: 50%;
            font: 2px monospace;
            transition: opacity 2s, transform 2s;
        }
        #scroll-btn.show {
            opacity: 1;
            transition: opacity 5s, transform 5s;
        }
        #scroll-btn2 {
            opacity: 0;
            width: 50px;
            height: 50px;
            color: #fff;
            background-color: #ef476f;
            position: fixed;
            bottom: 5%;
            right: 10%;
            border: 2px solid #fff;
            border-radius: 50%;
            font: bold 10px monospace;
            transition: opacity 2s, transform 2s;
        }
        #scroll-btn2.show {
            opacity: 1;
            transition: opacity 5s, transform 5s;
        }

        /*!* 기본 색상 변수에 담기 *!*/
        /*html {*/
        /*    --color-texta: #1d1d1d;*/
        /*    --color-textb: #fff;*/
        /*}*/
        /*!* 시스템 커서 안 보이게 숨기기 *!*/
        /*body {*/
        /*    cursor: none;*/
        /*}*/
        /*!* 커스텀 커서 스타일 정의해주기 *!*/
        /*.cursor {*/
        /*    width: 2rem;*/
        /*    height: 2rem;*/
        /*    border: 2px solid var(--color-texta);*/
        /*    border-radius: 50%;*/
        /*    position: absolute;*/
        /*    z-index: 1000;*/
        /*    transform: translate(-50%, -50%);*/
        /*    pointer-events: none;*/
        /*    transition: all 0.3s ease;*/
        /*    transition-property: background, transform;*/
        /*    transform-origin: 100% 100%;*/
        /*    backdrop-filter: sepia(20%);*/
        /*    background-size: cover;*/
        /*}*/
        /*.cursor-grow {*/
        /*    transform: scale(2);*/
        /*    background-color: white;*/
        /*    z-index: 1000;*/
        /*}*/

        /* 점선이 들어갈 ::after(pseudo)요소 만들고 크기값 설정해주기*/
        /*.gnb li a:hover::after {*/
        /*    width: calc(100% - 2rem);*/
        /*    height: 3px;*/
        /*    background-size: contain; !* 배경 이미지(svg)가 알맞게 들어가도록*!*/
        /*}*/
        /*!* hover된 링크의 글자 색상 정의(하얀색)*!*/
        /*!* .hovered-link 선택자명은 추후 JS로 추가할 예정!*!*/
        /*.hovered-link {*/
        /*    color: var(--color-textb) !important;*/
        /*}*/
        /*!* .gnb li a:hover::after의 svg에 배경이미지 지정!*!*/
        /*.hovered-link::after {*/
        /*    background-image: url("/uimg/kuk.jpg");*/
        /*}*/
    </style>

    <script>
// let cursor = {
//     init: function () {
//         let mouseCursor = document.querySelector(".cursor");
//         let navLinks = document.querySelectorAll(".gnb li a"); //메뉴 링크
//         //window 객체에 scroll & mouse 이벤트를 추가하고 cursor함수 실행되도록 함
//         window.addEventListener("scroll", cursor);
//         window.addEventListener("mousemove", cursor);
//
//         //커스텀 커서의 left값과 top값을 커서의 XY좌표값과 일치시킴
//         function cursor(e) {
//             mouseCursor.style.left = e.pageX + "px";
//             mouseCursor.style.top = e.pageY - scrollY + "px";
//         }
//
//         navLinks.forEach((link) => {
//             link.addEventListener("mouseover", () => {
//                 mouseCursor.classList.add("cursor-grow");
//                 mouseCursor.style.zIndex = "-1";
//                 link.classList.add("hovered-link");
//             });
//             link.addEventListener("mouseleave", () => {
//                 mouseCursor.classList.remove("cursor-grow");
//                 mouseCursor.style.zIndex = "1000";
//                 link.classList.remove("hovered-link");
//             });
//         });
//     }
// }

let chatbtn = {
    init:function(){
        const scrollBtn = document.createElement("button");
        scrollBtn.innerHTML = "chatbot";
        scrollBtn.setAttribute("id", "scroll-btn");
        document.body.appendChild(scrollBtn);
        scrollBtn.classList.add("show");
        scrollBtn.addEventListener("click", function(){
            location.href='/chatbot';
        });
        const scrollBtn2 = document.createElement("button");
        scrollBtn2.innerHTML = "1:1";
        scrollBtn2.setAttribute("id", "scroll-btn2");
        document.body.appendChild(scrollBtn2);
        scrollBtn2.classList.add("show");
        scrollBtn2.addEventListener("click", function(){
            location.href='/callcenter';
        });
    }
};

$(function(){
    chatbtn.init();
});

</script>
</head>


<body>
<header>
<%--<nav class="navbar navbar-inverse">--%>
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar" >
            <ul class="nav navbar-nav gnb" style="z-index: 999;">
                <li><a href="/">Home</a></li>
                <c:if test="${logincust != null}"> <%--로그인커스트(로그인한경우) 에만 보이게 해라--%>
                    <li><a href="/jsp">JSP</a></li>
                    <li><a href="/ajax">AJAX</a></li>
                    <li><a href="/map">MAP</a></li>
                    <li><a href="/chart">CHART</a></li>
                </c:if>
                <li><a href="/cust">Cust</a></li>
                <li><a href="/item">Item</a></li>
                <c:if test="${logincust != null}"> <%--로그인커스트(로그인한경우) 에만 보이게 해라--%>
                    <li><a href="#">Contact</a></li>
                </c:if>
            </ul>

            <c:choose>
                <c:when test="${logincust == null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        <li><a href="/register"><span class="glyphicon glyphicon-print"></span> register</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="nav navbar-nav navbar-right">
                       <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="/item/allcart?id=${logincust.id}">
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/custinfo?id=${logincust.id}">${logincust.id}</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
<%--</nav>--%>
</header>

<div class="container-fluid text-center">
    <div class="row content">

        <%--Left Menu 시작--%>
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose>
        <%--Left Menu end--%>

        <%--Center Menu start--%>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
        <%--Center Menu end--%>

        <div class="col-sm-2 sidenav">
            <div class="well">
                <p>ADS</p>
            </div>
            <div class="well">
                <p>ADS</p>
            </div>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <p>Footer Text</p>
</footer>

</body>
</html>
