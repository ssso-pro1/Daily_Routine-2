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
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    }  
</style>
</head>
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
                	
                	<div class="commArea">
                  		<table align="center" class="listArea">
	                        <thead>
	                            <tr>
	                                <th width="100">글번호</th>
	                                <th width="100">카테고리명</th>
	                                <th width="500">글제목</th>
	                                <th width="150">작성자</th>
	                                <th width="150">작성일</th>
	                                <th width="100">조회수</th>
	                            </tr>
	                        </thead>
                      		<tbody>
	                        	<% if(list.isEmpty()) { %> 
	                        	<tr>	
	                        		<td colspan="6" style="color: crimson; font-weight: bolder; font-size: 20px;">조회된 리스트가 없습니다.</td>
	                        	</tr>
	                        	<% } else { %>
	                        		<% for(Comm c : list) { %>
			                    <tr>
				                    <td width="8%"><%= c.getCommPostNo() %></td>
		                            <td width="15%"><%= c.getCategoryName() %></td>
				                    <td width="42%"><%= c.getPostTitle() %></td>
				                    <td width="10%"><%= c.getUserNo() %></td>
				                    <td width="15%"><%= c.getEnrollDate() %></td>
				                    <td width="10%"><%= c.getBoardView() %></td>
			                    </tr>
	                            	<% } %>
	                            <% } %>
	                        </tbody>
                   		</table>  
                
		                <script>
		                	$(function() {
		                		$(".listArea>tbody>tr").click(function() {
		                			location.href= '<%=contextPath%>/tipDetail.co?cno=' + $(this).children().eq(0).text();
		                		})
		                	})
		               	</script> 
               	
              		 	<br><br>


		                <!-- 페이징 처리 -->
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
		                        
		                </div>
		                
		                <br><br>
            	
            
		                <div align="center" class="searchArea">
		                	<form action="<%=contextPath%>/tipSearch.co?currentPage=1" method="post">
			                    <select name="searchTip">
			                    	<option name="searchTip" value="제목">제목</option>
			                    	<option name="searchTip" value="내용">내용</option>
			                    </select>
			                    <input type="text" name="searchTipText">
			                   	<button type="submit">검색</button>
			                  	<a href="<%=contextPath%>/tipEnroll.co">글쓰기</a>
		              		</form>
		                </div><br><br>
                
                
           		 </div>

        </div>
    </div>
</div>

</body>
</html>