<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= "java.util.ArrayList, com.dr.member.user.model.vo.User, com.dr.common.model.vo.PageInfo" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
<style>

</style>
</head>
<body>
	<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleeapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        div{
            box-sizing:border-box;
        }
        .wrap{
            width:1000px;
            /* height:800px; */
            margin:auto;
            margin-top:15px;
            background-color: rgb(33, 33, 34);
        }
        .wrap>div{
            width:100%;
        }
        
        #content{height:100%; width:100%;}
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{width:15%;}
        #content_2{width:80%; margin-left:30px;}
        #line{width:1%;}
        #line{
            border:1px solid gray;
            width:0.1px;
            height:150px;
        }
        #welcome{
            text-decoration: none;
            color:white;
        }
        #welcome:hover{
            color: rgb(33, 33, 34);
        }
        /* #content_2_1{height:10%;}
        #content_2_2{height:35%;}
        #content_2_3{height:35%;} */
        #nav{
            width:100%;
            height:40px;
            background-color: gray;
            padding:5px;
            
            display:flex;
            justify-content:space-between;
            color:white;
            font-weight:bold;
            font-size:20px;
        }
        #content_1 *{
            color:gray;
            margin: 10px 3px;
        }
        #content_1>div{
            font-size:13px;
            margin-top:20px;
            margin-left:10px;
        }
        #content_1 a{
            font-size:12px;
            text-decoration:none;
            font-weight:bold;
            margin-left:10px;
        }
        #content a:hover{color:white;}
        #content_2_1{
            color:white;
            font-size:10px;
            padding:10px;
        }

		.listArea>table>tr>th{
			color:white;
		}
        .loginNavi *, #nav *{
            color:white;
            text-decoration: none;
        }
        #ac:hover, #log:hover, .hov:hover{
            color:black;
        }

        .listOuter{
            margin-left:20px;
            height:600px;
            margin-left:20px;
            padding-left:20px;
        }
       
        .listArea{
            /* border:1px solid gray; */
            text-align:center;
            margin-left:70px;
        }
        .listArea>thead, tbody{
            color:white;
            margin-left:20px;
        }
        .listArea>tbody>tr:hover{
            background:gray;
            color:rgb(250, 214, 9);
            cursor:pointer;
        }
        .listArea>thead>tr{
            background:rgb(250, 214, 9);
        }
	</style>
    <body>
    <div class="wrap">

        <div id="nav">
            <span align="left"><a href="<%=contextPath%>/mainPage.ad" id="ac">Admin Center</a></span>

             <span class="loginNavi">
                <!-- 로그인 전 -->
                   
                    
                   <!-- 로그인  후 -->
                    <% if(loginUser != null && loginUser.getAdminCheck().equals("Y")){ %>
                        <b><%=loginUser.getUserName() %>님</b> 환영합니다. 
                       <small><a href="<%=contextPath%>/adLogout.aus" id="log">로그아웃</a></small>
                       <a href="<%=contextPath%>" ><i class="fas fa-home" class="hov"></i></a>  <!--사용자 메인페이지-->
               
                  <%} else {%>
                    <div>
                    <!-- 로그인 전 -->
                        <a id="welcome" >Welcome</a>
                        <small><a href="<%=contextPath%>/loginForm.aus" id="log">로그인</a></small>
                        <a href="<%=contextPath%>" ><i class="fas fa-home" class="hov"></i></a>  <!--사용자 메인페이지--></div>
                  <% } %>

                   <!-- 사용자 메인페이지로 돌아감 -->
                    
            </span>
        </div>


        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2  style="color:white;">회원관리</h2>
                    <div><a href="<%=contextPath%>/userListView.aus?currentPage=1"  style="color:white;">전체 회원 조회 </a></div>
                    <div><a href="">회원 탈퇴처리</a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>게시물관리</h2>
                    <div><a href="<%=contextPath%>/htList.aht?currentPage=1">HomeTraining</a></div> 
                    <div><a href="<%=contextPath%>/info.ad?currentPage=1">Info&Tip</a></div> 
                    <br>
                </div>

                <div class="content_1_3">
                    <h2>고객센터</h2>
                    <div><a href="<%=contextPath%>/ctNotice.ad?currentPage=1">공지사항</a></div> 
                    <div><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=top">FAQ</a></div> 
                    <div><a href="<%=contextPath%>/ctQuery.ad?currentPage=1">1:1문의</a></div> 
                    <br>
                </div>

            </div>

            <div id="line"></div>



            <!-- content -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>회원관리 > 전체 회원 조회</h2>
                </div>

                <hr style="border:1px solid gray">
                <div>
                    <p style="color:white;">전체 회원 조회 리스트입니다.</p>
                </div>
            </div>
            </div>
        
            <br><br>
            <div class="listOuter">
                <table class="listArea" style="padding:30px 40px;">
                        <thead>
                            <tr>
                                <th width="30">번호</th>
                                <th width="90">아이디</th>
                                <th width="90">이름</th>
                                <th width="200">휴대폰 번호</th>
                                <th width="70">성별</th>
                                <th width="120">가입일</th>
                                <th width="70">탈퇴여부</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        
                        <!-- 조회된 결과 없을 경우 -->
                        
                            <% if(list.isEmpty()){ %>
                                <tr>
                                    <td colspan = "6"> 조회된 리스트가 없습니다. </td>
                                </tr>
                            
                            <% }else{ %>
                            
                                
                                <% for(User u : list) { %>
                                <tr>
                                    <td><%=u.getUserNo() %></td>
                                    <td><%=u.getUserId() %></td>
                                    <td><%=u.getUserName() %></td>
                                    <td><%=u.getPhone() %></td>
                                    <td><%=u.getGender() %></td>
                                    <td><%=u.getEnrollDate() %></td>
                                    <td><%=u.getLeaveCheck() %></td>
                                </tr>
                                
                                <% } %>
                            <% } %> 
                    </tbody>
                </table>

                
            </div>
        <br>

    <br>
    
    <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
    <!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
    <!-- 페이징 처리 -->	
                	 	<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
               		 	<div align="center" class="pagingArea">
               		 
                   	 		<% if(currentPage != 1) { %>
		                    	<button onclick="location.href='<%= contextPath %>/userListView.aus?currentPage=<%=currentPage-1%>';"><</button>
		                	<% } %>
		                    
		                	<% for(int p=startPage; p<=endPage; p++) { %>
		                    	
		                    	<% if(currentPage == p) { %>
		                    		<button disabled style="background:rgb(250, 214, 9); color:white; border:rgb(250, 214, 9)";><%= p %></button>
		                    	<% }else { %>
		                    		<button onclick="location.href='<%= contextPath %>/userListView.aus?currentPage=<%= p %>';"><%= p %></button>
		                   		<% } %>
		                    	
		                	<% } %>
		                    
		                	<% if(currentPage != maxPage) { %>
		                    	<button onclick="location.href='<%= contextPath %>/userListView.aus?currentPage=<%=currentPage+1%>';">></button>
		                	<% } %>
		                
                	 	</div>
                	 
                     	<br><br>

</body>
</html>