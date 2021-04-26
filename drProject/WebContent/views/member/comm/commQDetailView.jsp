<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.*" %>
<%

	Comm c = (Comm)request.getAttribute("c");
	// 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일 
	
	CommFile cf = (CommFile)request.getAttribute("cf"); 
	// null
	// 파일번호, 원본명, 수정명(실제 서버에 업로드된 이름), 저장폴더경로
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>커뮤니티 > 질문게시판 게시글 상세조회</title>
<style>
    div{
        box-sizing:border-box;
    }
    
    i:hover{color:rgb(250, 214, 9);}
    
    .wrap{
        width:1000px;
        height:1000px;
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
    #content_3{margin-left:48px;}
    
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_1{height:10%;}
    #content_2_2{height:35%; margin-left:48px;}
    #content_2_3{height:35%;}

    .detailArea{
        height:100%;
    }

    .detailArea, .replyArea{
        width:100%;
    }
    .detailArea>table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    }   
   
    .buttonArea1>button, .buttonArea3>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    
    div>button{
        cursor:pointer;
    }
    
    .leftMenu>#menu3>a{
    	color:rgb(250, 214, 9);
    }
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
</style>
</head>
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


            <!-- 커뮤니티 게시글 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 질문게시판</h2>
                    <hr>
                    <p>운동에 관한 모든 것들! 질문 게시판에서 함께 공유해봐요!</p>
                </div>
                <br>

				<!-- 로그인되어있고, 로그인한 사용자가 게시글일 경우 보이는 버튼 -->
				<% if(loginUser != null && loginUser.getUserId().equals(c.getUserNo()))  { %>
                <div class="buttonArea1" align="right">
                    <a href="<%=contextPath%>/qUpdateForm.co?cno=<%=c.getCommPostNo()%>" class="fas fa-edit"> 수정</a>&nbsp;
	                <a href="<%=contextPath%>/qDelete.co?cno=<%=c.getCommPostNo()%>" class="fas fa-trash-alt"> 삭제</a>
                </div><br>
                <% } %>


                <!-- 게시글 세부 영역 -->
                <div id="content_2_2">
                    <div class="detailArea">
                        <table border="1" height="100%">
                            <tr align="center" height="40px;">
                                <th width="55%"><%=c.getPostTitle()%></th>
                                <th width="15%"> <i class="far fa-user-circle"></i>&nbsp; <%=c.getUserNo()%>님</th>
                                <th width="15%"><%=c.getEnrollDate()%></th>
                                <th width="15%">조회수 : <%=c.getBoardView()%></th>
                            </tr>
                            <tr align="left">
                                <td colspan="5" height="100%">
                                     <p style="margin-bottom:250px;"><%=c.getPostContent()%></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                	<% if(cf == null) { %>
	                            		&nbsp; <i class="far fa-file-image"></i>&nbsp; 첨부파일이 없습니다. 
	                            	<% }else { %>
	                                	&nbsp; <i class="far fa-file-image"></i>&nbsp; 첨부파일 > <a download ="<%=cf.getFileName()%>" href="<%=contextPath%>/<%=cf.getFilePath() + cf.getFileUpdate()%>"><%=cf.getFileName()%></a>
	                                <% } %>	
                                </td>        
                            </tr>
                        </table><br>
                    </div>
                </div><br>

                <!-- 게시글 버튼 영역-->
                <div class="buttonArea2" align="right">
                     좋아요 <i id="like" class="far fa-heart"></i>&nbsp;<%=c.getLikeCount()%> &nbsp;&nbsp;
                </div><br>

                <div class="buttonArea3" align="right">
                    <a href="<%=contextPath%>/qEnroll.co" class="fas fa-pencil-alt"> 글쓰기</a>&nbsp;
	                <a href="<%=contextPath%>/question.co?currentPage=1" class="fas fa-list"> 목록</a>
                </div><br><br>

                <script>
				
				</script>





            <!-- 댓글 영역 -->
            <div id="content_3">
                <div class="replyArea">
                    <table border="0" height="100" width="100%" align="center">
                        <h3>> 댓글 쓰기 <i class="far fa-comment-dots"></i></h3>
                        <thead>
                            <tr>
                                <td colspan="6">
                                    <textarea id="replyContent" cols="80" rows="3" style="resize:none" placeholder="댓글 등록 시 상대에 대한 비방이나 욕설은 삼가주세요 ^^."></textarea>
                                </td>
                                <td width="50" align="center"> 
                                
                                	<button onclick="addReply();" id="addReply" 
                                    		style="color:black; font-size:30px; border:rgb(250, 214, 9); cursor:pointer;"
                                    	    > <i class="fas fa-reply-all"></i>
                                    </button>
                                	
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" height="30"><b>댓글 </b></td>
                            </tr> 
                        </thead>
                        <tbody>
                         
                        </tbody>
                    </table>
               	 </div>
               	  
               	 <script>
                     $(function() {
                		
                	 	selectReplyList(); 
                			
                	 })
                	
                	 // 해당 게시글 댓글 작성용 ajax 
                	 function addReply() {
                		
                	     console.log("실행되나"); 
                		
                		 $.ajax({
                		     url:"<%=contextPath%>/replyFreeInsert.co", 
                			 type:"post",
                			 data:{
                			  	 content:$("#replyContent").val(),
                				 cno:<%=c.getCommPostNo()%>
                			 },success:function(result){
                				
                				 if(result > 0){ // 댓글 성공 
                				 	 // 갱신된 리스트 다시 조회해서 뿌려줘야 함 
                					 selectReplyList(); 
                					 $("#replyContent").val("");
                				 }
                				
                				
                			 },error:function(){
                			 	 console.log("댓글 작성용 ajax 통신 실패"); 
                			 }
                		 });
                		
                	 }
                	
                	 // 해당 게시글에 달린 댓글 리스트 조회용 ajax
                	 function selectReplyList() {
                		
                		 $.ajax({
                		 	 url:"<%=contextPath%>/replyFreeList.co", 
                			 data:{cno:<%=c.getCommPostNo()%>},
                			 success:function(list){
                				 console.log(list); 
                				
                				 var result = "";
                				 for(var i in list) {
                					 result += "<tr>"
                						     +    "<th>"  + list[i].userNo + "</th>"
                                             +    "<td>"  + list[i].replyContent + "</td>"
                                             +    "<td>"  + list[i].enrollDate + "</td>"
                                             + "</tr>";        
                				 }
                				
                				 $(".replyArea tbody").html(result); 
                				
                			 },error:function(){
                			 	 console.log("댓글 리스트 조회용 ajax 통신 실패"); 
                			 }
                		 });
                		
                	 }
                 </script>
               	 
        
         	   </div>
            </div>


            
        </div>
    </div>
</body>
</html>