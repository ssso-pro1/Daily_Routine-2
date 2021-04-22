<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList, com.dr.admin.ht.model.vo.AdHT, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<AdHT> list = (ArrayList<AdHT>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ht게시글 리스트 조회</title>
    <style>
        table *{
            text-align: center;
        }
        /* #content_2{
            background:rgb(33, 33, 34);
        } */
        .outer{
            width:800px;
            height:auto;
            background:rgb(33, 33, 34);
            margin:auto;
            /* margin-top:10px; */
            /* padding-top:70px; */
        }

        .listArea{
            border:1px solid gray;
            text-align:center;
            color:white;
        }
        .listArea>tbody>tr:hover{
            background:gray;
            
            cursor:pointer;
        }

    </style>
</head>
<body>
    <%@ include file="../adminPageLeftMenuBar.jsp" %>

     <!-- content -->
     <div id="content_2">

        <!-- 상단 타이틀 -->
        <div id="content2_1">
            <h2>게시물 관리 > HomeTraining</h2>
        </div>

        <hr style="border:1px solid gray">
        <br><br>

     </div>
     <br><br>

     <div class="outer">
        <!-- 관리자 로그인시 보여짐 (로그인 && 로그인한 사용자가 admin일 경우) -->
        
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        
        <div align="right" style="width:750px">
            
            <br><br>
            <a href="<%=contextPath%>/enrollForm.aus" class="btn btn-warning"></a>
        </div>

		<% } %>

        <table class="listArea" align="center">
                <thead>
                    <tr>
                        <th width="60">글번호</th>
                        <th width="70">카테고리</th>
                        <th width="300">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="100">수정일</th>
                        <th width="60">조회수</th>
                    </tr>
                </thead>
                
                <tbody>
              		<!-- 조회된 결과가 없을 경우 -->
              		<% if(list.isEmpty()){ %>
              			<tr>
              				<td colspan="7"> 조회된 리스트가 없습니다. </td>
              			</tr>
              		<% } else { %>
              		
              		<!-- 조회된 결과가 있을 경우 -->
              		
              			<% for(AdHT a : list){ %>
              		
              		
		                    <tr>
		                        <td><%= a.getHtPostNo() %></td>
								<td><%= a.getCategoryName() %></td>
								<td><%= a.getHtPostTitle() %></td>
								<td><%= a.getUserNo() %></td>
								<td><%= a.getHtEnrollDate() %></td>
								<td><%= a.getHtUpdateDate() %></td>
								<td><%= a.getHtBoardView() %></td>
		                    </tr>
                    	<% } %>
                    	
                    <% } %>
                </tbody>
        </table>
         <br>

    <br>
    
    <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
    <!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
    
    <!--  경로 !!!!!!!!!!!!! 수정하기 -->
    
    <div align="center" class="pagingArea">
    
         <!-- 관리자 메뉴바에서 hometraining 클릭시 : AdHTListServlet 에서 views/admin/ht/adHTListView.jsp 로이동 / 이 페이지에서 페이징 눌렀을 떄 : -->
         <% if(currentPage != 1) { %>   
			<button onclick="location.href='<%= contextPath %>/htList.aht?currentPage=<%=currentPage-1%>';"><</button>
		 	
		 <% } %>
		 
		
		 <% for(int p=startPage; p<=endPage; p++) { %>
			
			<% if(currentPage == p){ %>
				<button disabled><%= p %></button> <!-- 현재보고있는 페이지는 다시 클릭불가 / bo?currentPage = 현재누른페이지-->
			<% }else{ %>
				<button onclick="location.href='<%= contextPath %>/htList.aht?currentPage=<%= p %>';"><%= p %></button>
			<% } %>
            
		<% } %>
		
		<% if(currentPage != maxPage) { %>
			<button onclick="location.href='<%= contextPath %>/htList.aht?currentPage=<%= currentPage+1 %>';">></button>
			
		<% } %>
	        
	       
    </div>

    <br><br>
    
 </div>
</body>
</html>