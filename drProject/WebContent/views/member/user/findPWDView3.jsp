<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 인코딩 확인용 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>03. 비밀번호 재설정</title>
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

        .wrap>table{
            margin:auto; 
            margin-top:50px;
            margin-bottom:50px;
        }
        #content_1{
            margin-top:50px;
            
        }
        #content_2{
            display:block;
            align-items: center;
        }

        #content_2>table{
            margin:0 auto;
        }
        /*  include의 css가 적용돼서 이게 안먹힘.. 질문 */
        .menu2:hover{
            color:rgb(250, 214, 9);
        }

        #content_2{
            border:1px solid gray;
            display:flex;
            padding:40px;
            width:70%;
            margin:auto;
        }
      


    </style>
</head>
<body>
    
    <%@ include file="../../common/menubar.jsp" %> 
    
    <!-- navi -->
    <div class="menuWrap" align="center">
        <div class="menu1"> <a href="<%=contextPath%>/findID1.us" style="color:gray"><i class="fas fa-user"> 아이디 찾기</i></a> </div>
        <div class="menu2"> <a href="<%=contextPath%>/findPwd1.us" style="color:rgb(250, 214, 9); "><i class="fas fa-key">비밀번호 찾기</i></a></div>
    </div>
    
    



    <div class="outer">
        <div id="content_1">
            <h3>비밀번호 재설정</h3>
            <!-- <hr> -->
            <p>비밀번호를 변경해주세요. </p>
        </div>
        
        <br>
        
        
        <div class="wrap" >
        <form action="<%=request.getContextPath() %>/loginForm.us" id="findPWD"></form>
            <div style="margin-top:20px; margin-left:20px;">
                <p><small>
                   -영문, 숫자, 특수문자를 함께 사용하면 (8자 이상 16자 이하)보다 안전합니다. <br>
                   -다른 사이트와 다른 DR만의 비밀번호를 만들어 주세요.
                </small>
                </p>
                <br>
                <hr style="width:80%;">
            </div>
            
            <table>
                <tr>
                    <th colspan="2" align="left">DR아이디 : running01</th>
                </tr>
                <tr>
                    <th align="left">이름</th>
                    <td><input type="text" placeholder="이름을 입력하세요" required="required"></td>
                </tr>
                <tr>
                    <th align="left">아이디</th>
                    <td><input type="text" placeholder="아이디를 입력하세요" required="required"></td>
                </tr>
                <tr>
                    <th></th>
                    <td><button type="submit" >다음</button></td>
                </tr>
                <!-- 다음 클릭시 로그인 창 -->
            </table>
        </form>
            <br><br>
        </div>
        <script>
          
            // function findPwd3(){
            //     location.href="<%=request.getContextPath() %>/login.us";
            // }
        </script>
        
    </div>


</body>
</html>

