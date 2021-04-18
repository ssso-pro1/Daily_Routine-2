<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Comm, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	ArrayList<Comm> list = (ArrayList<Comm>)request.getAttribute("list"); 
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing:border-box;
    }
    .wrap{
        width:1000px;
        height:800px;
        margin:auto;
        margin-top:15px;
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
    .line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px; 
    }

    #content_2_1{height:30%;}
    #content_2_2{height:70%; margin-left:48px;}

    .listArea{
        border:1px solid gray;
        text-align:center;
        margin-left:50px;
    }
    .listArea>tbody>tr:hover{
        background:lightgray;
        cursor:pointer;
    }
    .listArea>thead>tr{
        background:lightgray;
    }
    .listArea>tr,th,td{
        height:30px;
    }
    .searchArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    div>button{
        cursor:pointer;
    }
    .pagingArea, .searchArea{
        margin-left:120px;
    }
    .leftMenu>#menu1>a{color:rgb(250, 214, 9);}  
</style>
<body>
    
   <%@ include file="../../common/menubar.jsp"%>
	

    <div class="wrap">

        <div id="content">

            <!--왼쪽 공통메뉴-->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>
			
            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div>
                <br><br><br>
                
                <!-- 게시판 목록 테이블 -->
                <div id="content2_2">
                    <table align="center" class="listArea">
                        <thead>
                            <tr>
                                <th width="100" style="color:red;">[공지]</th>
                                <th width="400" style="color:hsl(46, 77%, 50%);">공지내용</th>
                                <th width="150">작성자</th>
                                <th width="150">작성일</th>
                                <th width="100">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- 조회된 결과가 없을 경우 -->
                        	<% if(list.isEmpty()) { %> 
                        	<tr>	
                        		<td colspan="5">조회된 리스트가 없습니다.</td>
                        	</tr>
                        	<% }else { %>
                        	<!-- 조회된 결과가 있을 경우 -->
                        		<% for(Comm c : list) { %>
		                            <tr>
		                                <td><%= c.getCommPostNo() %></td>
		                                <td><%= c.getPostTitle() %></td>
		                                <td><%= c.getUserNo() %></td>
		                                <td><%= c.getEnrollDate() %></td>
		                                <td><%= c.getBoardView() %></td>
		                            </tr>
                            	<% } %>
                            	
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <br><br>


                <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
                <div align="center" class="pagingArea">
                	
                	<% if(currentPage != 1) { %>
                    	<button onclick="location.href='<%=contextPath%>/commMain.co?currentPage=<%=currentPage-1%>';"><</button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                    	
                    	<% if(currentPage == p) { %>
                    		<button disabled><%= p %></button>
                    	<% }else { %>
                    		<button onclick="location.href='<%=contextPath%>/commMain.co?currentPage=<%= p %>';"><%= p %></button>
                    	<% } %>
                    	
                  	<% } %>
                    
                    <% if(currentPage != maxPage) { %>
                    	<button onclick="location.href='<%=contextPath%>/commMain.co?currentPage=<%=currentPage+1%>';">></button>
                    <% } %>
                        
                </div><br><br>
            
            
                <div align="center" class="searchArea">
                
                    <input type="text">
                    <!-- <button>검색</button> -->
                   	<a href="<%=contextPath%>">검색</a>

                  	<!-- <button>글쓰기</button> -->
                  	<a href="<%=contextPath%>/tipEnrollForm.co">글쓰기</a>
              
                </div><br><br>
            </div>

        </div>
    </div>


</body>
</html>