<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList, com.dr.admin.center.model.vo.adCenterFaq, com.dr.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<adCenterFaq> searchList =(ArrayList<adCenterFaq>)request.getAttribute("searchList"); 
	int listCount = (int)request.getAttribute("listCount");
	String searchFaq = (String)request.getAttribute("searchFaq");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String contextPath = request.getContextPath();
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

        #content_2_1{height:5%;}
        #content_2_2{height:5%;}
        
        

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



        <!-- content -->
        <div id="content_2">

            <!-- 상단 타이틀 -->
            <div id="content2_1">
                <h2>고객센터 > FAQ 관리</h2>
            </div>

            <hr style="border:1px solid rgb(145, 144, 144)">





            <!--FAQ관리-->
            <div id="content_2_2">    
                <p style="font-size: 20px; color: white; font-weight: 1000;">FAQ 관리</p>
            </div>


            <!--FAQ 게시판-->
            <div id="content_2_3" style="background: white; width: 820px;">
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
                
                <div class="searchResultArea">
	                <table>
	                    <tr>
	                        <th>
	                            <label style="font-size: 20px; color: rgb(96, 206, 23);"><%= searchFaq %> </label>검색결과 총 
	                            <label style="font-size: 20px; color: rgb(226, 166, 14);"><%=listCount %></label>개
	                        </th>
	                        
	                    </tr>
	                </table>
                </div>
                
            <div id="content_2_4" style="background: white; width: 820px;">    
                <div class="faqListArea" style="background: white; width: 820px; height: 500px;">
                <form action="<%= contextPath %>/ctFaqDelete.ad" method="post" >
                    <br><br>
                    <table align="center" class="listArea" border="1">
                         <thead>
                             <tr>
                                <th width="30">선택</th>
                                <th width="40" style="color:black">글번호</th>
                                <th width="50" style="color:black">문의유형</th>
                                <th width="200" style="color:black">제목</th>
                                <th width="50">글쓴이</th>
                                <th width="30">게시상태</th>
                                <th width="60">등록일</th>
                             </tr>
                         </thead>
                         <tbody>
                         
                         	<%if(searchList.isEmpty()){ %>
                         	<tr>
            					<td colspan="7">존재하는 글이 없습니다.</td>
            				</tr>
            				<% } else {%>
            					<% for (adCenterFaq n:searchList) { %>
                         
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
                    
                	
             
                    <br><br>
                    
                    
                   <div align="center" class="buttonArea">
                    	<br><br>
                    	<% if(searchList.isEmpty() ) { %>
                    	
                        	<button><a href="<%=contextPath%>/ctFaqEnroll.ad">새 글 등록</a></button>
                            

                        
                        
                        <% } else { %>
                        	<button><a href="<%=contextPath%>/ctFaqEnroll.ad">새 글 등록</a></button>
                       		<button type="submit"  onclick="return check();">선택 삭제</button> 
                       	    <!-- 폼으로해서 골라서 삭제페이지로 넘기기 -->
                       	    <!-- 리스트가 존재해야만 선택삭제버튼 나오도록 --> 
                        <% } %>
                        
                    </div>

					</form> 
				</div>
			</div>
            
            <div id="content_2_5" style="width: 820px;">
				
                <!-- 페이징처리 10개씩 -->
                <div align="center" class="pagingArea">

					<%if (searchList.isEmpty()) { %>
					<p></p>
					<% } else { %>
						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/ctFaqSearch.ad?currentPage=<%=currentPage-1%>&searchFaq=<%=searchFaq%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/ctFaqSearch.ad?currentPage=<%= p %>&searchFaq=<%=searchFaq%>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/ctFaqSearch.ad?currentPage=<%=currentPage+1%>&searchFaq=<%=searchFaq%>';">다음</button>
						<% } %>
					 <% } %>	
						
			    </div>
                    
                    





                <!-- 검색부분-->
                 <br><br>
                <div class="searchArea" align="center">
		            <form action="<%=contextPath %>/ctFaqSearch.ad?currentPage=1" method="post">
		                <input type="text" name="searchFaq" id="serchFaq" placeholder="궁금한내용을 입력해주세요">
		                <button type="submit">검색</button>
		            </form>
		        </div>
					 	
                    	
                    	
            </div>  
                
                
                        <script>
                            <% if(searchList.isEmpty()) { %>
                            //클릭x
                            <% } else { %>
                            $(function(){
                                $(".listArea>tbody>tr>td").click(function(){
                                    location.href = '<%=contextPath%>/ctFaqDetail.ad?fno=' + $(this).siblings().eq(1).text();			
                                    
                                })
                            })
                        <% } %>	
                        </script>
                    
                    	<script>
                    	//체크박스 선택안하고 삭제누르면 알람띄우기
                    	function check(){
	                 		
                    		if($("input:checkbox[id='fno']").is(":checked") == true) {
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







</body>
</html>