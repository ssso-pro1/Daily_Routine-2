<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>01. 아이디입력</title>
    <style>
        .outer{
            width:800px;
            height:auto;
            margin:auto;
            margin-top:30px;
        }
        .wrap{border:1px solid gray;}

        .menuWrap{
            background:lightgray;
            color:#F5DA01;
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
        .menu a:hover{color:#F5DA01;}

        .wrap>table{
            margin:auto; 
            margin-top:50px;
            margin-bottom:50px;
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


        <div id="title">
            <h3>비밀번호 찾기</h3>
            <hr>
            <p>비밀번호 찾고자 하는 아이디를 입력해주세요.</p>
        </div>
        
        <br>

        <!-- radio 하나만 설정가능하게 -->
        <!-- 1 휴대전화로 인증/ 2. 이메일로 인증
             1 선택시 1보이고 2는 hidden -->
        
        <form action="" id="findPWD"></form>
        <div class="wrap" >
            <table>

                <tr>
                    <th align="left">이름</th>
                    <td><input type="text" placeholder="이름을 입력하세요"></td>
                </tr>
                <tr>
                    <th align="left">아이디</th>
                    <td><input type="text" placeholder="아이디를 입력하세요"></td>
                </tr>
                <tr>
                    <th></th>
                    <td><button>다음</button></td>
                </tr>
                
            </table>
        </div>
        
        
    </div>


</body>
</html>

