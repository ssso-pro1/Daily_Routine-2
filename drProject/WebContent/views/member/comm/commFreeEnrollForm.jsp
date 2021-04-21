<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.Comm"%>
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
    .line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px; 
    }

    #content_2_1{height:15%;}
    #content_2_2{height:70%; margin-left:48px;}
    
    #enrollForm input, #enrollForm textarea{
        width:100%;
        box-sizing:border-box;
    }
    .enrollArea{
        right:500px;
    }
    .enrollButton>button{
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

            <!--왼쪽 공통메뉴-->
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

            
            <!-- 게시글 작성 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 자유게시판</h2>
                    <hr>
                    <p>Daily Routine 회원들과 자유롭게 다양한 얘기를 나눠보세요!</p>
                </div><br>
              

                <!-- 게시글 작성 폼 -->
                <div id="content_2_2">
                    <div class="enrollArea">
                       <form action="<%=contextPath%>/freeInsert.co" id="enrollForm" method="post" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="700" height="30">
                                                <input type="text" name="title" placeholder="제목을 입력해주세요." required>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="800" height="30">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                    </td>
                                                    <td>
                                                    	<!--  버튼 클릭 시 파일 삭제 -->
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button>
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="500">
                                                <textarea name="content" rows="20" style="resize:none" placeholder="내용을 입력해주세요." required></textarea>   
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                            </table><br><br>
                          	
                            <br><br>
                            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                            <input type="hidden" name="commNo" value="2">
                            
                            <div align="right" class="enrollButton">
		                        <button type="submit">등록</button>
		                        <button type="reset">취소</button>
                 		    </div>
                 		    
                 		    <script>
                 		    
                 		    	// 유효성 체크 
                 		    	
                 		    </script>
                 		    
                        </form>
            		</div>
       			</div> 
    		</div>


    	</div>
	</div>
</body>
</html>