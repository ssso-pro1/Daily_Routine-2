<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/drView.css">
<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	.wrap{
			font-family: 'Do Hyeon', sans-serif;
	}
    .outer1{
        width:1000px;
        height: 800px;
        margin: auto;
    }
    .outer2{
    	width:704px;
    	height:500px;
    	margin:auto;
        margin-left: 50px;
    }
    table
    {
        border:1px solid #BDBDBD;
        text-align:center;
        width: 100%;
        height: 100%;

    }
    #days{
        background-color: gold;     
    }
    .schedule{
        width: 100px;
        height: 80px;
        font-size: 12px;
    	margin:0px;
    	cursor:pointer;
    }
    
	table td:hover{background-color: #EAEAEA;}
    .day{
    	width: 100px;
        height: 20px;
        margin:0px;
        cursor: pointer;
    }
    .buttons{
        margin-right: -40px;
    }
        .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:-60px;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        font-family: 'Do Hyeon', sans-serif;
    }


    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);

    }
    .footer1_2{
    	margin-right:250px;
    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
    }
    
    
</style>
 
<script language="javascript">


    var today = new Date(); // 오늘 날짜
    var date = new Date();
    
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }
    
    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        var schedule = "<div class='schedule' align='left'></div>"; // 스케쥴 div담기!
        var value = "";
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
       
        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 1) 
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();   
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
        	var day = 0;
            cell = row.insertCell();
            cell.innerHTML = "<div class='day' align='left'>" + i + "</div>" + schedule;
            value = "오늘의 식단<br>오늘의 운동";
            $(".schedule").html(value);
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
            	day = i;
            	console.log(day);
                cell.innerHTML = "<div class='day' align='left' style='color:#FF9090'>" + i + "</div>" + schedule
                value = "오늘의 식단<br>오늘의 운동";
                $(".schedule").html(value);
                	 
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산 //토요일에 색 
            	day = i;
                cell.innerHTML = "<div class='day' align='left' style='color:#7ED5E4'>" + i + "</div>" + schedule
                value = "오늘의 식단<br>오늘의 운동";
                $(".schedule").html(value);
                row = calendar.insertRow();// 줄 추가
                
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) {
            	day = i;
            	cell.innerHTML = "<div class='day' align='left' style='color:#BCF1B1'>" + i + "</div>" + schedule
                value = "오늘의 식단<br>오늘의 운동";
                $(".schedule").html(value);

            }
        }
        if(i=2){
        	var selectDate = new Date(today.getFullYear(),today.getMonth(),i); // 선택한 날짜
            console.log(selectDate); // 년도, 월, 일, 요일 등 잘 출력됨! => i만 해당 아이 오도록하자	
        }
        
        $(".schedule").click(function(){
        	var i = $(".day").text();
        	console.log(i); // 왜 모든 i가 나와,,
        	console.log(day);
        	var selectDate = new Date(today.getFullYear(),today.getMonth(),i); // 선택한 날짜
            console.log(selectDate); // 년도, 월, 일, 요일 등 잘 출력됨! => i만 해당 아이 오도록하자	
        })
        
        function content(i){
        	console.log(i);
        }
        
    }
    
</script>
 
</head>
 <!-- 
     <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
  -->
<body onload="build();">

    <%@ include file="../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md">회원수정</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/myPostList.md?currentPage=1">내 글 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/htBookmark.md?currentPage=1" >북마크 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/diary.md" style="color:rgb(250, 214, 9);">다이어리</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
                    <div class="outer1">
                        <div class="outer2">
                        <br>
                        <div class="date">
                            <font size=2%; color="#B3B6B3"><label onclick="beforem()" id="before"></label></font>&nbsp;
                            <p id="yearmonth" style="display: inline-block; font-size: 15px;"></p>&nbsp;
                            <font size=2%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font>
                        </div>
                        <table align="center" id="calendar" border='1px solid black'>
                
                            <tr id="days">
                                <th align="center"> <font color="#FF9090">일</font></td>
                                <th align="center"> 월 </th>
                                <th align="center"> 화 </th>
                                <th align="center"> 수 </th>
                                <th align="center"> 목 </th>
                                <th align="center"> 금 </th>
                                <th align="center"><font color=#7ED5E4>토</font></th>
                            </tr>
                        </table> 
                        <div class="text">
                            <form action="">
                                <textarea name="schedule" cols="103" rows="10" style="resize: none;">
오늘의 식단:
오늘의 운동:    
                            </textarea>
                                <div class="buttons" align="right">
                                    <button type="submit" id="submitBtn">저장</button>
                                    <button type="reset" id="resetBtn">삭제</button>
                                </div>
                            </form>
                
                        </div>   
                    </div>
               	 </div>
                </div>
            </div>
         </div>
         <!-- footer -->
	    <div class="footerOuter">
	    
	
	            <div class="footer1">
	                <div class="footer1_1">
	                    <a href="">이용약관</a> | 
	                    <a href="">개인정보보호정책</a>
	                </div>
	
	                <div class="footer1_2" align="right">
	                    <i class="fab fa-instagram-square" fa="lg" ></i>
	                    <i class="fab fa-youtube"></i>
	                    <i class="fab fa-facebook"></i> 
	                    <i class="fas fa-arrow-up" fa="lg"></i>
	                </div>
	            </div>
	          
	            
	            <div class="footer2">
	                <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
	                    Daily Routine : DR <br>
	                    주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
	                    고객센터 및 제휴문의 : daily@routine.co.kr           
	                    <br>
	                    CopyRight 2000-2021 Daily Routine All Right Reserved
	                </p>
	            </div>
	    </div>
    </div>
    
   
</body>
 
</html>
