<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/drView.css">
<style>
    .outer{
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
        background-color: #EAEAEA;
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
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
            {
                cell.innerHTML = "<font color=#BCF1B1>" + i // 오늘 날짜에 색
            }
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
                    <div><a href="<%=contextPath%>/myPage.md" >회원수정</a></div>
                    <br>
                    <div><a href="">내 글 보관함</a></div>
                    <br>
                    <div><a href="" >북마크 보관함</a></div>
                    <br>
                    <div><a href="" style="color:rgb(250, 214, 9);">다이어리</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
                    <div class="outer">
                        <div class="outer2">
                        <br>
                        <div class="date">
                            <font size=2%; color="#B3B6B3"><label onclick="beforem()" id="before"></label></font>&nbsp;
                            <p id="yearmonth" style="display: inline-block; font-size: 15px;"></p>&nbsp;
                            <font size=2%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font>
                        </div>
                        <table align="center" id="calendar">
                
                            <tr id="days">
                                <td align="center"> <font color="#FF9090">일</font></td>
                                <td align="center"> 월 </td>
                                <td align="center"> 화 </td>
                                <td align="center"> 수 </td>
                                <td align="center"> 목 </td>
                                <td align="center"> 금 </td>
                                <td align="center"><font color=#7ED5E4>토</font></td>
                            </tr>
                        </table> 
                        <div class="text">
                            <form action="">
                                <textarea name="schedule" cols="97" rows="10" style="resize: none;"></textarea>
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
    </div>
    
   
</body>
 
</html>
