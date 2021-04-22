<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import= "java.util.ArrayList, com.dr.admin.user.model.vo.AdUser, com.dr.common.model.vo.PageInfo" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<AdUser> list = (ArrayList<AdUser>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
<style>
.listArea {
    text-align: center;
}
</style>
</head>
<body>
    
    <%@ include file="../adminPageLeftMenuBar.jsp" %>
    
           <!-- 상단 타이틀 -->
        <div id="content2_1">
            <h2>회원관리 > 회원 전체 조회</h2>
        </div>

        <hr style="border:1px solid gray">
        <br><br>

     
     <br><br>
         
        <div align="right" class="searchArea">
            <button>검색</button> 
            <input type="text">
        </div>
        <br>
        
        
        <table class="listArea">
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
	                
		                
		                <% for(AdUser u : list) { %>
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
		                    		<button disabled><%= p %></button>
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