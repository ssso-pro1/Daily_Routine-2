<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 인코딩 확인 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findID_1</title>
    <style>
        .outer{
            width:800px;
            height:auto;
            margin:auto;
            margin-top:30px;
        }
        #content_2{border:1px solid gray;}

        .menuWrap{
            background:lightgray;
            color:yellow;
            width:1200px;
            height:50px;

            display:flex;
            justify-content:center;
            }

        .menu a{
            text-decoration:none;
            color:white;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            display:block;
            width:100%;
            height:100%;
            margin:0px 50px;
        }
        .menu a:hover{color:yellow;}

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
    
    <!-- <%@ include file="../common/menubar.jsp" %> -->
    
    <div class="menuWrap" align="center">
        <div class="menu"><a href=""> 아이디 찾기</a> </div>
        <div class="menu"><a href="">비밀번호 찾기</a></div>
    </div>
    
    <div class="outer">
        <div id="content_1">
            <h3>아이디 찾기</h3>
            <hr>
            <p>고객님의 정보와 일치하는 아이디 목록입니다.</p>
        </div>
        
        <br>

        <!-- radio 하나만 설정가능하게 -->
        <!-- 1 휴대전화로 인증/ 2. 이메일로 인증
             1 선택시 1보이고 2는 hidden -->
        
        <div id="content_2" >
        <form action="" id="idList"></form>
        

            <table id="idList_1">
                <tr>
                    <th colspan="3"><input type="radio">user_01 <br>
                    
                </tr>
                <tr>
                    <th colspan="3"><input type="radio">user_02 <br>
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
        <div align="center">
            <button type="submit">로그인하기</button>
            <button type="">비밀번호 찾기</button>
        </div>
        
    </div>


</body>
</html>

