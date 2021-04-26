<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dr.member.info.model.vo.*, com.dr.member.user.model.vo.User" %>
<%
	Info i = (Info)request.getAttribute("i"); 
	ArrayList<InfoFile> list = (ArrayList<InfoFile>)request.getAttribute("list"); 

	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>Insert title here</title>
<style>
    div{
        box-sizing:border-box;
    }
    
    .wrap{
        width:1000px;
        height:800px;
        margin:auto;
        margin-top:37px;
    }
    .wrap>div{
        width:100%;
    }

    a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a:hover{color:rgb(250, 214, 9);}

    #content{height:100%; width:100%;}

    #content>div{
        height:100%;
        float:left;
    }

    #content_1{width:15%;}
    #content_2{width:80%; margin-left:25px;}
    
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_1{height:15%;}
    #content_2_2{height:80%; width:100%; margin-left:48px;}

    .detailArea{
        width:100%;
        height:100%;
    }
    
    table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    }   
    
    .detailArea>table>tr,td{
        border-bottom: 1px solid black;
        border:1px solid black;
    }
    
    p{
        text-align:center;
    }

    #buttonArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    
    div>button{
        cursor:pointer;
    }
    
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    }
    
    <!-- 메뉴바 --> 
    .outer{
        width:1000px;
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
  
    .navWrap{
    	margin-left:230px;
        margin:auto;
    }
       
    #topMenu1, #topMenu2{
    	width:12%;
    	margin-right:95px;
    	margin-top:15px;
    	border:none;
    }
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
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
	    
		  <div class="outer">

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

                <div class="sideLine" ></div>
                <hr id="mainLine">
            </span>
        
        </div>
    </div>
    </div>
    
    
    

    <div class="wrap">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
            <div id="content_1">
                <h1>Info & Tip</h1><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/workout.in?currentPage=1">운동 정보</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/menu.in?currentPage=1">식단 정보</a></div>
                </div>
            </div>

            <div id="line"></div>


            <!-- 인포앤팁 게시글 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>Info & Tip > 운동 정보 </h2>
                    <hr>
                    <p style="text-align:left;">Daily Routine에서 제공하는 다양한 운동 정보를 참고해보세요!</p>
                </div>
                <br>

                <!-- 게시글 세부 영역 -->
                <div id="content_2_2">
                    <div class="detailArea">
                        <table border="0">
                            <tr style="font-size:25px;">
                                <th width="800"><%=i.getPostTitle()%></th>
                            </tr>
                            <tr>
                                <td height="150" width="100%">
                                    <div align="center">
                                    	<img src="<%=contextPath%>/<%=list.get(0).getFilePath() + list.get(0).getFileUpdate()%>">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="150">
                                    <div align="center">
                                        <% for(int j=1; j<list.size(); j++) { %>
                                        <img src="<%=contextPath%>/<%=list.get(j).getFilePath() + list.get(j).getFileUpdate()%>">
                                        <% } %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="200"> 
                                    <p style="height:50px;"><%=i.getPostContent()%></p>
                                </td>
                            </tr>
                        </table>          
                        <br>
                        
                        <!-- 게시글 버튼 영역 -->
		                <div id="buttonArea" align="right">
		                     <a href="<%=contextPath%>/workout.in?currentPage=1" class="fas fa-list"> 목록</a>
		                </div>
		                        
                    </div>
                </div>

                
            </div>
        </div>
    </div>

</body>
</html>