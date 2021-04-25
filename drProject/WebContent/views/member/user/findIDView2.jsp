<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findID_1</title>

    <link rel="stylesheet" type="text/css" href="../../../resources/css/findIdPwdNavi.css">


    <!-- Latest compiled and minified CSS -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="../../../resources/css/findIdPwdNavi.css">

<!-- 제일 위의 부트스트랩 넣으면 크기나 여백이 다 바뀜. 근데 버튼하려면 저거 써야함.. 질문 -->

    <style>
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
            /* margin:auto;  */
            margin-top:50px;
            margin-bottom:50px;
            margin:0 auto;
        }

            
        /*  include의 css가 적용돼서 이게 안먹힘.. 질문 */
        .menu2:hover{
            color:rgb(250, 214, 9);
        }
    </style>
</head>
<body>
    
    <%@ include file="../../common/menubar.jsp" %>
    
    
    <!-- navi -->
    <div class="menuWrap" align="center">
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
            <button type="submit" onclick="login();">로그인하기</button>
            <button type="" onclick="findPwd();">비밀번호 찾기</button>
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

</body>
</html>

