<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//cdn.jsdelivr.net/npm/velocity-animate@2.0/velocity.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/velocity-animate@2.0/velocity.ui.min.js"></script>

<html>
<style>
  body { margin:0px; padding:0; }
  #container {
    position: absolute;
    top: 0px;
    width: 50%;
    height: 100%;
    background-color: black;
  }

  .ken {
    margin: 100px auto;
  }

  /* other sprites preloading */
  .ken:before {
    content:'';
    background: url('http://front-back.com/wp-content/uploads/2013/01/ken-tatsumaki-senpuu-kyaku.png') no-repeat;
  }
  .ken:after {
    content:'';
    background-image: url(https://uploads.codesandbox.io/uploads/user/50ba5672-ab19-466c-a1a4-38e62b5eb553/S5rk-ken.png);
    background-repeat: no-repeat;
  }

  .ken, .fireball {
    transform: translate(0px, 0px);
    width: 70px;
    height: 80px;
    background: url('https://uploads.codesandbox.io/uploads/user/50ba5672-ab19-466c-a1a4-38e62b5eb553/S5rk-ken.png') no-repeat;
  }

  .tatsumaki {
    width: 70px;
    height: 110px;
    margin: 70px auto;
    background: url('http://front-back.com/wp-content/uploads/2013/01/ken-tatsumaki-senpuu-kyaku.png') no-repeat;
  }

  .shoryuken {
    width: 70px;
    height: 110px;
    margin: 70px auto;
    background: url('http://front-back.com/wp-content/uploads/2013/01/ken-shoryuken.png') no-repeat;
  }

  .commands {
    position: absolute;
    top: 0px;
    left: 50px;

    margin-left:450px;
    font-size:12px; padding:15px;

    }

</style>
<script>
  let el = document.querySelector('.ken')
  let sx = 0
  let ex = -210
  let sy = -80
  let ey = -80
  let n = 3
  let duration = 400
  let walk = 20
  let jump = 100
  let isLoop = false
  let completed = true
  let isQueue = ''

  let hadoken = function () {
    let ken = el.getBoundingClientRect()
    let fireBall = document.createElement('div')
    fireBall.className = 'fireball basic'
    fireBall.style.position = 'absolute'
    fireBall.style.top = ken.top + 'px'
    fireBall.style.left = (ken.left + 50) + 'px'
    document.querySelector('#container').appendChild(fireBall)

    sx = 0
    ex = -70
    sy = -320
    ey = -320
    duration = 400
    n = 1
    isLoop = true
    isQueue = ''
    play(fireBall)
    let pos = getPosition(fireBall)
    moveWithScale(fireBall, pos.x, 0, pos.x + 400, 0, false, 3000, function () {
      fireBall.parentNode.removeChild(fireBall)
    })
  }

  function getPosition (el) {
    const transArr = []
    if(!window.getComputedStyle) return
    const style = getComputedStyle(el),
            transform = style.transform || style.transform || style.mozTransform
    let mat = transform.match(/^matrix3d\((.+)\)$/)
    if(mat) return parseFloat(mat[1].split(', ')[13])
    mat = transform.match(/^matrix\((.+)\)$/)
    mat ? transArr.push(parseFloat(mat[1].split(', ')[4])) : 0
    mat ? transArr.push(parseFloat(mat[1].split(', ')[5])) : 0
    return {
      x: transArr[0],
      y: transArr[1]
    }
  }

  function fixedAnimation () {
    sx = 0
    ex = -210
    sy = -80
    ey = -80
    duration = 400 // other animation must be lower than 400
    n = 3
    isLoop = true
    isQueue = ''
    play(el)
  }

  function play (el, cb) {
    Velocity(el, {
      backgroundPositionX: [ex, sx],
      backgroundPositionY: [ey, sy]
    }, {
      easing: [ n ],
      duration: duration,
      loop: isLoop,
      queue: isQueue,
      complete: function () {
        completed = true
        el.classList.remove('shoryuken')
        el.classList.remove('tatsumaki')
        if (typeof cb === 'function') {
          cb()
        }
      }
    });
  }

  function pause () {
    isLoop = false
    Velocity(el, 'stop');
  }

  function move (el, sx, sy, ex, ey, q, d, cb) {
    Velocity(el, {
      translateX: [ex, sx],
      translateY: [ey, sy],
    }, {
      queue: q,
      duration: d,
      complete: function () {
        if (typeof cb === 'function') {
          cb()
        }
      }
    })
  }

  function moveWithScale (el, sx, sy, ex, ey, q, d, cb) {
    Velocity(el, {
      translateX: [ex, sx],
      translateY: [ey, sy],
      scale: [1, 0.5]
    }, {
      queue: q,
      duration: d,
      complete: function () {
        if (typeof cb === 'function') {
          cb()
        }
      }
    })
  }

  window.onkeydown = function(e) {
    if (!completed) return
    completed = false

    pause()
    // s - hadoken
    if (e.keypress === 83) {
      hadoken()
      n = 3
      ex = -210
      sy = 0
      ey = 0
      isLoop = false
      duration = 400
    }
    // a - punch
    if (Code == 65) {
      n = 2
      ex = -140
      sy = -160
      ey = -160
      duration = 200
    }
    // e - reverse kick
    if (e.keyCode == 69) {
      n = 4
      ex = -280
      sy = -560
      ey = -560
      duration = 400
    }
    // z - kick
    if (e.keyCode === 90) {
      n = 4
      ex = -280
      sy = -480
      ey = -480
      duration = 200
    }
    // left
    if (e.keyCode == 37) {
      n = 4
      ex = -280
      sy = -240
      ey = -240
      duration = 400
      let pos = getPosition(el)
      move(el, pos.x, pos.y, pos.x - walk, pos.y, false, 200)
    }
    // right
    if (e.keyCode == 39) {
      n = 4
      ex = -280
      sy = -240
      ey = -240
      duration = 400
      let pos = getPosition(el)
      move(el, pos.x, pos.y, pos.x + walk, pos.y, false, 200)
    }
    // up
    if (e.keyCode === 38) {
      n = 6
      ex = -420
      sy = -640
      ey = -640
      duration = 400
      let pos = getPosition(el)
      move(el, pos.x, pos.y, pos.x, pos.y - jump, false, duration / 2, function () {
        let pos = getPosition(el)
        move(el, pos.x, pos.y, pos.x, pos.y + jump, false, duration / 2)
      })
    }
    // down
    if (e.key == 40) {
      n = 1
      ex = 0
      sy = -720
      ey = -720
      duration = 150
    }
    // q - tatsumaki
    if (e.keyCode === 81) {
      n = 12
      ex = -840
      sy = 0
      ey = 0
      duration = 1000
      el.classList.add('tatsumaki')
    }
    // d - shoryuken
    if (e.keyCode === 68) {
      n = 6
      ex = -420
      sy = 0
      ey = 0
      duration = 600
      el.classList.add('shoryuken')
      let pos = getPosition(el)
      move(el, pos.x, pos.y, pos.x, pos.y - jump, false, duration / 2, function () {
        let pos = getPosition(el)
        move(el, pos.x, pos.y, pos.x, pos.y + jump, false, duration / 2)
      })
    }

    play(el, function () {
      fixedAnimation()
    })
  }

  play(el, function () {
    fixedAnimation()
  })
</script>
<head>
    <title>Main</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<!-- Thanks to @code_dependant for the example! -->
<div id="container">
  <div class="ken">
  </div>
</div>

<div class="commands">
  <h1>Control Ken with ur keyboard</h1>

  Punch: <button id="a">a</button><br>
  Kick: <button id="z">z</button><br>
  Reverse kick: <button id="e">e</button><br>
  <br>
  Tatsumaki: <button id="q">q</button><br>
  Hadoken: <button id="s">s</button><br>
  Shoryuken: <button id="d">d</button><br>
  <br>
  Jump: &nbsp;&nbsp;&nbsp;<button id="up">▲</button><br>
  Walk: <button id="left">◀</button><button id="right">►</button><br>
  Kneel: &nbsp;&nbsp;<button id="down">▼</button>
</div>
</body>
</html>
