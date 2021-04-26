<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Comm" %>
<%
	ArrayList<Comm> list = (ArrayList<Comm>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    /* menubar */
    #header>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
    }

    #outer {
        height:1600px;
    }
    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;

        
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 300px;
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
    
    #content1{
        margin:auto;
        display:flex;
        justify-content: center;
        width:100%;
        height:20%;
        /* background-color: gray; */
    }
    
    .line{
        border: 1px solid gray;
        height:250px;
        margin: 0 20px;
    }
    
    #content2{
        display:flex;
        justify-content: center;
    }

    #content3 *{
        text-decoration:none;
        color:black;
        font-weight:bold;
        margin:20px;
        padding: 0px 20px;
        
    }

    #todayV{
        margin:auto;
        display:flex;
        align-content: center;
        margin:30px 50px;
    }
</style>
</head>
<body>
    <!-- 메뉴바에로그인 기능 등 메뉴바에 넣고, 메인페이지: 메뉴바, 푸터바 include시키기 -->
    <%@ include file = "menubar.jsp"%>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>


    <div id="content1" style="margin-top:20px; margin-bottom:50px;">
        <img src="../../resources/images/main/Jogging.jpg" alt="" width="70%" height="20%" >
    </div>
    

    <div id="content2">
        <div class="content2_1">
            <table border="1" style="text-align:center;" >

                <!-- 조회해오기 -->
                <caption><b>Info&Tip 최신글</b></caption>
                <thead>
	                <tr>
	                    <th width="50px" height="40px">글번호</th>
	                    <th width="200px">제목</th>
	                    <th width="130px">등록 날짜</th>
	                    <th width="50px">조회수</th>
	                </tr>
                </thead>
                <tbody>
	                <% if(list.isEmpty()){ %>
	                	<tr>
	                		<td colspan="4"> 조회된 리스트가 없습니다. </td>
	                	</tr>
	                	
	            	<% } else { %>
	            	
	            		<% for(Comm c : list) { %>
	                <tr>
		                <input type="hidden" value="<%= c.getCommPostNo() %>">
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
      

        <div class="line"></div>

        <div class="content2_2">
            <table border="1" style="text-align:center;">
                <caption><b>Community 인기글</b></caption>
                
                <tr>
                    <th width="50px" height="40px">글번호</th>
                    <th width="200px">제목</th>
                    <th width="130px">등록 날짜</th>
                    <th width="50px">조회수</th>
                </tr>
                <tr>
                    <td height="25px">1</td>
                    <td>운동하기 딱 좋은 날씨네요</td>
                    <td>2019-03-04</td>
                    <td>123</td>
                </tr>
                <tr>
                    <td height="25px">2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">3</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">4</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">5</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>


    </div>


    <hr style="margin-top:20px; margin-bottom:30px;">

    <div id="content3" >
        <table align="center"></table>
            <tr>
                <th>트린이를 위한 초보자 추천 운동</th>
                <th>트린이를 위한 초보자 추천 운동</th>
                <th>트린이를 위한 초보자 추천 운동</th>
                <th>트린이를 위한 초보자 추천 운동</th>
                
            </tr>
            <tr>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
            </tr>
            
        </table>


        <!-- <div class="content3_1" style="" >
            <a href="">트린이를 위한 초보자 추천 운동</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
        <div class="content3_2" >
            <a href="">기구없이 하는 맨몸 운동</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
        <div class="content3_3" >
            <a href="">자기 전 간단한 10분 운동</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
        <div class="content3_4" >
            <a href="">거북목 예방위한 스트레칭</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
    </div> -->


    <!-- footer -->
   
</div>
</body>
</html>