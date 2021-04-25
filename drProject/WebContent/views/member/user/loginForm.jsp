<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /* 페이지 길이  & 로그인창 들어오면 메뉴바 높이가 길어짐.. */
      /* .outer{
          height:1600px;
      } */
       fieldset{
           width:68%;
           margin:auto;
           position:relative;
            margin-top:60px;
            margin-bottom:80px;
       }
    
        .header{
           position:relative;

           margin-top:30px;
           margin-bottom:-40px;
       }
        .header>h4{
            position:relative;
            margin-top:20px;
        }
       
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

        #content_1{
            padding-top:60px;
        }

        #content_2{
            display:flex;
            align-items: center;
        }

        #content_3{
            /* display:flex; */
            align-items:center;
            flex-direction:row;
            justify-content: space-between;
            margin-bottom:30px;
            padding: 10px 150px;
            font-weight:bold;
            font-size:10px;
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

        
        #rd{display:table-cell;
        display:flex;
        flex-direction: row;
        align-items: }

       

        
      
        
    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

<br><br>
    <div class="outer">
        
        <br>
        <br>

        <div  class="header">
            <h4 align="center">로그인</h4>
        </div>

        <div>
            <fieldset style="border:1px solid gray">
                
                <div id="content_1">
                    <form action="<%= request.getContextPath() %>/login.us" method="post" id="loginForm">
                        <input id="userId" style="width:70%" type="text" name="userId" maxlength="20" minlength="5" placeholder="ID를 입력하세요" required><br>
                        <input id="userPwd" style="width:70%" type="password" name="userPwd" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요" required> <br>
                        <button id="btn" style="width:70%" type="submit" class="btn btn-secondary" >로그인</button>            


                        <div id="content_1_2">
                            <input name="status" id="status" type="radio" value="status" > <label for="status">로그인상태유지</label>
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

                <div id= "content_3" style="font-size:10px; " align="center" >
                    <div><a href="<%=request.getContextPath()%>/findID1.us" style="color:black;">아이디 찾기</a> </div> |
                    <div><a href="<%=request.getContextPath()%>/findPwd1.us" style="color:black;">비밀번호 찾기</a> </div> |
                    <div><a href="<%=request.getContextPath()%>/enrollForm1.us" style="color:black;">회원가입</a></div>
                </div>

            
                </div>

            </fieldset>
    </div>
</div>

</body>
</html>