<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        /* .outer{
            width:400px;
            height:600px;
            margin:auto;
            border:1px solid gray;
            
        } */
        /*
        .outer>table, .outer>div{margin:auto;}

        button{
            width:85%;
        }

        
        }
       */
       form{
            display:flex;
            flex-direction:column;
            align-items:center;
       }

       


        fieldset *{
            
            display:flex;
            flex-direction: column;
            /* margin:0px 30px; */
            padding:10px;
        }

        #content_2{
            display:flex;
            align-items: center;
        }

        #content_3{
            display:flex;
            align-items:center;
            flex-direction:row;
            justify-content: space-between;
            margin-bottom:20px;
        }

        #naver{
            background-color:#04CF5C;
        }
        #kakao{
            background-color:#FCDC0B;
        }

        button{
            width:50%
        }

        a{
            font:black;
        }

        #rd{display:table-cell;
        display:flex;
        flex-direction: row;
        align-items: }

        #content1_2{
         
            align-items: center;
        /* display:table-cell; */
        }

        #content_3{

        }
    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

    <h4 align="center">로그인</h4>
    <br>

    <fieldset style="border:1px solid gray">
        <div id="content_1">
            <form action="<%= request.getContextPath() %>/login.me" method="post" id="loginForm">
                <input id="id" style="width:70%" type="text" name="userId" maxlength="20" minlength="5" placeholder="ID를 입력하세요" required><br>
                <input id="pwd" style="width:70%" type="password" name="password" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요" required> <br>
                <button onclick="login();" id="btn" style="width:70%" type="button" class="btn btn-secondary"> 로그인</button>            

                <script>
                    function login(){
                        location.href = "<%=request.getContextPath()%>/login.us";
                    }
                </script>

                <div id="content_1_2">
                   <input id="status" type="radio" value="status" > <label for="status">로그인상태유지</label>
                </div>
            </form>
        </div>

        

        <hr style="color:gray; width:90%">
            
        <div id="content_2" >
            <h3 style="font-size:15px; font-weight:bold;">간편로그인</h3><br>
            <button style="width:70%" type="button" class="btn btn-success">네이버로 로그인</button>            
            <br>
            <button style="width:70%" type="button" class="btn btn-warning">카카오로 로그인</button>
            <br>
        </div>

        <div id= "content_3" style="font-size:10px; " align="center">
            <div><a href="" >아이디 찾기</a> </div> |
            <div><a href="">비밀번호 찾기</a> </div> |
            <div><a href="<%=request.getContextPath()%>/enrollForm1.us">회원가입</a></div>
        </div>

    

        </form>
    </div>

    </fieldset>
    

</body>
</html>