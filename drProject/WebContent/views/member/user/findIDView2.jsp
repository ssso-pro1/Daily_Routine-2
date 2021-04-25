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


    <style>
       .menuWrap{
    background: lightgrey;
    /* color:rgb(100, 77, 1);; */
    width:100%;
    /* height:50px; */

    display:flex;
    justify-content:center;
    }

.menuWrap>.menu1{
    text-decoration:none;
    color:white;
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
}

        #content_2{border:1px solid gray;}
      

        #content_2>table{
            margin:auto; 
            margin-top:50px;
            margin-bottom:50px;
        }

        #content_2 {
            display:flex;
        }
            
    </style>
</head>
<body>
    
    <%@ include file="../../common/menubar.jsp" %>
    
    <div class="menuWrap" align="center">
        <div class="menu1"> 아이디 찾기</a> </div>
        <div class="menu2">비밀번호 찾기</a></div>
    </div>
    
    
    <div class="outer">
        <div id="content_1">
            <h3>아이디 찾기</h3>
            <hr>
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
        <div id="btns" align="center"> <!--선택한 회원의 아이디정보 보내야함-->
            <!-- <div><a href="<%=request.getContextPath()%>/loginForm.us" >로그인하기</a> </div>
            <div><a href="<%=request.getContextPath()%>/loginForm.us" >비밀번호 찾기</a> </div> -->

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

