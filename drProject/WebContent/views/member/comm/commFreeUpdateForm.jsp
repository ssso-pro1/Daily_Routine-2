<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.*"%>
<%
    Comm c = (Comm)request.getAttribute("c"); 
    // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일, 조회수

    CommFile cf = (CommFile)request.getAttribute("cf"); 
    // null 
    // 파일번호, 원본명, 수정명, 저장경로 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_1{height:15%;}
    #content_2_2{height:60%; margin-left:48px;}

    #updateForm input, #updateForm textarea{
        width:100%;
        box-sizing:border-box;
    }
    .updateArea{
        right:500px;
    }
    .updateArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    div>button{
        cursor:pointer;
    }
    .leftMenu>#menu2>a{
    	color:rgb(250, 214, 9);
    }
</style>
</head>
<body>

    <%@ include file="../../common/menubar.jsp"%>


    <div class="wrap">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div id="menu2"><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>
       
            <div id="line"></div>


            <!-- 게시글 수정 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 자유게시판</h2>
                    <hr>
                    <p>Daily Routine 회원들과 자유롭게 다양한 얘기를 나눠보세요!</p>
                </div><br>

        
                <!-- 게시글 수정 폼 -->
                <div id="content_2_2">
                    <div class="updateArea">
                        <form action="<%=contextPath%>/freeUpdate.co" id="updateForm" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="cno" value="<%=c.getCommPostNo()%>">
                            <table>
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="700" height="30">
                                                <input type="text" name="title" value="<%=c.getPostTitle()%>" required>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="800" height="30">
                                                        <input type="file" name="upfile" style="cursor:pointer;"> 
                                                   		<!-- 기존의 첨부파일이 있었다면 -->
                                                        <% if(cf != null) { %>
                                                            <%=cf.getFileName() %>
                                                            <input type="hidden" name="originFileNo" value="<%=cf.getFileNo()%>">
                                                            <input type="hidden" name="originFileName" value="<%=cf.getFileUpdate()%>">
                                                        <% } %>   
                                                    </td>
                                                    <td>
                                                    	<!-- 버튼 클릭 시 파일 삭제 -->
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button>       
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="500">
                                                <textarea name="content" rows="20" style="resize:none" required><%=c.getPostContent()%></textarea>   
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                            </table><br><br>
                            
                            <div align="right" class="updateArea">
                        		<button type="submit">등록</button>
                    		</div>
                    		
                        </form>
                        
					</div>
                </div>
  	        </div>


  	    </div>
    </div>
</body>
</html>