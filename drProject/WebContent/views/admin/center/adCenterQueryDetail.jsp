<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User, com.dr.admin.center.model.vo.adCenterQuery"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
	
	adCenterQuery q = (adCenterQuery)request.getAttribute("q");
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
        
        .queryArea th{
            background: rgb(219, 214, 206);
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
                    <h2>고객센터 > 1:1 문의 관리</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">





            <!--1:1문의 관리-->
            <div id="content_2_3">    
                <p style="font-size: 20px; color: white; font-weight: 1000;">1:1문의 관리 > 문의내역 (답변/수정/삭제)</p>
            </div>


            <!--1:1문의 디테일/ 답변하기폼-->
            <div id="content_2_4" style="background: white;">
                <div class="queryDetailArea" align="center">
                     <table border="1" class="queryArea">
                         <tr>
                             <th>아이디</th>
                             <td><%=q.getUserId() %></td>
                             <th>문의 상태</th>
                             <td>
                             	<%if(q.getQueryStatus().equals("Y")) { %>
                            	 <label>정상</label>
                            	<% } else {%>
                             	 <label style="color:red;">삭제된 문의글</label>
                             	<% } %>
                             </td>
                         </tr>
                         
                         <tr>
                             <th>문의유형</th>
                             <td><%=q.getQueryCategory() %></td>
                             <th>문의작성일</th>
                             <td><%=q.getQueryCreateDate() %></td>
                         </tr>
                         <tr>
                             <th>문의제목</th>
                             <td colspan="3"><%=q.getQueryTitle() %></td>
                         </tr>
                         <tr>
                             <th>문의내용</th>
                             <td colspan="3">
                                 <textarea name="" id="" cols="30" rows="10" readonly><%=q.getQueryContent() %></textarea>
                             </td>
                         </tr>
                     </table>
                 </div>    
                  
                  
                 <div class="queryReplyArea" align="center">    
                     
                     <!-- 답변 수정, 등록 가능한 폼 -->
                     <form action="<%= contextPath %>/ctQueryReplyUpdate.ad" method="post" >
                     <input type="hidden" name="qno" value="<%= q.getQueryNo() %>">
                     
                     <table border="1" class="replyArea">
                     
                     <!-- 답변 완료시 -->
                        <% if(q.getReplyStatus().equals("Y")) { %>
                        
	                       <tr>
	                            <th>처리상태</th>
	                            <td>답변완료</td>
	                            <th>답변등록일</th>
	                            <td><%= q.getReplyDate() %></td>
	                        </tr>
	                        <tr>
	                            <th>답변내용</th>
	                            <td colspan="3">
	                                <textarea name="queryReplyContent" id="queryReplyContent" cols="30" rows="10"><%= q.getReplyContent() %></textarea>
	                            	<label style="float: right;"><span id="count" name="count" >0</span> / 450</label>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="4" align="right">
	                                <button type="submit" onclick="return validate()">수정</button>
	                                <button onclick="return confirmDelete();"><a href="<%=contextPath %>/ctQueryDelete.ad?qno=<%= q.getQueryNo() %>">삭제</a></button>
	                                <button onclick="return back();"><a href="<%=contextPath %>/ctQuery.ad?currentPage=1">취소</a></button>
	                            </td>
	                        </tr>
                       
                       	<!-- 답변 처리중일때 -->
                        <% } else if (q.getReplyStatus().equals("N")){ %>
	                        <tr>
	                            <th>처리상태</th>
	                            <td>답변대기</td>
	                            <th>답변등록일</th>
	                            <td>처리중</td>
	                        </tr>
	                        <tr>
	                            <th>답변내용</th>
	                            <td colspan="3">
	                                <textarea name="queryReplyContent" id="queryReplyContent" cols="30" rows="10"></textarea>
	                            	<label style="float: right;"><span id="count" name="count" >0</span> / 450</label>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="4" align="right">
	                                <button type="submit" onclick="return validate()">답변등록</a></button>
	                                <button onclick="return confirmDelete();"><a href="<%=contextPath %>/ctQueryDelete.ad?qno=<%= q.getQueryNo() %>">삭제</a></button>
	                                <button onclick="return back();"><a href="<%=contextPath %>/ctQuery.ad?currentPage=1">취소</a></button>
	                            </td>
	                        </tr>
	                   
	                   <!-- 회원이 삭제한 게시글일때 -->
	                   <% } else { %>
	                   		<tr>
	                            <th>처리상태</th>
	                            <td>
	                            <%if(q.getReplyContent() != null){ %>
	                           	<label>답변완료</label>
	                            <% } else { %>
	                            <label>답변대기</label>
	                            <% } %>
	                            </td>
	                            <th>답변등록일</th>
	                            <td>
	                            <%if(q.getReplyDate()==null) {%>
	                            	처리중
	                            <% } else { %>
	                            	<%= q.getReplyDate() %>
	                            <% } %>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>답변내용</th>
	                            <td colspan="3">
	                                <textarea name="queryReplyContent" id="queryReplyContent" cols="30" rows="10" readonly><%if(q.getReplyContent()==null) {%><% } else { %><%=q.getReplyContent() %><% } %>
	                                </textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="4" align="right">
	                                <button onclick="return confirmDelete();"><a href="<%=contextPath %>/ctQueryDelete.ad?qno=<%= q.getQueryNo() %>">삭제</a></button>
	                                <button onclick="return back();"><a href="<%=contextPath %>/ctQuery.ad?currentPage=1">취소</a></button>
	                            </td>
	                        </tr>
	                   
	                   <% }  %>
	                   
                   </table>
                    			<script>
                        			function back(){
                        				var result = confirm("현재 페이지에서 나가시겠습니까?");
                                    	if(result){
                                    		
                                    		return true;
                                    	} else {
                                    		
                                    		return false;
                                    	}
                        			}
                        			
                        			
                        			function confirmDelete(){
                        				var result = confirm("해당 문의글을 완전히 삭제하시겠습니까?");
                                    	if(result){
                                    		return true;
                                    	} else {
                                    		alert("삭제가 취소되었습니다")
                                    		return false;
                                    	}
                        			}
                        
                        
                        
									// 글 내용 450자 이상 입력 방지, 알러트
                                    $(document).ready(function(){
							            $("#queryReplyContent").on("keyup", function(){
                                            //var inputlength=$(this).val().length;
                                            //var remain = 450-inputlength;

							                if($(this).val().length>450){
							                    $(this).val($(this).val().substring(0, 450));
                                                alert("450자이상 입력하실 수 없습니다.");
							                }
							            });
							        });

                                    
                                    // 글자수 세기
                                    $(function(){
                                        $("#queryReplyContent").keyup(function(){
                                            var inputlength = $(this).val().length;
                                            $("#count").text(inputlength);
                                        })
                                        
                                    }) 
                                    
                                    
                                    // 글등록 유효성 체크
                                    function validate(){
                                    	
                                    	var queryReplyContent = document.getElementById("queryReplyContent");
                                    	var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자이상 등록
                                    	
                                    	
                                    	
                                    	if(!regExp.test(queryReplyContent.value)){
                                    		alert("제목을 입력해주세요");
                                    	
                                    		queryReplyContent.value="";
                                    		queryReplyContent.focus();
                                    		
                                    		return false;
                                    	}
                                    	
                                    	
                                       

                                    	
                                    	var result = confirm("답변을 등록/수정 하시겠습니까?");
                                    	if(result){
                                    		alert("답변이 등록/수정 되었습니다");
                                    		
                                    	} else {
                                    		alert("취소되었습니다");
                                    		return false;
                                    	}

                                        
                                    
                                    }
                                    
                               </script>
                   
                   
                   
                   
                   
                   
                   </form>
                   
                   
                   
                   
                   
                   
                   
                   
                </div>
			</div>    

        </div>






</body>
</html>