<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Comm"%>
<%
	ArrayList<Comm> list1 = (ArrayList<Comm>)request.getAttribute("list1"); 
    //ArrayList<Info> list2 = (ArrayList<Info>)request.getAttribute("list2"); 
    //ArrayList<Ht> list3 = (ArrayList<Ht>)request.getAttribute("list3"); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>


    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
    .f{
        font-family: 'Do Hyeon', sans-serif;
        }
    .cWrap{
        width:1100px;
        height:1600px;
        margin:auto;
    }
    .cWrap>{width:100%;}
    



/* menubar */
    #header>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
    }

    #outer {
        height:1600px;
    }
    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 300px;
    }
    .menu a{
        text-decoration:none;
        color:black;
        font-size:20px;
        line-height:50px;
        font-weight:bold;
        display:block;
         width:100%;
        height:100%;
    }
    .outerWrap a:hover{
        color:darkorchid
	}
    
    /* #content1{
        margin:auto;
        display:flex;
        justify-content: center;
        width:100%;
        height:20%;
    } */
    
    .line{
        border: 1px solid gray;
        height:250px;
        margin: 0 40px;
    }
    
    

    /* .content3 *{
        text-decoration:none;
        color:black;
        font-weight:bold;
        margin:20px;
        padding: 0px 20px;
    } */

    #todayV{
        margin:auto;
        display:flex;
        align-content: center;
        margin:30px 50px;
    }







/* footerbar */
    .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1000px;
    }

    .footer1_1{
        height:30px;
        background-color:rgb(250, 214, 9);
        padding-top:10px;

    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
    }
  


    #content1>img{
        margin:auto;
        display:table-cell;
    }
   


  


</style>
</head>
<body>
<div class="f">
    <%@ include file = "../views/common/menubar.jsp"%>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>


    <div class="cWrap">

    
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="resources/css/indexSlide.css">
        <link rel="stylesheet" type="text/css" href="resources/css/indexContent.css">
        <link rel="stylesheet" type="text/css" href="resources/css/indexPageUp.css">


        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <div id="aWrap">
    <a id="back-to-top"></a> </div>

        
        <!-- slide: ht페이지 연결 -->
        <div id="slider-wrap">
            <ul id="slider">
                <li>
                    <div>
                        <h3 style="color:rgb(228, 205, 0);">고강도 운동 같이해요!</h3>
                    </div>
                    <a href="allList.ht"><img src="resources/images/main/0-0.jpg" alt=""></a>
                </li>
        
                <li>
                    <div>
                        <h3 style="color:rgb(228, 205, 0);">가벼운 스트레칭은 하고나면 상쾌할거예요!</h3>
                    </div>
                    <a href="strechingList.ht"><img src="resources/images/main/000.jpg" alt=""></a>
                </li>
        
                <li>
                    <div>
                        <h3 style="color:rgb(228, 205, 0);">하체운동 같이해요!</h3>
                    </div>
                    <a href="lowerList.ht"><img src="resources/images/main/00.jpg" alt=""></a>
                </li>
        
                <li>
                    <div>
                        <h3 style="color:rgb(228, 205, 0);">상쾌한 전신운동을 함께 해봐요!</h3>
                    </div>
                    <a href="bodyList.ht"><img src="resources/images/main/slide1.jpg" alt=""></a>
                </li>
        
                <li>
                    <div>
                        <h3 style="color:rgb(228, 205, 0);">짧지만 효과적인 운동이 하고 싶다면 함께 해요~!</h3>
                    </div>
                    <a href="allList.ht"><img src="resources/images/main/slide2.jpg" alt=""></a>
                </li>
            </ul>
        
            <div class="slider-btns" id="next"><span>▶</span></div>
            <div class="slider-btns" id="previous"><span>◀</span></div>
        
            <div id="slider-pagination-wrap">
                <ul>
                </ul>
            </div>
        </div>
            
        <br><br><br><br><br>



        <div class="ccontent4">
            
            <div class="content4_1" style="margin-top:-200px">
                <div align="center">        
                    <i class="far fa-heart" style="color:rgb(228, 205, 0);"></i>
                    <i class="far fa-heart" style="color:rgb(228, 205, 0);"></i>
                    <i class="far fa-heart" style="color:rgb(228, 205, 0);"></i>
                </div> 

                <br><br><br>

                <h3>지루한 홈트는 더 이상 그만! <br>
                    친구들아~ 이제 모여서 같이 하자! <i class="fas fa-running"></i><i class="fas fa-running"></i><i class="fas fa-running"></i></h3>
                    <div id="sline"></div>
                    <div id="sline"></div> <br><br><br>
                    <div align="center">        
                        <i class="far fa-heart" style="color:rgb(228, 205, 0);"></i>
                        <i class="far fa-heart" style="color:rgb(228, 205, 0);"></i>
                        <i class="far fa-heart" style="color:rgb(228, 205, 0);"></i>
                    </div>
            </div>
        </div>
        


    <!-- content3 : 커뮤페이지 연결 -->
        <div class="ccontent3">
            <div class="ccontent3_1" style="margin-left:100px;">
                <a href="question.co"><img src="resources/images/main/3.jpg" alt="" width="300px" height="300px" ></a>
                <p style="display:inline-flex"></p>
            </div>
            <div class="ccontent3_2">
                <a href="free.co"><img src="resources/images/main/555.jpg" alt="" width="300px" height="300px;"></a>
               
                <div style="margin-left:30px">
                    <h3>혼자서 하는 홈트가 외롭다면? </h3><br>
                    <div class="linee"></div> <br>
                    
                    <div>
                        
                        자유게시판에서 다양한 얘기를 나눌 수 있고 <br>
                        질문게시판에서는 궁금증을 해소할 수 있어요
                        
                    </div>
                    <br>
                    <div class="linee" style="border:1px dotted grey;"></div> <br>
                    <div>
                        로그인을 하면 나만의 운동 팁 게시판에서<br>
                        식단공유와 운동 팁에 대한 정보를 얻을 수 있어요<br>
                    </div>
                    <br><br>
                    <div>
                        <a href="loginForm.us" class="cBtn">로그인 <i class="fas fa-user"></i></a>
                        <a href="freeEnroll.co" class="cBtn">글쓰러가기 <i class="fas fa-pencil-alt"></i></a>

                    </div>
                    
                </div>
                
            </div>
            <div class="ccontent3_3">
                <div style="background-color: grey;" width="40px;" height="100px"></div>
            </div>
        </div>
        <br><br><br>


    <!-- content4 :배경색 넣기 (간단 문구) -->
         <!-- content2 : 간단 글 -->
         <div class="ccontent2">
            <div class="ccontent2_1"> 
                <h3>커뮤니티에서 건강해지는 팁을 공유해보아요~! <i class="far fa-kiss-wink-heart"></i></h3> 
                
            </div>
        </div>

        <br><br><br><br><br><br><br><br>

    	<div class="ccontent4">
            <div class="ccontent4_1">
    	        <img src="resources/images/main/11.jpg" alt="" width="150px" height="150px">
                <p></p>
            </div>
            <div class="ccontent4_2">
                <img src="resources/images/main/1111.jpg" width="150px" height="150px">
                <p></p>
            </div>
            <div class="ccontent4_3">
                <img src="resources/images/main/6.jpg" width="150px" height="150px">
                <p></p>
            </div>
            <div class="ccontent4_4">
                <img src="resources/images/main/66.jpg"  width="150px" height="150px"alt="">
                <p></p>
            </div>
            <div class="ccontent4_5">
                <img src="resources/images/main/111.jpg" width="150px" height="150px">
                <p></p>
            </div>
        </div>
    	
        <br><br><br><br>
        <br><br><br><br>
    	
    	
    	
    <!-- footer -->
     
     <div class="footerOuter">
    
        <div class="footer1" id="both">
            <div class="footer1_1">
                <a href="">이용약관</a> | 
                <a href="">개인정보보호정책</a>
            </div>

            <div class="footer1_2" align="right">
                <i class="fab fa-instagram-square" fa="lg" ></i>
                <i class="fab fa-youtube"></i>
                <i class="fab fa-facebook"></i> 
            </div>
        </div>
        

        <div class="footer2">
            <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
                Daily Routine : DR <br>
                주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
                고객센터 및 제휴문의 : daily@routine.co.kr           
                <br>
                CopyRight 2000-2021 Daily Routine All Right Reserved
            </p>
        </div>
    </div>



    </div>
