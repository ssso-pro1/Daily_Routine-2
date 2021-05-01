<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        fieldset{
            width:80%;
            margin:auto;
            margin-top:50px;
            padding:10px 20px;

        }
        fieldset p{
            text-align:center;
        }

        .menuWrap{
            width:100%;
            height:50px;
            margin-bottom:60px;

            display:flex;
            justify-content:center;
        }
        
        .menuWrap>span{
            text-decoration:none;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            height:100%;
            margin:0px 50px;
        }

        .menuWrap *{
            color:rgb(116, 116, 116);
        }

        .step_3 {color:rgb(250, 214, 9);}

        i{margin-top:20px; color:rgb(116, 116, 116);}
    


        .btn{
            display:flex;
            justify-content:center;
            margin:10px;
        }
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        .f{
            font-family: 'Do Hyeon', sans-serif;
        }



          /* footer */
        .footerOuter{
            width:1100px;
            margin:auto;
            margin-left:50px;
            align-items: left;
            bottom:100;
            position:absolute;
        }
        .footerOuter>.footer1_1, .footer2{
            width:1100px;
            
        }

        .footer1_1{
            height:30px;
            right:500px;
            width:1100px;
            background-color:rgb(250, 214, 9);
            padding-top:10px;
        }
        .footer1_2>i{
        left:250px;
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
            margin-top:-5px;
        } 

        #hbtn{margin:auto;}
    </style>
</head>
<body>
    <div class="f">
    <%@ include file="../../common/menubar.jsp" %>  
    
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    <!--     
        <hr style="border:1px solid lightgray"> -->
        
        <div class="menuWrap" align="center" style="margin-top:30px;">
            <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-circle-right fa-lg"></i>
            <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-circle-right fa-lg"></i>
            <span class="step_3">회원가입완료</span>
        </div>


    <fieldset>
        <div>
            <p style="font-weight:bold; font-size:17px;">회원가입이 완료되었습니다.</p>
            <p>Daily Routine과의 즐거운 운동시간 되시길 바랍니다.</p>
        </div>
    </fieldset>

    <button id="hbtn" class="btn btn-warning" align="center" type="submit"  onclick="main();">홈 바로가기</button>

    <br><br><br><br>

    <!-- footer -->
    <div class="footerOuter ff">


    <div class="footer1">
        <div class="footer1_1">
            <a href="">이용약관</a> | 
            <a href="">개인정보보호정책</a>
        </div>

        <div class="footer1_2" align="right">
            <i class="fab fa-instagram-square" fa="lg" ></i>
            <i class="fab fa-youtube"></i>
            <i class="fab fa-facebook"></i> 
            <i class="fas fa-arrow-up" fa="lg"></i>
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

    <script>
        function main(){
            location.href= "<%=request.getContextPath() %>/";
        }
    </script>
</body>
</div>
</html>