<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    .outerWrap>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
    }

    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;
        display:block;
        
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 150px;
    }
    .menu a{
        text-decoration:none;
        color:black;
        font-size:20px;
        line-height:50px;
        font-weight:bold;
        display:block;
        width:100%;
        height:100%;
    }
    .outerWrap a:hover{
        color:darkorchid
	}
</style>
</head>
<body>
	<script>
    // 회원가입 성공 시 뜨는 알림창 메시지. 확인 누르면 메뉴바로 (메인페이지)
    var msg = "<%=session.getAttribute("alertMsg")%>";

    if(msg != "null"){
        alert(msg);
        <% session.removeAttribute("alertMsg"); %>
    }
    </script>
    
    <div class="outerWrap">
        <p align="center">Reading is to the mind what exercise is to the body

            
        </p>
        
        <table id="topMenu" align="right">
            <tr>
                <th><a href="<%=contextPath%>/loginForm.us">로그인</a></th>
                <th>|</th>
                <th><a href="<%=contextPath%>/enrollForm1.us">회원가입</a></th>
                <th>|</th>
                <th><a href="<%=contextPath%>/main.ct">고객센터</a></th>
            </tr>
            
        </table>
    </div>

    <br><br>
    <div class="navWrap" align="center">
        <div class="menu"><a href="<%=contextPath%>">메인페이지</a></div>
        <div class="menu"><a href="">HomeTraining</a></div>
        <div class="menu"><a href="<%=contextPath%>/commMain.co?currentPage=1">Community</a></div>
        <div class="menu"><a href="<%=contextPath%>/intMain.in">Info&Tip</a></div>
        <div class="menu"><a href="<%=contextPath%>/myPage.md">My D.R.</a></div>
    <hr>
    </div>


</body>
</html>