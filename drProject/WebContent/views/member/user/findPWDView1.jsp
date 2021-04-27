<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 인코딩확인 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>01. 아이디입력</title>
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

        #content_2 *{
            margin:auto;
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
            <h3>비밀번호 찾기</h3>
            <!-- <hr style="width:300px;"> -->
            <p>비밀번호 찾고자 하는 아이디를 입력해주세요.</p>
        </div>
        
        <br>
        
        <br>

        <div id="content_2" >

        <form action="<%=request.getContextPath() %>/findPwd2.us" method="post" id="findPWD">
       
            <table>
                <tr>
                    <th align="left">이름</th>
                    <td><input type="text" name="userName" id="userName" placeholder="이름을 입력하세요" required></td>
                </tr>
                <tr>
                    <th align="left">아이디</th>
                    <td><input type="text" name="userPwd" id="userPwd" placeholder="아이디를 입력하세요" required></td>
                </tr>
                <tr>
                    <th colspan="2"><input type="submit" value="다음" id="next" onclick="validate();"></th>
                </tr>
                
            </table>
            

        </form>
        
    </div> 
    </div>
    <br><br>
    
    <br>
   

    <br><br><br>


    
    <script>
   
   function validate(){

   
   
    var userName = document.getElementById("userName");
    var userId = document.getElementById("userId");

    regExp = /^[가-힣]{2,}$/; //{2} : 그냥 2글자
    if(!regExp.test(userName.value)){
        alert("유효한 이름을 입력하세요.");

        userName.value = "";
        userName.focus();

        return false;
    }
    
    var regExp = /^[a-z][a-z\d]{5,20}$/;
    if(!regExp.test(userId.value)) { //userId는 요소객체이기 때문에 value붙여야함
        alert("유효한 아이디를 입력하세요");

        userId.value = "";
        userId.focus();   

        return false; //틀리면 넘어가지 않게.
    }
}
    </script>
             
    //<!-- required 속성 부여가 안됨-->
    <script>
            
            //  function findPwd1(){
            //      location.href="<%=request.getContextPath() %>/findPwd2.us";
            //  }
    </script>
        
</body>
</html>