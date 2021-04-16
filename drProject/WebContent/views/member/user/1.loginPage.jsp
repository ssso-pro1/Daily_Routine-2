<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    Latest compiled and minified CSS
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .outer{
            width:400px;
            height:600px;
            margin:auto;
            border:1px solid gray;
            
        }
        /*
        .outer>table, .outer>div{margin:auto;}

        button{
            width:85%;
        }

        
        }
       */
       /* form{
            display:flex;
            flex-direction:column;
            align-items:center;
       } */

       #id
        #login-form{
            display:flex;
            flex-direction: column;
            margin:0px 30px;
        }

/* 아래 다 안됨... */
        /* 간편로그인 가운데로  */
        #simple *{margin:auto;}
        form>div{margin:auto;}

        #loginForm table{margin:auto;}
        #loginForm input{margin:5px;}


    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

    <h2 align="center">로그인</h2>
    <br>

    <div class="outer">
<!-- /login.me -->

        <form action="<%= request.getContextPath() %>/login.me" method="post" id="login-form">
            <input type="text" name="userId" maxlength="20" minlength="5" placeholder="ID를 입력하세요" required><br>
            <input type="password" name="password" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요" required>
            <input type="submit" value="로그인"  class="btn btn-secondary btn-block" style="width:85%">
            <input type="radio"><span>로그인 상태 유지</span>
        </form>

        <hr style="border:solid 0.4px gray; width:90%">

        
            <!-- <table> -->
        <div id="simple" >
            <h4 align="center">간편 로그인</h4>
            <button>네이버로 로그인</button>
            <br><br>
            <button>카카오로 로그인</button>
            <br><br>
            <a href="">아이디 찾기</a>
            <a href="">비밀번호 찾기</a>
            <a href="~enrollForm.jsp">회원가입</a>
        </div>

        </form>
    </div>


    

</body>
</html>