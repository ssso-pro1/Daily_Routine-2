<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User, com.dr.admin.ht.model.vo.adHT"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
	
	adHT t = (adHT)request.getAttribute("t");
%>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지- 좌측 메뉴바</title>
    <!-- jQuery library-->
    <script src="https://ajax.googleeapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
      

        .outer{
            background: rgb(33, 33, 34);;
            color: white;
            width:1000px;
            height:800px;
            margin:auto;
            margin-top:50px;

        }

        #content_2_2 td, #content_2_2 th{
            border: 1px solid gray;
            text-align:center;
        }
        
        
    </style>
</head>
<body>
	
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    

    <div class="outer">
        <table id="content_2_2" align="center">
            <tr>
                <th width="70">제목</th>
                <td width="500"><%=t.getHtPostTitle() %></td>
                <th>카테고리</th>
                <td>
					<% if(t.getCategoryName().equals("whole")){ %>
	                    	전신운동
	                <% } else if (t.getCategoryName().equals("core")) { %>
	                    	코어운동
	                <% } else if (t.getCategoryName().equals("upper")) { %>
	                    	상체운동
	                <% } else if (t.getCategoryName().equals("lower")) { %>
	                    	하체운동
	                <% } else if (t.getCategoryName().equals("stretching")) {%>
	                    	스트레칭
	                <% } %>

				</td>
            </tr>
            <tr>
                
                <th>작성일</th>
                <td><%= t.getHtEnrollDate() %></td>
                <th>수정일</th>
                <td>
                	<% if(t.getHtUpdateDate()==null) { %>
                		<%= t.getHtEnrollDate() %>
                	<% } else { %>
                		<%= t.getHtUpdateDate() %>
                	<% } %>
                </td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= t.getUserId() %></td>
                <th>게시여부</th>
                <td>
                	<% if(t.getStatus().equals("Y")) { %>
                		게시중
                	<% } else { %>
                		보류
                	<% } %>
                </td>
            </tr>
            
            <tr>
                <th>썸네일이미지</th>
                <td colspan="3">
                    <div align="center">
                        <img src="<%= contextPath %>/<%= t.getTitleImg() %>" width="200" height="200" alt="">
                    </div>
                </td>
            </tr>
            
            <tr>
                <th>내용</th>
                <td colspan="4">
                    <p style="height:300px;"><%= t.getHtPostContent() %></p>
                </td>
            </tr>
            
            <tr>
                <td colspan="4">
                    <button>수정</button>
                    <button>삭제</button>
                    <button>목록으로</button>
                </td>
                
            </tr>
        </table>

    </div>


        </div>


</body>
</html>