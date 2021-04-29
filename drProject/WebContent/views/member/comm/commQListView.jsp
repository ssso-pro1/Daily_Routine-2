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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

    #content_2_1{height:15%;}
    #content_2_2{height:80%; margin-left:48px;}

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
        background:rgb(250, 214, 9);
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
    
    .leftMenu>#menu3>a{
    	color:rgb(250, 214, 9);
    } 
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    
    <!-- 푸터바 --> 
  	.f{
        font-family: 'Do Hyeon', sans-serif;
    }
        /* footer */
    .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:-50px;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        
    }

    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);
        padding-top:10px;
    }
    .footer1_2{
    	margin-right:250px;
    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
    }
   
   
</style>
<body>
    
    <%@ include file="../../common/menubar.jsp"%>
	

    <div class="wrap ff">

        <div id="content">

            <!--왼쪽 공통메뉴-->
            <div id="content_1">
                <a href="<%=contextPath%>/commMain.co" id="leftMenu"><h1 class="ff">커뮤니티</h1></a>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div id="menu3"><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>커뮤니티 > 질문게시판</h2>
                    <hr>
                    <p>운동에 관한 모든 것들! 질문 게시판에서 함께 공유해봐요!</p>
                </div>
                <br><br><br>
                
                <!-- 게시판 목록 테이블 -->
                <div id="content2_2">
                
                	<div class="commArea">
                   	    <table align="center" class="listArea">	
                            <thead>
                                 <tr>
	                                 <th width="100">글번호</th>
	                                 <th width="600">글제목</th>
	                                 <th width="150">작성자</th>
	                                 <th width="150">작성일</th>
	                                 <th width="100">조회수</th>
                            	 </tr>
                        	</thead>
                        	<tbody>
                        		<% if(list.isEmpty()) { %> 
                                <div align="center">
                                <p style="color: crimson; font-weight: bolder; font-size:20px; ">조회된 리스트가 없습니다.</p>
                                </div>
	                        	<% } else { int count=1; %>
	                        		<% for(Comm c : list) { %>
                           		<tr>
                           			<input type="hidden" value="<%= c.getCommPostNo() %>">
				                    <td width="10%"><%= count++ %></td>
				                    <td width="55%"><%= c.getPostTitle() %></td>
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
		                			location.href= '<%=contextPath%>/qDetail.co?cno=' + $(this).children().eq(0).val();
		                		})
		                	})
		             	</script> 
               	
              		 	<br><br>
           			
           			
           			 	<!-- 페이징 처리 -->	
                	 	<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
               		 	<div align="center" class="pagingArea">
               		 
                   	 		<% if(currentPage != 1) { %>
		                    	<button onclick="location.href='<%=contextPath%>/question.co?currentPage=<%=currentPage-1%>';"><</button>
		                	<% } %>
		                    
		                	<% for(int p=startPage; p<=endPage; p++) { %>
		                    	
		                    	<% if(currentPage == p) { %>
                                    <button disabled style="background:rgb(250, 214, 9); color:white; border:rgb(250, 214, 9)";><%= p %></button>
		                    	<% }else { %>
		                    		<button onclick="location.href='<%=contextPath%>/question.co?currentPage=<%= p %>';"><%= p %></button>
		                   		<% } %>
		                    	
		                	<% } %>
		                    
		                	<% if(currentPage != maxPage) { %>
		                    	<button onclick="location.href='<%=contextPath%>/question.co?currentPage=<%=currentPage+1%>';">></button>
		                	<% } %>
		                
                	 	</div>
                	 
                     	<br><br>
            		
            		
            		 	<div align="center" class="searchArea">
		                	<form action="<%=contextPath%>/searchQ.co?currentPage=1" method="post">
			                	<select name="searchQCtg">
			                   		<option name="searchQCtg" value="제목">제목</option>
			                   		<option name="searchQCtg" value="내용">내용</option>
			                 	</select>
	                         	<input type="text" name="searchQText">
		                   	 	<button type="submit" class="fas fa-search"></button>
		                  	 	<a href="<%=contextPath%>/qEnroll.co" class="fas fa-pencil-alt"> 글쓰기</a>
		              		</form>
		             	</div><br><br>
   
       		   	</div>
       		 
        </div>
    </div>	 
</div>

	 <!-- footer -->
    <div class="footerOuter">
    

            <div class="footer1">
                <div class="footer1_1">
                    <a href="">이용약관</a> | 
                    <a href="">개인정보보호정책</a>
                </div>

                <div class="footer1_2" align="right">
                    <i class="fab fa-instagram-square" fa="lg" ></i>
                    <i class="fab fa-youtube"></i>
                    <i class="fab fa-facebook"></i> 
                    <i class="fas fa-arrow-up" fa="lg"></i>
                </div>
            </div>
          
            
            <div class="footer2">
                <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
                    Daily Routine : DR <br>
                    주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
                    고객센터 및 제휴문의 : daily@routine.co.kr           
                    <br>
                    CopyRight 2000-2021 Daily Routine All Right Reserved
                </p>
            </div>
    </div>
	

</body>
</html>