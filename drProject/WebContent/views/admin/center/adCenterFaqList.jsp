<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%@ page import="java.util.ArrayList, com.dr.admin.center.model.vo.adCenterFaq, com.dr.common.model.vo.PageInfo"%>    
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<adCenterFaq> list =(ArrayList<adCenterFaq>)request.getAttribute("list"); 
	
	
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>관리자 메인 페이지- 좌측 메뉴바</title>

    <style>
        div{
            box-sizing:border-box;
        }
        .wrap{
            width:1000px;
            height:800px;
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

        /* wrap a#content_1 a:hover{color:white;} */

        #content2_1{
            color:white;
            font-size:10px;
            padding:10px;
        }

   
        #title{
            margin-left:25px;
        }
        .listArea{
            border:1px solid gray;
            text-align:center;
            width: 95%;
            margin: auto;
        }
        .listArea>tbody>tr:hover{
            background:rgb(219, 217, 217);
            cursor:pointer;
        }
        .listArea>thead>tr{
            background:rgb(247, 209, 86);
        }
        .listArea>tr,th,td{
            height:30px;
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
                
                <a id="welcome" href="<%=contextPath%>/loginForm.us">Welcome님</a>
                
                <!-- <i class="fas fa-bars"></i> -->
                <a href="<%=contextPath%>/"><i class="fas fa-home"></i></a> <!-- 오븐에는 메뉴바로 돼있는데, 저희 왼쪽에 메뉴바가 있어서 홈으로 가는 기능으로 바꾸면 좋을 것 같아서 넣었어요!-->

                <!-- 로그인 후
                <div>admin01님</div> -->
            </span>
        </div>


        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">전체 회원 조회 </a></div>
                    <div><a href="<%=contextPath%>/deleteForm.aus">회원 탈퇴처리</a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>게시물관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">HomeTraining</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">Info&Tip</a></div> 
                    <br>
                </div>

                <div class="content_1_3">
                    <h2>고객센터</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">공지사항</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">FAQ</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">1:1문의</a></div> 
                    <br>
                </div>

                <div class="content_1_4">
                    <h2>신고관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">전체신고보기</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">블랙리스트</a></div> 
                </div>
            </div>

            <div id="line"></div>



            <!-- content -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content2_1">
                    <h2>고객센터 > FAQ 관리</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">





            <!--FAQ관리-->
            <div id="content_2_3">    
                <p style="font-size: 20px; color: white; font-weight: 1000; ">FAQ 관리</p>
            </div>


            <!--FAQ 게시판-->
            <div id="content_2_4" style="background: white;">
                <div class="faqCategoryArea">
                    <table>
                        <tr>
                            <th></th>
                            <th><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=top">자주찾는 질문 TOP10 </a>|</th>
                            <th><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=userInfo">회원정보</a>|</th>
                            <th><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=content">게시글/댓글</a> |</th>
                            <th><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=report">신고</a> |</th>
                            <th><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=etc">기타</a></th>
                        </tr>
                    </table>

                </div>
                 
             <form action="<%= contextPath %>/ctFaqDelete.ad" method="post" > <!-- 삭제하기서블릿 -->
                <div class="faqListArea" style="background: white; width: 800px; height: 500px;">
                
                   <br><br>
                    <table align="center" class="listArea" border="1" >
                         <thead>
                             <tr>
                                <th width="30">선택</th>
                                <th width="40" style="color:black">글번호</th>
                                <th width="40" style="color:black">문의유형</th>
                                <th width="200" style="color:black">제목</th>
                                <th width="50">글쓴이</th>
                                <th width="60">게시상태</th>
                                <th width="60">등록일</th>
                             </tr>
                         </thead>
                         <tbody>
                         
                         	<%if(list.isEmpty()){ %>
                         	<tr>
            					<td colspan="7">존재하는 글이 없습니다.</td>
            				</tr>
            				<% } else {%>
            					<% for (adCenterFaq n:list) { %>
                         
                            <tr>
                                <th>
	                                <input type="checkbox" name="fno" id="fno" value="<%=n.getFaqNo() %>">
	                                <input type="hidden" name="ctg" value="<%= n.getFaqCategory() %>">
                                </th>
                                <td><%= n.getFaqNo() %></td>
                                <td>
                                	<% if(n.getFaqCategory().equals("top")) { %>
                                		<label>TOP10</label>
                                	<% } else if (n.getFaqCategory().equals("userInfo")) { %>
                                		<label>회원정보</label>
                                	<% } else if (n.getFaqCategory().equals("content")) { %>
                                		<label>게시글/댓글</label>
                                	<% } else if (n.getFaqCategory().equals("report")) { %>
                                		<label>신고</label>
                                	<% } else if (n.getFaqCategory().equals("etc")) { %>
                                		<label>기타</label>
                                	<% } %>
                                </td>
                                <td><%=n.getFaqTitle() %></td>
                                <td><%=n.getUserId() %></td>
                                <td><%=n.getStatus() %></td>
                                <td><%=n.getCreateDate() %></td>
                            </tr>
								<% } %>
                            <% } %>
                            	
                         </tbody>
                    </table>
             
             		<script>
				    	$(function(){
							$(".listArea>tbody>tr>td").click(function(){
								location.href = '<%=contextPath%>/ctFaqDetail.ad?fno=' + $(this).siblings().eq(1).text();			
								
							})
				    	})
				    </script>
             
                    <br><br>
                    
                    <!-- 페이징처리 10개씩 -->
                   
                    <div align="center" class="pagingArea">

						<%if (list.isEmpty()) { %>
					<p></p>
					<% } else { %>
						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/ctFaqList.ad?currentPage=<%=currentPage-1%>&ctg=<%= list.get(0).getFaqCategory() %>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/ctFaqList.ad?currentPage=<%= p %>&ctg=<%= list.get(0).getFaqCategory() %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/ctFaqList.ad?currentPage=<%=currentPage+1%>&ctg=<%= list.get(0).getFaqCategory() %>';">다음</button>
						<% } %>
					 <% } %>	
						
			        </div>
                    
                    <div align="center" class="buttonArea">
                    	<br><br>
                    	<% if(list.isEmpty() ) { %>
                    	
                        	<button><a href="<%=contextPath%>/ctFaqEnroll.ad">새 글 등록</a></button>
                            

                        
                        
                        <% } else { %>
                        	<button><a href="<%=contextPath%>/ctFaqEnroll.ad">새 글 등록</a></button>
                       		<button type="submit"  onclick="return check();">선택 삭제</button> 
                       	    <!-- 폼으로해서 골라서 삭제페이지로 넘기기 -->
                       	    <!-- 리스트가 존재해야만 선택삭제버튼 나오도록 --> 
                        <% } %>
                        
                        </div>

					</form> 




             		<!-- 검색부분-->
                    <br><br>
                    	<div class="searchArea" align="center">
		                    <form action="<%=contextPath %>/ctFaqSearch.ad?currentPage=1" method="post">
		                        <input type="text" name="searchFaq" id="serchFaq" placeholder="궁금한내용을 입력해주세요">
		                        <button type="submit">검색</button>
		                    </form>
		                </div>
					 	
                    	
                    	
                        
                    
                    	<script>
	                 		function check(){
	                 			
	                 			var result = confirm("선택한 FAQ 글을 완전히 삭제 하시겠습니까?");
			                	
	                 			if(result){
	                            		
	                            		
	                            } else {
	                            	alert("삭제가 취소되었습니다");
	                            		return false;
	                            }
	                 			
	                 		}


						</script>   









    
                    
                    
                    
                    
                    </div>
                    
                 
                 		
           	    
			
            

        </div>







</body>
</html>