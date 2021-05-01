<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findID_1</title>
     <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

     <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

<!-- 제일 위의 부트스트랩 넣으면 크기나 여백이 다 바뀜. 근데 버튼하려면 저거 써야함.. 질문 -->

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        .f{
            font-family: 'Do Hyeon', sans-serif;
        }
        .menuWrap{
            width:1000px;
            margin:auto;

            display:flex;
            justify-content:center;
            }

        .menuWrap>.menu1{
            text-decoration:none;
            color:rgb(250, 214, 9);
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            /* display:block; */
            width:15%;
            height:100%;
            margin:0px 50px;
        }

        .menuWrap>.menu2{
            text-decoration:none;
            color:gray;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            /* display:block; */
            width:15%;
            height:100%;
            margin:0px 50px;
        }
        

        .outer{
            width:800px;
            height:auto;
            margin:auto;
            margin-top:30px;
            text-align:center;
        }

        #content_1{
            margin-top:50px;
            
        }
      
        #content_2{
            border:1px solid gray;
            display:flex;
            padding:40px;
            width:70%;
            margin:auto;
        }
      

        #content_2>table{
            margin-top:50px;
            margin-bottom:50px;
            margin:0 auto;
        }

            
        .menu2:hover{
            color:rgb(250, 214, 9);
        }

        
          /* footer */
          .footerOuter{
            width:1100px;
            margin:auto;
            /* margin-left:130px; */
            align-items: left;
            bottom:100;
            position:absolute;
            align

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
        } 
        
    </style>
</head>
<body>
    <div class="f">
    <%@ include file="../../common/menubar.jsp" %>
    
    
    <!-- navi -->
    <div class="menuWrap" align="center" style="margin-top:30px;">
        <div class="menu1"> <a href="<%=contextPath%>/findID1.us" style="color:rgb(250, 214, 9);"><i class="fas fa-user"> 아이디 찾기</i></a> </div>
        <div class="menu2"> <a href="<%=contextPath%>/findPwd1.us" style="color:gray; "><i class="fas fa-key">비밀번호 찾기</i></a></div>
    </div>
    
    
    
    <div class="outer">
        <div id="content_1">
            <h3>아이디 찾기</h3>
            <!-- <hr style="width:300px;"> -->
            <p>고객님의 정보와 일치하는 아이디 목록입니다.</p>
        </div>
        
        <br>

        
        <div id="content_2" >
        <form action="" id="idList"></form>
        

            <table id="idList_1">
                <tr>
                    <th colspan="3">user_01 <br>
                    
                </tr>
                <tr>
                    <th colspan="3">user_02 <br>
                </tr>
            </table>
            
            <table id="idList_2">
                <tr>
                    <td>가입 : 2021.03.25 </td>
                </tr>
                <tr>
                    <td>가입 : 2015.08.29 </td>
                </tr>
            </table>
        </div>
        <br>
        <div id="btns" align="center"> 
            <button type="submit" onclick="login();" class="btn btn-warning">로그인하기</button>
            <button type="" onclick="findPwd();" class="btn btn-secondary">비밀번호 찾기</button>
        </div>
        
        <br><br><br><br><br><br>



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
            function login(){
                location.href="<%=request.getContextPath() %>/loginForm.us";
            }
            function findPwd(){
                location.href="<%=request.getContextPath() %>/findPwd1.us";
            }
        </script>
    </div>
</div>
</body>
</html>

