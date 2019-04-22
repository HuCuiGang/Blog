<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html >
<!--
　　 へ　　　　　／|
　　/＼7　　∠＿/
　 /　│　　 ／　／
　│　Z ＿,＜　／　　 /`ヽ
　│　　　　　ヽ　　 /　　〉
　 Y　　　　　`　 /　　/
　ｲ●　､　●　　⊂⊃〈　　/
　()　 へ　　　　|　＼〈
　　>ｰ ､_　 ィ　 │ ／／
　 / へ　　 /　ﾉ＜| ＼＼
　 ヽ_ﾉ　　(_／　 │／／
　　7　　　　　　　|／
　　＞―r￣￣`ｰ―＿
翠刚家的皮卡丘,对偷看者使用十万伏特
-->
<head>
  <title>人工智能机器人mini</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="Keywords" content="人工智能机器人mini" />
  <meta name="Description" content="人工智能机聊天mini机器人为你分担烦恼" />
  <link rel="Shortcut Icon" href="imgs/samllworldlogo.png" type="image/x-icon">
  <style type="text/css">

    body {background: #060e1b;}
    canvas {opacity: 0.5;position:absolute;top:0;left:0;}

    /*<!-- 通配符"*"表示匹配所有 -->*/
    *{margin:0;padding:0;}
    /*<!-- 设置背景图片 -->*/
    /*body{background: url(imgs/timg.png)no-repeat;}*/


    /*<!-- 设置中央区域属性 -->*/
    #content{width:800px;height:600px;background:rgba(255,255,255,.5);margin:0px auto 0;position: relative;}

    /*<!-- 设置中央头部区域属性 -->*/
    #content .c_head{width:100%;height:60px;background:#4caf50;position: relative;}
    #content .c_head img{margin-left:10px;float:left;position: relative;}
    #content .c_head span{line-height:60px;display: block;height:60px;left;color:#fff;font-size:18px;cursor:pointer;position: relative;}

    /*<!-- 设置中央中心区域属性 -->*/
    #content .c_center{width:100%;height:440px;overflow:auto ; position: relative;background: url(imgs/timg.png)no-repeat;}

    /*<!-- 设置中央中心计算机会话框区域属性 -->*/
    #content .c_center .rWord{width:100%;margin-top:20px;overflow:hidden;position: relative; position: relative;}
    #content .c_center .rWord span{display: block;width:30px;height:40px;background: url(imgs/touxiang.png);margin:0 10px;float:left;position: relative;}
    #content .c_center .rWord p{float:left;background:rgba(0,0,255,.5);padding:10px;color:black;border-radius:10px;max-width:240px;position: relative;}

    /*<!-- 设置中央中心我的会话框区域属性 -->*/
    #content .c_center .mWord{width:100%;overflow:hidden;margin-top:20px;position: relative;}
    #content .c_center .mWord span{display: block;width:40px;height:40px;background: url(imgs/wtouxiang.png);margin:0 10px;float:right;position: relative;}
    #content .c_center .mWord p{float:right;background:#19b955;padding:10px;color:#333;border-radius:10px;max-width:240px;position: relative;}

    /*<!-- 设置中央底部区域属性 -->*/
    #content .c_footer{width:100%;height:60px;position: relative;}

    /*<!-- 设置底部输入框区域属性 -->*/
    #input{width:620px;height:60px;background:rgba(0,0,0,.1);outline:none;border:none;margin:20px;margin-top:10px;border-radius:10px;text-indent:20px;font-size:16px;position: relative;}

    /*<!-- 设置底部按钮区域属性 -->*/
    #btn{width:100px;height:60px;background:rgba(0,0,0,.5);float:right;text-align:center;line-height:60px;margin: 20px;margin-top:10px;color:#fff;border-radius:12px;cursor:pointer;position: relative;}
  </style>
</head>

<body>
<canvas id="canvas" width="800px" height="600px"></canvas>
<!-- 不能以数字以及特殊符号要见名之意-->
<!-- 头部文字-->

<!-- 中央头部文字及LOGO图片-->
<div id="content">
  <div class="c_head">
    <img src="imgs/timglogo.png" alt="logo" width="40" height="60"/>
    <span>人工智能 聊天MINI机器人</span>
  </div>

  <!-- 中央头机器人会话框-->
  <div class="c_center">
    <div class="rWord">
      <span></span>
      <p>你好呀!我是mini，我可是个聪明的宝宝，跟我聊聊天吧！^_^</p>
    </div>
  </div>
  <!-- 输入框及按钮-->
  <div class="c_footer">
    <input id="input" type="text"/>
    <div id="btn">发送</div>
  </div>

  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" >
    $(function(){
      $("#btn").click(function(){
        var message=$("#input").val();
        $(".c_center").append('<div class="mWord"><span></span><p>'+message+'</p></div>');
        $.ajax({
          type:"post",
          url:"http://localhost:8080/robot",
          data:{"message":message},
          success:function(data){
            data=$.parseJSON(data);
            var text=data.text;

            $(".c_center").append('<div class="rWord"><span></span><p>'+text+'</p></div>');
            $(".c_center").scrollTop(1000000000);
            $("#input").val("");
            $("#input").focus();
          }
        });
      });
    });

    $(document).keydown(function(event){
      if(event.keyCode==13){
        var message=$("#input").val();
        $(".c_center").append('<div class="mWord"><span></span><p>'+message+'</p></div>');
        $.ajax({
          type:"post",
          url:"http://localhost:8080/robot",
          data:{"message":message},
          success:function(data){
            data=$.parseJSON(data);
            var text=data.text;
            $(".c_center").append('<div class="rWord"><span></span><p>'+text+'</p></div>');
            $(".c_center").scrollTop(1000000000);
            $("#input").val("");
            $("#input").focus();
          }
        });
      }
    });



    function fn() {
      window.requestAnimFrame = (function () {
        return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function (callback) {
          window.setTimeout(callback, 1000 / 60);
        }
      })();
      var canvas = document.getElementById('canvas'), ctx = canvas.getContext('2d'), w = canvas.width = window.innerWidth, h = canvas.height = window.innerHeight, hue = 217, stars = [], count = 0, maxStars = 1200;
      var canvas2 = document.createElement('canvas'), ctx2 = canvas2.getContext('2d');
      canvas2.width = 100;
      canvas2.height = 100;
      var half = canvas2.width / 2, gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
      gradient2.addColorStop(0.025, '#fff');
      gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');
      gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');
      gradient2.addColorStop(1, 'transparent');
      ctx2.fillStyle = gradient2;
      ctx2.beginPath();
      ctx2.arc(half, half, half, 0, Math.PI * 2);
      ctx2.fill();
      function random(min, max) {
        if (arguments.length < 2) {
          max = min;
          min = 0
        }
        if (min > max) {
          var hold = max;
          max = min;
          min = hold
        }
        return Math.floor(Math.random() * (max - min + 1)) + min
      }

      function maxOrbit(x, y) {
        var max = Math.max(x, y), diameter = Math.round(Math.sqrt(max * max + max * max));
        return diameter / 2
      }

      var Star = function () {
        this.orbitRadius = random(maxOrbit(w, h));
        this.radius = random(60, this.orbitRadius) / 12;
        this.orbitX = w / 2;
        this.orbitY = h / 2;
        this.timePassed = random(0, maxStars);
        this.speed = random(this.orbitRadius) / 900000;
        this.alpha = random(2, 10) / 10;
        count++;
        stars[count] = this
      };
      Star.prototype.draw = function () {
        var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX, y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY, twinkle = random(10);
        if (twinkle === 1 && this.alpha > 0) {
          this.alpha -= 0.05
        } else if (twinkle === 2 && this.alpha < 1) {
          this.alpha += 0.05
        }
        ctx.globalAlpha = this.alpha;
        ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
        this.timePassed += this.speed
      };
      for (var i = 0; i < maxStars; i++) {
        new Star()
      }
      function animation() {
        ctx.globalCompositeOperation = 'source-over';
        ctx.globalAlpha = 0.8;
        ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 1)';
        ctx.fillRect(0, 0, w, h);
        ctx.globalCompositeOperation = 'lighter';
        for (var i = 1, l = stars.length; i < l; i++) {
          stars[i].draw()
        }
        ;
        window.requestAnimationFrame(animation)
      }

      animation();
    }
    fn();
  </script>
</body>
</html>
