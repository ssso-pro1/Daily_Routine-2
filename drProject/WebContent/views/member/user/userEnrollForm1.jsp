<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            width:48%;
            height:auto;
            margin:auto;
            margin-top:30px;
            border:1px solid gray;
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
            /* color:white; */
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            height:100%;
            margin:0px 50px;
        }

        .step_1, .arrow1 {color:rgb(250, 214, 9);}
        .step_2, .step_3{color:rgb(116, 116, 116);}

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
    
    
    
    <!-- <hr style="border:1px solid lightgray"> -->

    <div class="menuWrap" align="center">
        <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_3">회원가입완료</span>
    </div>

    <!-- 상세보기 팝업넣기 -->
 

    <!-- 1. 전체 선택
         2. 전체 해제
         3. 전체 선택 후 하나만 해제했을 때, 전체선택도 해제
         4. 개별 선택으로 전체 다 선택 시, 전체 선택에도 체크-->
    <div class="outer">
        <input type="checkbox" id="check_all" >
        <label for="check_all">DailyRoutine 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.(전체 동의)</label>
        
        <hr style="border:1px solid gray" width="100%">

        <input type="checkbox" id="check_1" class="normal" required="required">
        <label for="check_1">DailyRoutine 이용약관</label> <br>
        
        <input type="checkbox" id="check_2" class="normal" required="required">
        <label for="check_2">개인정보 수집 및 이용 동의</label> <br>
        
        <input type="checkbox" id="check_3" class="normal" >
        <label for="check_3">프로모션 정보 수신 동의</label>
        
    </div>

    </div>
    
    <div class="btn">
        <!-- 취소 : 메인페이지로 이동/ 확인 : 회원가입2단계 (/enrollForm2.us) -->
        <button type="button" class="btn btn-secondary " onclick="mainPage();">취소</button>
        <button type="submit" class="btn btn-warning" onclick="enrollForm2();">확인</button>
    </div>
    


    <script language="javascript">
        //체크박스 전체 선택
        $(".outer").on("click", "#check_all", function () {
            $(this).parents(".outer").find('input').prop("checked", $(this).is(":checked"));
        });

        // 체크박스 개별 선택
        $(".outer").on("click", ".normal", function() {
            var is_checked = true;

            $(".outer .normal").each(function(){
                is_checked = is_checked && $(this).is(":checked");
            });

            $("#check_all").prop("checked", is_checked);
        });
    
        


        // 취소 : 메인페이지로 이동
        function mainPage(){
            location.href="<%=request.getContextPath()%>";
        }

        // 확인 : 회원가입2단계 servlet 으로 이동 (사용자 정보입력폼)
        function enrollForm2(){

            //var check = document.getElementById("checkbox").required; //==> 전체동의 체크하고 확인누르면 넘어가는데, 체크안하고 확인 다시 체크해도 화면 안 넘어감

            location.href = "<%=request.getContextPath()%>/enrollForm2.us";
        }


    </script>


    <!-- 문제 : required 부여 안됨
                체크 안하고 확인 클릭시, 다시 클릭해도 페이지 안 넘어감 -->
    
    
 


</body>
</html>