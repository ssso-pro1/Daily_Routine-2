<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%@ page import="java.util.ArrayList, com.dr.admin.center.model.vo.adCenterQuery, com.dr.common.model.vo.PageInfo"%>    
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<adCenterQuery> list =(ArrayList<adCenterQuery>)request.getAttribute("list"); 
	
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
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
            width:1500px;
            height:40px;
            background-color: gray;
            padding:5px;
            
            display:flex;
            justify-content:space-between;

            color:white;
            font-weight:bold;
            font-size:20px;
        }
        
        #content a:hover{color:white;}



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
            background:rgba(219, 217, 217, 0.295);
            cursor:pointer;
            opacity: 0.7;
        }
        .listArea>thead>tr{
            background:rgb(247, 209, 86);
        }
        .listArea>tr,th,td{
            height:50px;
        }
        
        a{
            text-decoration: none; color: white;}
        
        
        
        


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
                    <div><a style="color:white;" href="<%=contextPath%>/ctQuery.ad?currentPage=1">1:1문의</a></div>
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
                    <h2>고객센터 > 1:1 문의 관리</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">





            <!--1:1문의 관리-->
           

            <!---1:1문의 게시판-->
            <div id="content_2_4" style="width: 850px; margin: auto; margin-top: 30px;">
                <div class="replyStatusArea" style="font-weight: 1000;">
                    <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center" style="width: 900px;">
                        <ul class="navbar-nav">
                          <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath%>/ctQuery.ad?currentPage=1">전체보기</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath%>/ctQuerySelect.ad?currentPage=1&reStatus=N">답변대기</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath%>/ctQuerySelect.ad?currentPage=1&reStatus=Y">답변완료</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="<%=contextPath%>/ctQuerySelect.ad?currentPage=1&reStatus=D">회원삭제</a>
                          </li>
                         <li>
                         &nbsp; &nbsp; &nbsp;
                          </li>
                        </ul>
                        
                    </nav>

                </div>
                
                
                
                <div class="queryListArea" style="color: white; width: 900px; height: 600px;">
                <form action="<%= contextPath %>/ctQueryDelete.ad" method="post" > <!-- 삭제하기서블릿으로 -->
                    <br><br>
                    <table align="center" class="listArea" border="1">
                         <thead>
                             <tr>
                                <th width="40" style="color:black">선택</th>
                                <th width="40" style="color:black">글번호</th>
                                <th width="40" style="color:black">문의유형</th>
                                <th width="200" style="color:black">제목</th>
                                <th width="50" style="color:black">회원아이디</th>
                                <th width="60" style="color:black">처리상태</th>
                                <th width="60" style="color:black">등록일</th>
                             </tr>
                         </thead>
                         <tbody>
                         
                         	<% if(list.isEmpty()) { %>
                         	<tr>
            					<td colspan="7">존재하는 문의글이 없습니다.</td>
            				</tr>
            				<% } else { %>
                         		<% for(adCenterQuery q:list) { %>
                         	
                         	<tr>
                                <th>
                                	 <input type="checkbox" name="qno" id="qno" value="<%=q.getQueryNo() %>">
                                </th>
                                <td><%= q.getQueryNo() %></td>
                                <td><%= q.getQueryCategory() %></td>
                                <td><%= q.getQueryTitle() %></td>
                                <td><%= q.getUserId() %></td>
                                <td>
                                <% if(q.getReplyStatus().equals("Y")){ %>
                                <label style="color: rgb(129, 46, 236); font-weight: 600;">답변완료</label>
                                <% } else if (q.getReplyStatus().equals("N")){ %>
                                <label style="color: red; font-weight: 600;">답변대기</label>
                                <% } else {%>
                                <label style="color: green; font-weight: 600;">삭제글</label>
                                <% } %>
                                </td>
                                <td><%= q.getQueryCreateDate() %></td>
                            </tr>
								<% } %>
                           <% } %>
                            	
                         </tbody>
                    </table>
             
                    <br>
                        <div align="left" class="buttonArea">
                            
                            <% if(list.isEmpty() ) { %>
                            
                            <% } else { %>
                                    <br>
                                        <button class="btn btn-dark btn-sm" type="submit"  onclick="return check();">선택 삭제</button> 
                                           <!-- 폼으로해서 골라서 삭제페이지로 넘기기 -->
                                           <!-- 리스트가 존재해야만 선택삭제버튼 나오도록 --> 
                            <% } %>
                            
                        </div>
    
                    </form> 
                </div>
                <br>

                <div align="center" class="pagingArea">

                    <%if (list.isEmpty()) { %>
                    <p></p>
                    <% } else { %>
                        <% if(currentPage != 1) { %>
                            <button class="btn btn-outline-secondary btn-sm"  onclick="location.href='<%=contextPath%>/ctQuery.ad?currentPage=<%=currentPage-1%>';">이전</button>
                        <% } %>
                        
                        <% for(int p=startPage; p<=endPage; p++) { %>
                            
                            <% if(currentPage == p){ %>
                                <button disabled class="btn btn-warning btn-sm"><%= p %></button>
                            <% }else{ %>
                                <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/ctQuery.ad?currentPage=<%= p %>';"><%= p %></button>
                            <% } %>
                            
                        <% } %>
                        
                        <% if(currentPage != maxPage){ %>
                            <button class="btn btn-outline-secondary btn-sm" onclick="location.href='<%=contextPath%>/ctQuery.ad?currentPage=<%=currentPage+1%>';">다음</button>
                        <% } %>
                     <% } %>	
                    
                </div>









             		<script>
             		<% if(list.isEmpty()) { %>
         			//클릭x
             		<% } else { %>
             		
	             		$(function(){
							$(".listArea>tbody>tr>td").click(function(){
								location.href = '<%=contextPath%>/ctQueryDetail.ad?qno=' + $(this).siblings().eq(1).text();			
								
							})
				    	})
				    <% } %>	
				    </script>
             
                    <br><br>
                    
                  
                  	
                
                    
                     
                    
				
					<script>
					//체크박스 선택안하고 삭제누르면 알람띄우기
                	function check(){
                 		
                		if($("input:checkbox[id='qno']").is(":checked") == true) {
                 				var result = confirm("선택한 FAQ 글을 완전히 삭제 하시겠습니까?");
	                 			if(result){
	                            		
	                            		
	                            } else {
	                            	alert("삭제가 취소되었습니다");
	                            		return false;
	                            }
	                 				
                 				
                 			} else {
                 				alert("게시글을 선택해주세요");
                 				return false;
                 			}
                 			
                 			
		                	
                 			
                 		}

					</script>   


                

        </div>

    </div>

</div>



</body>
</html>