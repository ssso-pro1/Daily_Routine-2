<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 인코딩 확인 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.회원가입_1.회원약관동의</title>
        
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .outer{
            padding:35px;
            width:600px;
            height:auto;
            margin:auto;
            margin-top:30px;
            border:1px solid gray;
        }
        /* .wrap{border:1px solid gray;} */

        .menuWrap{
            /* background:lightgray; */
            /* color:white; */
            width:1200px;
            height:50px;

            display:flex;
            justify-content:center;
        }
        
        .step_1, .step_2, .step_3{
            text-decoration:none;
            /* color:white; */
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            height:100%;
            margin:0px 50px;
        }

        .step_1, .arrow1 {color:yellow;}
        .step_2, .step_3{color:gray;}

        i{margin-top:20px; color:gray;}

        .btn{
            display:flex;
            justify-content:center;
            margin:10px;
        }
    </style>
</head>
<body>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    
    <%@ include file="../../common/menubar.jsp" %>
    
    <hr style="border:1px solid lightgray">

    <!-- 화살표 둘 중에 하나 고르기 . 뭐가 더 예쁜가..ㅎ-->
    <div class="menuWrap" align="center">
        <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-right fa-lg"></i>
        <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_3">회원가입완료</span>
    </div>

    <!-- 상세보기 팝업 -->
    <div class="outer">
        <input type="radio" id="first">
        <label for="first">DailyRoutine 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.</label>
        
        <hr style="border:1px solid gray" width="100%">

        <input type="radio" id="second">
        <label for="second">DailyRoutine 이용약관</label>
        <input type="button" value="상세보기"> <br>

        <input type="radio" id="third">
        <label for="third">개인정보 수집 및 이용 동의(필수)</label>
        <input type="button" value="상세보기"> <br>

        <input type="radio" id="fourth">
        <label for="fourth">프로모션 정보 수신 동의(선택)</label> 
        <input type="button" value="상세보기"> <br>

    </div>

    <div class="btn">
        <button type="button" class="btn btn-secondary ">취소</button>
        <button type="button" class="btn btn-warning">확인</button>
    </div>
 


</body>
</html>