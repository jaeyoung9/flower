<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의꽃</title>
<script>
$(document).ready(function(){
    $(document).on('click','#myPage', function(){
    $.ajax({
        url : "<c:url value='/myPage'/>",
        type : "POST",
        dataType :"TEXT",
        data : {"USER_NUM" :  $("#USER_NUM").val()},
        // 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 일단 user_id 는 flower
        success : function (data) {
           location.href='/flower/myPage?USER_ID='+$('#USER_ID').val();
        }

    });
})
})
/*
===============================================================

Hi! Welcome to my little playground!

My name is Tobias Bogliolo. 'Open source' by default and always 'responsive',
I'm a publicist, visual designer and frontend developer based in Barcelona. 

Here you will find some of my personal experiments. Sometimes usefull,
sometimes simply for fun. You are free to use them for whatever you want 
but I would appreciate an attribution from my work. I hope you enjoy it.

===============================================================
*/
$(document).ready(function(){

  //Swipe speed:
  var tolerance = 100; //px.
  var speed = 650; //ms.

  //Elements:
  var interactiveElements = $('input, button, a');
  var itemsLength = $('.panel').length;
  var active = 1;

  //Background images:
  for (i=1; i<=itemsLength; i++){
    var $layer = $(".panel:nth-child("+i+")");
    var bgImg = $layer.attr("data-img");
    $layer.css({
      "background": "url("+bgImg+") no-repeat center / cover"
    });
  };

  //Transitions:
  setTimeout(function() {
    $(".panel").css({
      "transition": "cubic-bezier(.4,.95,.5,1.5) "+speed+"ms"
    });
  }, 200);

  //Presets:
  $(".panel:not(:first)").addClass("right");

  //Swipe:
  function swipeScreen() {
    $('.swipe').on('mousedown touchstart', function(e) {

      var touch = e.originalEvent.touches;
      var start = touch ? touch[0].pageX : e.pageX;
      var difference;

      $(this).on('mousemove touchmove', function(e) {
        var contact = e.originalEvent.touches,
        end = contact ? contact[0].pageX : e.pageX;
        difference = end-start;
      });

      //On touch end:
      $(window).one('mouseup touchend', function(e) {
        e.preventDefault();

        //Swipe right:
        if (active < itemsLength && difference < -tolerance) {
          $(".panel:nth-child("+active+")").addClass("left");
          $(".panel:nth-child("+(active+1)+")").removeClass("right");
          active += 1;
          btnDisable();
        };

        // Swipe left:
        if (active > 1 && difference > tolerance) {
          $(".panel:nth-child("+(active-1)+")").removeClass("left");
          $(".panel:nth-child("+active+")").addClass("right");
          active -= 1;
          btnDisable();
        };

        $('.swipe').off('mousemove touchmove');
      });

    });
  };
  swipeScreen();

  //Prevent swipe on interactive elements:
  interactiveElements.on('touchstart touchend touchup', function(e) {
    e.stopPropagation();
  });

  //Buttons:
  $(".btn-prev").click(function(){
    // Swipe left:
    if (active > 1) {
      $(".panel:nth-child("+(active-1)+")").removeClass("left");
      $(".panel:nth-child("+active+")").addClass("right");
      active -= 1;
      btnDisable();
    };
  });

  $(".btn-next").click(function(){
    //Swipe right:
    if (active < itemsLength) {
      $(".panel:nth-child("+active+")").addClass("left");
      $(".panel:nth-child("+(active+1)+")").removeClass("right");
      active += 1;
      btnDisable();
    };
  });

  function btnDisable() {
    if (active >= itemsLength) {
      $(".btn-next").prop("disabled", true);
      $(".btn-prev").prop("disabled", false);
    }
    else if (active <= 1) {
      $(".btn-prev").prop("disabled", true);
      $(".btn-next").prop("disabled", false);
    }
    else {
      $(".btn-prev, .btn-next").prop("disabled", false);
    };
  };

});
</script>

<style>
/* Global */
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

html,
body,
.container {
  width: 100%;
  height: 100%;
  max-height: 90%;
  margin: 0;
  padding: 0;
  /* Font styles */
  line-height: 1.5em;
  color: #607D8B;
  letter-spacing: .01em;
}

.container {
  position: relative;
}

/* Panels */
.swipe {
  position: relative;
  width: 100%;
  height: 100%; /* "min-height" doesn't work on Firefox. */
  background: #eee;
  overflow-x: hidden;
}

.panel {
  position: absolute;
  width: 100%;
  min-height: 100%;
  top: 0;
  left: 0;
  padding: 20px;
}

.left {
  left: -100%;
}

.right {
  left: 100%;
}

/* Info */
.info {
  position: absolute;
  width: 80%;
  max-width: 500px;
  bottom: 20%;
  right: 10%;
  pointer-events: none;
}

.inner {
  position: relative;
  padding: 1.66em 3em;
  background: #FFFFFF;
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}

.info:before {
  content: "";
  position: absolute;
  width: 65%;
  height: 80%;
  top: 0;
  left: 0;
  -webkit-transform: translate(-10px, -10px);
  -ms-transform: translate(-10px, -10px);
  -o-transform: translate(-10px, -10px);
  transform: translate(-10px, -10px);
  background: #E91E63;
  background: #3F51B5;
}

.buttons {
  position: absolute;
  bottom: -50px;
  right: 5%;
  pointer-events: all;
}

.buttons button {
  transition: ease .4s;
}

.btn-prev,
.btn-next {
  width: 60px;
  height: 60px;
  margin-left: 10px;
  border: none;
  outline: none;
  border-radius: 60px;
  color: #FFFFFF;
  background: -webkit-linear-gradient(top, #F5515F, #E91E63);
  background: linear-gradient(to bottom, #F5515F, #E91E63);
  box-shadow: 0px 3px 15px 2px rgba(245,81,95,.8);
  cursor: pointer;
}

.buttons button:hover {
  box-shadow: 0px 3px 30px 3px rgba(245,81,95,.8);
}

.buttons button:disabled {
  box-shadow: 0px 1px 5px 0px rgba(245,81,95,.8);
  background: -webkit-linear-gradient(top, #E91E63, #F5515F);
  background: linear-gradient(to bottom, #E91E63, #F5515F);
  cursor: default;
}

/* Optional content */
.optional {
  width: 80%;
  max-width: 680px;
  margin: 6em auto;
  padding: 2em 3em;
  box-shadow: 
    0 3px 12px rgba(0,0,0,0.16), 
    0 3px 12px rgba(0,0,0,0.23);
}

@media (max-width: 620px) {
  body {
    font-size: 13px;
    line-height: 1.5em;
  }
  .info {
    position: absolute;
    width: 100%;
    max-width: 100%;
    bottom: 0;
    right: 0;
  }

  .inner {
    padding: .5em 1.5em;
    box-shadow: none;
  }
  
  .buttons {
    display: none;
  }
}
.main {
   width: 100%;
   height: 100vh;
   display: block;
   text-align: center;
   margin: auto;
   position: relative;
   
}



</style>

</head>
<body>
<input type="hidden" id="USER_ID" value="${USER_ID}">
<div class="container">

  <!-- Panels -->
  <div class="swipe">
  <c:forEach items="${list}" var="list">
   <div class="panel" data-img="images/${list.STORED_FILE_THUMB}"></div>
  </c:forEach>
  </div>

  <!-- Info -->
  <div class="info">
   
    <div class="buttons">
      <button class="btn-prev" disabled>&larr;</button>
      <button class="btn-next">&rarr;</button>
    </div>
  </div>

</div>


</body>
</html>