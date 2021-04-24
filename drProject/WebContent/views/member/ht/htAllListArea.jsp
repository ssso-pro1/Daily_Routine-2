<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.dr.member.ht.model.vo.Ht, com.dr.common.model.vo.PageInfo" %>
<!DOCTYPE html>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Ht> list = (ArrayList<Ht>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String contextPath = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(list.isEmpty()){ %>
		<h1>조회된 리스트가 없습니다</h1>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	<% } else{ %>
		<% for(Ht h : list){ %>
			<div class="thumbnail" align="center">
				<input type="hidden" value="<%= h.getHtPostNo() %>">
				<img src="<%= h.getTitleImg() %>" width="230" height="150">
				<p>
					<%= h.getHtPostTitle() %><br>
					조회수 : <%= h.getHtViewCount() %> 좋아요 : <%= h.getHtLikeCount() %> <br>
					<%= h.getHtUpdateDate() %>
				</p>
			</div>
		<% } %>
	<% } %>
	<!-- 디테일 뷰 가는 스크립트 -->
		<script>
			$(function() {
       	     	 $(".thumbnail").click(function() {
                  	 location.href= '<%=contextPath%>/detail.ht?hno=' + $(this).children().eq(0).val();
      	     	   })
   	    	 })
		</script>

	<br><br>
	<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
	<!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
	<div align="center" class="pagingArea">
		<% if(currentPage != 1){ %>
			<button onclick="location.href='<%= contextPath %>/allListArea.ht?currentPage=<%= currentPage-1 %>';"><</button>
		<% } %>
							
		<% for(int p=startPage; p<=endPage; p++){ %>
			<% if(currentPage == p) { %>
				<button disabled><%= p %></button>
			<% }else{ %>
				<button onclick="location.href='<%= contextPath %>/allListArea.ht?currentPage=<%= p %>';"><%= p %></button>
			<% } %>
		<% } %>
							
		<% if(currentPage != maxPage){ %>
			<button onclick="location.href='<%= contextPath %>/allListArea.ht?currentPage=<%= currentPage + 1 %>';">></button>
		<% } %>
	</div>

</body>
</html>