<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
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
    .gnb li a:hover::after {
        width: calc(100% - 2rem);
        height: 3px;
        background-size: contain; /* 배경 이미지(svg)가 알맞게 들어가도록*/
    }
    /* hover된 링크의 글자 색상 정의(하얀색)*/
    /* .hovered-link 선택자명은 추후 JS로 추가할 예정!*/
    .hovered-link {
        color: var(--color-textb) !important;
    }
    /* .gnb li a:hover::after의 svg에 배경이미지 지정!*/
    .hovered-link::after {
        background-image: url("/uimg/kuk.jpg");
    }
</style>

<script>
    let cursor = {
        init: function () {
            let mouseCursor = document.querySelector(".cursor");
            let navLinks = document.querySelectorAll(".gnb"); //메뉴 링크
            //window 객체에 scroll & mouse 이벤트를 추가하고 cursor함수 실행되도록 함
            window.addEventListener("scroll", cursor);
            window.addEventListener("mousemove", cursor);

            //커스텀 커서의 left값과 top값을 커서의 XY좌표값과 일치시킴
            function cursor(e) {
                mouseCursor.style.left = e.pageX + "px";
                mouseCursor.style.top = e.pageY - scrollY + "px";
            }

            navLinks.forEach((link) => {
                link.addEventListener("mouseover", () => {
                    mouseCursor.classList.add("cursor-grow");
                    mouseCursor.style.zIndex = "-1";
                    link.classList.add("hovered-link");
                });
                link.addEventListener("mouseleave", () => {
                    mouseCursor.classList.remove("cursor-grow");
                    mouseCursor.style.zIndex = "1000";
                    link.classList.remove("hovered-link");
                });
            });
        }
    }

    $(function(){
        // cursor.init();
    });

</script>
<body>
<%--<div class="cursor"></div>--%>
    <div class="col-sm-2 sidenav">
        <p><a href="/pic">Pic</a></p>
        <c:if test="${logincust != null}">
        <p><a href="/websocket">websocket</a></p>
        </c:if>
        <p><a class="gnb" href="/cfr1">CFR1</a></p>
        <p><a href="/cfr2">CFR2</a></p>
        <p><a href="/ocr1">ocr1</a></p>
        <p><a href="/ocr2">ocr2</a></p>
        <p><a href="/cal1">cal1</a></p>
        <p><a href="/cal2">cal2</a></p>
        <p><a href="/cal3">cal3</a></p>
        <p><a href="/cal4">cal4</a></p>
        <p><a href="/cal5">cal5</a></p>
        <p><a href="/cal6">cal6</a></p>
        <p><a href="/todayflower">todayflower</a></p>
    </div>
</body>
</html>