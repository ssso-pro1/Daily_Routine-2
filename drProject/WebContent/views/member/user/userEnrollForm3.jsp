<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        fieldset{
            width:80%;
            margin:auto;
            margin-top:50px;
            padding:10px 20px;

        }
        fieldset p{
            text-align:center;
        }

        .menuWrap{
            width:100%;
            height:50px;
            margin-bottom:60px;

            display:flex;
            justify-content:center;
        }
        
        .menuWrap>span{
            text-decoration:none;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            height:100%;
            margin:0px 50px;
        }

        .menuWrap *{
            color:rgb(116, 116, 116);
        }

        .step_3 {color:rgb(250, 214, 9);}

        i{margin-top:20px; color:rgb(116, 116, 116);}
    


        .btn{
            display:flex;
            justify-content:center;
            margin:10px;
        }
        
    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>  
    
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    <!--     
        <hr style="border:1px solid lightgray"> -->
        
        <div class="menuWrap" align="center">
            <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-circle-right fa-lg"></i>
            <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-circle-right fa-lg"></i>
            <span class="step_3">회원가입완료</span>
        </div>


    <fieldset>
        <div>
            <p style="font-weight:bold; font-size:17px;">회원가입이 완료되었습니다.</p>
            <p>Daily Routine과의 즐거운 운동시간 되시길 바랍니다.</p>
        </div>
    </fieldset>

    <button id="btn"  class="btn btn-warning" align="center" type="submit"  onclick="main();">홈 바로가기</button>

    <script>
        function main(){
            location.href= "<%=request.getContextPath() %>/";
        }
    </script>
</body>
</html>