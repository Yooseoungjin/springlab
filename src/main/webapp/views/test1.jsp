<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    @import url("https://fonts.googleapis.com/css2?family=Gluten:wght@700&display=swap");

    html,
    body {
        height: 100%;
    }

    body {
        --color-dark: 210 55% 8%;
        --color-dark-static: 210 55% 25%;
        --color-light: 200 60% 90%;
        --font-size: min(20vw + 1rem, 12rem);

        display: grid;
        place-items: center;
        overflow: hidden;
        background-color: hsl(var(--color-dark));
        font-size: var(--font-size);
        font-family: "Gluten", sans-serif;
        perspective: 40em;
    }

    .css {
        --rotate: 70deg;
        --transition: 400ms cubic-bezier(0.25, 1, 0.5, 1);

        display: flex;
        position: relative;
        top: 0.25em;
        color: hsl(var(--color-dark-accent));
        user-select: none;
        perspective: 2em;
        transform: scale(0.9);
        transform-style: preserve-3d;
        transition: var(--transition);
        transition-property: perspective, transform;
        cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg'  width='40' height='48' viewport='0 0 100 100' style='fill:black;font-size:24px;'><text y='50%'>😘</text></svg>")
        16 0,
        auto;
    }

    .css::before,
    .css::after {
        --s: calc(var(--font-size) * 2);

        content: "";
        position: absolute;
        left: 50%;
        width: var(--s);
        height: calc(var(--s) / 2);
        background-color: hsl(var(--color-light));
        opacity: 0;
        transform: translateZ(-1vmin) translateX(-50%) scale(0);
        transition: var(--transition);
        transition-property: opacity, transform;
        pointer-events: none;
    }

    .css::before {
        bottom: 50%;
        border-top-left-radius: 360px;
        border-top-right-radius: 360px;
        transform-origin: bottom center;
    }

    .css::after {
        --s: calc(var(--font-size) * 2);

        top: 50%;
        transform-origin: top center;
        transform: translateX(-50%) rotateX(var(--rotate)) scale(0.001);
        background: linear-gradient(
                to bottom,
                hsl(var(--color-light)) 0%,
                hsla(var(--color-light) / 0.951) 6.3%,
                hsla(var(--color-light) / 0.888) 12.1%,
                hsla(var(--color-light) / 0.815) 17.6%,
                hsla(var(--color-light) / 0.734) 22.8%,
                hsla(var(--color-light) / 0.647) 27.9%,
                hsla(var(--color-light) / 0.557) 33%,
                hsla(var(--color-light) / 0.466) 38.3%,
                hsla(var(--color-light) / 0.377) 43.8%,
                hsla(var(--color-light) / 0.292) 49.7%,
                hsla(var(--color-light) / 0.213) 56.1%,
                hsla(var(--color-light) / 0.143) 63.1%,
                hsla(var(--color-light) / 0.084) 70.9%,
                hsla(var(--color-light) / 0.039) 79.5%,
                hsla(var(--color-light) / 0.01) 89.2%,
                hsla(var(--color-light) / 0) 100%
        );
    }

    .css span {
        --rotate-letter: 34deg;

        display: flex;
        flex-direction: column;
        line-height: 0.475;
        color: hsl(var(--color-dark-static));
        perspective: 1em;
        transition: var(--transition);
        transition-property: color, transform;
        transform-style: preserve-3d;
    }

    .css span::after {
        display: block;
        color: hsl(var(--color-dark));
        transform-origin: top center;
        transform: rotateX(var(--rotate)) scaleY(1.25);
        pointer-events: none;
        z-index: -1;
    }

    .css :first-child::after {
        content: "c";
    }

    .css :not(:first-child)::after {
        content: "s";
    }

    .css :first-child {
        transform-origin: left center;
    }

    .css :last-child {
        transform-origin: right center;
    }

    /* Hover */
    .css:hover {
        transform: scale(1.25);
    }

    .css:hover::before {
        opacity: 1;
        transform: translateZ(-1vmin) translateX(-50%) scale(1.05);
    }

    .css:hover::after {
        opacity: 1;
        transform: translateZ(-1vmin) translateX(-50%) rotateX(var(--rotate))
        scale(1.05);
    }

    .css:hover span {
        color: hsl(var(--color-dark));
        transform: translateZ(6vmin);
    }

    .css:hover :first-child {
        transform: translateX(20%) rotateY(calc(var(--rotate-letter) * -1));
    }

    .css:hover :last-child {
        transform: translateX(-20%) rotateY(var(--rotate-letter));
    }
</style>
<html>
<head>
    <title>Main</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<div class="css">
    <span>C</span>
    <span>S</span>
    <span>S</span>
</div>
</body>
</html>
