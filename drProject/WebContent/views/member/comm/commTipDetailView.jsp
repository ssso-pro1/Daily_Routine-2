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
<title>커뮤니티 > 나만의운동팁 게시글 상세조회</title>
<style>
    div{
        box-sizing:border-box
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
    #content_3{margin-left:48px;}
    
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_1{height:10%;}
    #content_2_2{height:40%; margin-left:48px;}
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
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    } 
</style>
</head>
<body>
	
	<%@ include file="../../common/menubar.jsp"%>
	

    <div class="wrap">

        <div id="content">

             <!--왼쪽 공통메뉴-->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>

            <div id="line"></div>


            <!-- 게시글 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div>
                <br>

				<!-- 로그인되어있고, 로그인한 사용자가 게시글일 경우 보이는 버튼 -->
				<% if(loginUser != null && loginUser.getUserId().equals(c.getUserNo()))  { %>
               	<div class="buttonArea1" align="right">
	                <a href="<%=contextPath%>/tipUpdateForm.co?cno=<%=c.getCommPostNo()%>" class="fas fa-edit">수정</a>
	                <a href="<%=contextPath%>/tipDelete.co?cno=<%=c.getCommPostNo()%>" class="fas fa-trash-alt">삭제</a>
                </div><br><br>
                <% } %>
              

                <!-- 게시글 세부 영역 -->
                <div id="content_2_2">
                    <div class="detailArea">
                        <table border="1" height="100%">
                            <tr align="center" height="40px;">
                                <th width="10%"><%=c.getCategoryName()%></th>
                                <th width="48%"><%=c.getPostTitle()%></th>
                                <th width="10%"><%=c.getUserNo()%>님</th>
                                <th width="15%"><%=c.getEnrollDate()%></th>
                                <th width="12%">조회수 : <%=c.getBoardView()%></th>
                            </tr>
                            <tr align="left">
                                <td colspan="6" height="100%">
                                    <p style="margin-bottom:250px;"><%=c.getPostContent()%></p>
                                </td>
                            </tr>
                            <tr>
                            	<td colspan="6">
	                            	<% if(cf == null) { %>
	                            		첨부파일이 없습니다. 
	                            	<% }else { %>
	                                	첨부파일 > <a download ="<%=cf.getFileName() %>" href="<%=contextPath%>/<%=cf.getFilePath() + cf.getFileUpdate()%>"><%=cf.getFileName()%></a>
	                                <% } %>	
                                </td>        
                            </tr>
                        </table><br>
                    </div>
                </div><br><br>


                <!-- 게시글 버튼 영역-->
                <div class="buttonArea2" align="right">
                    좋아요 <i id="like" class="far fa-heart" onclick="like();"></i>
                    신고 <i id="report" class="fas fa-bullhorn" onclick="report();"></i>
                </div><br><br>

                <div class="buttonArea3" align="right"> 
	                <a href="<%=contextPath%>/tipEnroll.co" class="fas fa-pencil-alt"> 글쓰기</a>
	                <a href="<%=contextPath%>/commMain.co?currentPage=1" class="fas fa-list"> 목록</a>
                </div><br><br>

				<script>
					function like(){
						var like = document.getElementById('like').className;
						if(like == 'fas fa-heart'){ // 좋아요 취소 (까만 하트 => 빈 하트)
							document.getElementById('like').className = 'far fa-heart';
							$.ajax({
								type:"post",
								url: "좋아요 서블릿",
								data:{
									userId:유저아이디,
									postNo:게시판 번호
								}
								success:function({		
								})	
							})
							
						}else{ // 좋아요 (빈 하트 => 까만 하트)
							document.getElementById('like').className = 'fas fa-heart';
						}
					}
				</script>
				
				
				
				
				
            <!-- 댓글 영역 -->
            <div id="content_3">
                <div class="replyArea">
                    <table border="0" height="100" width="100%" align="center">
                        <h3>> 댓글 쓰기</h3>
                        <thead>
                            <tr>
                                <td colspan="6">
                                    <textarea id="replyContent" cols="80" rows="3" style="resize:none" placeholder="댓글 등록 시 상대에 대한 비방이나 욕설은 삼가주세요 ^^."></textarea>
                                </td>
                                <td width="50"> 
                                    <button onclick="addReply();" style="color:white; background:rgb(250, 214, 9); border:rgb(250, 214, 9); cursor:pointer;">댓글<br>등록</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" height="30"><b>댓글 </b>1</td>
                            </tr> 
                        </thead>
                        <tbody>
                            <tr>
                                <th width="50">헬스맨</th>
                                <td width="200">댓글내용</td>
                                <td width="50">20-02-02</td>
                                <td width="25"><button style="cursor:pointer";>수정</button></td>
                                <td width="25"><button style="cursor:pointer";>삭제</button></td>
                                <td width="50"><button style="cursor:pointer";>좋아요</button> 20</td>
                                <td width="70"><button style="cursor:pointer";>신고</button> 0</td>
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                
                
            </div>
          </div>



        </div>
    </div>
</body>
</html>