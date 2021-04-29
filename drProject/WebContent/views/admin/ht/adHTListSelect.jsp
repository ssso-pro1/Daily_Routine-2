<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
    
<%@ page import = "java.util.ArrayList, com.dr.admin.ht.model.vo.adHT, com.dr.common.model.vo.PageInfo" %>
<%
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<adHT> list = (ArrayList<adHT>)request.getAttribute("list");
   
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>관리자</title>

    <style>
        body{
            background-color: rgb(33, 33, 34);
        }

        div{
            box-sizing:border-box;
        }
        .wrap{
            width:1500px;
            height: 1200px;
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
        #content_2_1 {
            color:white;
            font-size:10px;
            padding:10px;
        }
        
        /*  */
        

        #content2_2{
            height:800px; 
            background:rgb(33, 33, 34);
            margin:auto;
        }
        .listArea{
            width:760px;
            margin:auto;
            /* border:1px solid gray; */
            text-align:center;
            color:white;
        }
        .listArea>tbody>tr:hover{
            background:gray;
            
            cursor:pointer;
        }
        .thumbnail{
            /* border:1px solid white; */
            width:220px;
            display:inline-block;
            margin:14px;
        }
        .thumbnail:hover{
            cursor:pointer;
            color:rgb(250, 214, 9);
            /* color:gray; */
        }
        #cNavi>a{
            text-decoration: none;
            color:white;
        
        }
        #cNavi>a:hover{
            cursor:pointer;
            color:rgb(250, 214, 9);
            /* color:gray; */
        }
        #content2_2>#button{
            text-decoration: none;
        }
    </style>
</head>
<body>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div class="wrap">

        <div id="nav">
            <span align="left">Admin Center</span>

            <span>
                <!-- 로그인 전 -->
                
                   <i class="fas fa-user-circle"></i>
                   
                   <!-- 로그인 && 로그인한 아이디가 admin -->
                        
                            <a id="welcome" href="<%=contextPath%>/loginForm.aus">Welcome님</a>
                        
               
                        <div>
                          <br><br>
                         
                         <!-- <i class="fas fa-bars"></i> -->
                         <a href="<%=contextPath%>"><i class="fas fa-home"></i></a>
                        </div>
                  
                        
            </span>
        </div>


        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userListView.aus?currentPage=1">전체 회원 조회 </a></div>
                    <div><a href="<%=contextPath%>/deleteForm.aus">회원 탈퇴처리</a></div>
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
            
     
     <!-- 알러트 전달했을때 뜨게하기/ 메뉴바에 포함되어있으면 지워버리기! -->
			<script>
			
			var msg = "<%=session.getAttribute("alertMsg")%>";
		    if(msg != "null"){
		        alert(msg);
		        <% session.removeAttribute("alertMsg"); %>
		    }
			
			
			</script>            
            
            
            
            
            

     <!-- content -->
     <div id="content_2">

        <!-- 상단 타이틀 -->
        <div id="content2_1">
            <h2 style="color:gray; color:white; margin-top: 20px;">게시물 관리 > HomeTraining</h2>
            <hr style="border: 1px solid gray; margin-top: 30px; ">

            <p style="color: white;">홈트레이닝</p>

        </div>

        <br><br>

     
     <br><br>

     <div id="content_2_2" style="width: 850px; margin: auto;">
        <!-- 관리자 로그인시 보여짐 (로그인 && 로그인한 사용자가 admin일 경우) : 어차피 관리자 로그인해야 들어갈 수잇어서 필요없음-->
        
        <div class="categoryArea" style="font-weight: 1000;" >
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center" style="width: 900px;">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link" href="<%= contextPath %>/htList.aht?currentPage=1">전체보기</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%= contextPath %>/htListSelect.aht?currentPage=1&ctg=whole">전신운동</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%= contextPath %>/htListSelect.aht?currentPage=1&ctg=core">코어운동</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%= contextPath %>/htListSelect.aht?currentPage=1&ctg=upper">상체운동</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%= contextPath %>/htListSelect.aht?currentPage=1&ctg=lower">하체운동</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%= contextPath %>/htListSelect.aht?currentPage=1&ctg=stretching">스트레칭</a>
                  </li>
                  <% if(loginUser != null && loginUser.getAdminCheck().equals("Y")) { %>
                  <li class="nav-item">
                    <a href="<%=contextPath%>/htEnrollForm.aht" class="btn btn-secondary btn-sm" style="text-decoration: none; color:white">글작성</a>
                  </li>
                  <% } %>
                  
                  
                  <li>
                 &nbsp; &nbsp; &nbsp;
                  </li>
                </ul>
            </nav>   

        </div>
 		
 		
 		
        
        <div class="listArea" align="center">
        
        <!-- 조회된 결과가 없을 경우 -->
                
            <% if(list.isEmpty()) { %>
       
                
                
                    <div> 조회된 리스트가 없습니다. </div>
               
                
            <% } else { %>
                 
         <!-- 조회된 결과가 있을 경우 -->
         
        	
        		<% for(adHT t:list) { %>
            <div class="thumbnail" align="center">
                <input type="hidden" value="<%= t.getHtPostNo() %>">
                <img src="<%= contextPath %>/<%= t.getTitleImg() %>" width="200" height="150">
	             <table id="a">
	                <tr>
	                    <td width="20px"><%= t.getHtPostNo() %></td>
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
                        <td colspan="2"><%= t.getHtPostTitle() %></td>
	                    
                    </tr>
                    <tr>
                        <td colspan="2"><%= t.getHtEnrollDate() %></td>
                    </tr>
	              </table>   
                  
            </div>
           		<% } %> 
           	<% } %>
            
        </div>
        
        <script>
			$(function() {
       	     	 $(".thumbnail").click(function() {
                  	 location.href= '<%=contextPath%>/htDetail.aht?hno=' + $(this).children().eq(0).val();
      	     	   })
   	    	 })
		</script>
                
                
                
              
                  
              
            </div>
         <br>

    <br>
    
    <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
    <!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
    
    <!--  경로 !!!!!!!!!!!!! 수정하기 -->
    
    <div align="center" class="pagingArea">
    
         <!-- 관리자 메뉴바에서 hometraining 클릭시 : AdHTListServlet 에서 views/admin/ht/adHTListView.jsp 로이동 / 이 페이지에서 페이징 눌렀을 떄 : -->
         <% if(currentPage != 1) { %>   
			<button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%= contextPath %>/htListSelect.aht?currentPage=<%=currentPage-1%>&ctg=<%=list.get(0).getCategoryName() %>';"><</button>
		 	
		 <% } %>
		 
		
		 <% for(int p=startPage; p<=endPage; p++) { %>
			
			<% if(currentPage == p){ %>
				<button disabled class="btn btn-warning btn-sm"><%= p %></button> <!-- 현재보고있는 페이지는 다시 클릭불가 / bo?currentPage = 현재누른페이지-->
			<% }else{ %>
				<button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%= contextPath %>/htListSelect.aht?currentPage=<%= p %>&ctg=<%=list.get(0).getCategoryName() %>';"><%= p %></button>
			<% } %>
            
		<% } %>
		
		<% if(currentPage != maxPage) { %>
			<button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%= contextPath %>/htListSelect.aht?currentPage=<%= currentPage+1 %>&ctg=<%=list.get(0).getCategoryName() %>';">></button>
			
		<% } %>
	        
	       
    </div>

    <br><br>
    
 </div>
</body>
</html>