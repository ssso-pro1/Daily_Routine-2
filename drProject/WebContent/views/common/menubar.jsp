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
    .outer{
        width:1100px;
        height:170px;
        margin: auto;
    }
   
    
    .outerWrap>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
        padding:10px;
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

    .header{
        position:relative;
        top:-20px;
    }

    .sideLine{
        border-left:2px solid gray;
        
    }

    #dr{
        position:relative;
        top:-30px;
    }
    #mainLine{
        position:relative;
        top:-20px;
        border-bottom:1px solid gray;
        color:gray;
    }
   
    
</style>
</head>
<body>
    
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    
    <!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

	<script>
    // 회원가입 성공 시 뜨는 알림창 메시지. 확인 누르면 메뉴바로 (메인페이지)
    var msg = "<%=session.getAttribute("alertMsg")%>";

    if(msg != "null"){
        alert(msg);
        <% session.removeAttribute("alertMsg"); %>
    }
    </script>

    
    <div class="outer ff">

        <div class="outerWrap">
            <p align="center">Reading is to the mind what exercise is to the body</p>
            
            <div class="header">
                <div class="loginArea">
                <!--  로그인 전에 보여지는 로그인 버튼 -->
                
                    <% if(loginUser == null){ %>
            
                    <table id="topMenu1" align="right">
                        <tr>
                            <th><a href="<%=contextPath%>/loginForm.us">로그인</a></th>
                            <th>|</th>
                            <th><a href="<%=contextPath%>/enrollForm1.us">회원가입</a></th>
                            <th>|</th>
                            <th><a href="<%=contextPath%>/main.ct">고객센터</a></th>
                        </tr>
                        <tr>
                            <th colspan="3">Welcome DR님</th>
                            <th colspan="2"><i class="fas fa-user-circle" fa="lg"></i></th>
                        </tr>
                    </table>
                    
                    
                    <% }else { %>
                
                <!--  로그인 후 -->
                    
                    <table id="topMenu2" align="right">
                        <tr>
                            <th><a href="<%=contextPath%>/logout.us">로그아웃</a></th>
                            <th>|</th>
                            <th><a href="<%=contextPath%>/main.ct">고객센터</a></th>
                        </tr>
                        <tr>
                            <th colspan="3"><b><%= loginUser.getUserName() %>님</b> 환영합니다</th>
                            <th><i class="fas fa-user-circle" fa="lg"></i></th>
                        </tr>
                    </table>
                    
                    <% } %>
                    
                </div>

            <br><br>


            <span class="navWrap" align="center">
                
                <div class="menu" id="dr"><a href="<%=contextPath%>">Daily<br>Routine</a></div>
                <div class="menu"><a href="<%=contextPath%>/allList.ht">HomeTraining</a></div>
                <div class="menu"><a href="<%=contextPath%>/commMain.co?currentPage=1">Community</a></div>
                <div class="menu"><a href="<%=contextPath%>/workout.in?currentPage=1">Info&Tip</a></div>
                <div class="menu"><a href="<%=contextPath%>/myPage.md">My D.R.</a></div>
                <div class="menu"><a href="<%=contextPath%>/mainPage.ad">관리자</a></div>
				
                <div class="sideLine" ></div>
                <hr id="mainLine">
            </span>
        
        </div>
    </div>
    </div>
</body>
</html>