</div>
 
</div>

<!-- slide -->
<script>
    //slide-wrap
    var slideWrapper = document.getElementById('slider-wrap');
    //current slideIndexition
    var slideIndex = 0;
    //items
    var slides = document.querySelectorAll('#slider-wrap ul li');
    //number of slides
    var totalSlides = slides.length;
    //get the slide width
    var sliderWidth = slideWrapper.clientWidth;
    //set width of items
    slides.forEach(function (element) {
        element.style.width = sliderWidth + 'px';
    })
    //set width to be 'x' times the number of slides
    var slider = document.querySelector('#slider-wrap ul#slider');
    slider.style.width = sliderWidth * totalSlides + 'px';

    // next, prev
    var nextBtn = document.getElementById('next');
    var prevBtn = document.getElementById('previous');
    nextBtn.addEventListener('click', function () {
        plusSlides(1);
    });
    prevBtn.addEventListener('click', function () {
        plusSlides(-1);
    });

    // hover
    slideWrapper.addEventListener('mouseover', function () {
        this.classList.add('active');
        clearInterval(autoSlider);
    });
    slideWrapper.addEventListener('mouseleave', function () {
        this.classList.remove('active');
        autoSlider = setInterval(function () {
            plusSlides(1);
        }, 3000);
    });


    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlides(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        slideIndex = n;
        if (slideIndex == -1) {
            slideIndex = totalSlides - 1;
        } else if (slideIndex === totalSlides) {
            slideIndex = 0;
        }

        slider.style.left = -(sliderWidth * slideIndex) + 'px';
        pagination();
    }

    //pagination
    slides.forEach(function () {
        var li = document.createElement('li');
        document.querySelector('#slider-pagination-wrap ul').appendChild(li);
    })

    function pagination() {
        var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
        dots.forEach(function (element) {
            element.classList.remove('active');
        });
        dots[slideIndex].classList.add('active');
    }

    pagination();
    var autoSlider = setInterval(function () {
        plusSlides(1);
    }, 3000);
</script>
<script>
    // pageUpBtn
    $(function(){
  $('#back-to-top').on('click',function(e){
      e.preventDefault();
      $('html,body').animate({scrollTop:0},600);
  });
  
  $(window).scroll(function() {
    if ($(document).scrollTop() > 100) {
      $('#back-to-top').addClass('show');
    } else {
      $('#back-to-top').removeClass('show');
    }
  });
});
</script>

</body>
</html>