<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.*, com.dr.member.user.model.vo.User" %>
<%
    Comm c = (Comm)request.getAttribute("c"); 
    // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일, 조회수

    CommFile cf = (CommFile)request.getAttribute("cf"); 
    // null 
    // 파일번호, 원본명, 수정명, 저장경로 
    
    User loginUser = (User)session.getAttribute("loginUser");	

	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
  <!-- include libraries(jQuery, bootstrap) -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
  <!-- include summernote css/js-->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

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
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
    }
    
    
    <!-- 메뉴바 --> 
    .outerWrap>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
    }

    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;
        display:block;
        
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 150px;
    }
    .menu a{
        text-decoration:none;
        color:black;
        font-size:20px;
        line-height:50px;
        font-weight:bold;
        display:block;
        width:100%;
        height:100%;
    }
    .outerWrap a:hover{
        color:darkorchid
	}

    .line1{
        border-left:1px solid gray;
    }
    
    
</style>
</head>
<body>

	 <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

      <div class="outerWrap">
        <p align="center">Reading is to the mind what exercise is to the body</p>
        

        <div class="loginArea">
        <!-- 로그인 전에 보여지는 로그인 버튼 -->
        
	        <% if(loginUser == null){ %>
	
	        <table id="topMenu1" align="right">
	            <tr>
	                <th><a href="<%=contextPath%>/loginForm.us">로그인</a></th>
	                <th>|</th>
	                <th><a href="<%=contextPath%>/enrollForm1.us">회원가입</a></th>
	                <th>|</th>
	                <th><a href="<%=contextPath%>/main.ct">고객센터</a></th>
	            </tr>
	            <tr>
	                <th colspan="3">Welcome DR님</th>
	                <th colspan="2"><i class="fas fa-user-circle" fa="lg"></i></th>
	            </tr>
	        </table>
	        
	        
	        <% }else { %>
        
       		<!-- 로그인 후 -->
        	
        	<table id="topMenu2" align="right">
	            <tr>
	                <th><a href="<%=contextPath%>/logout.us">로그아웃</a></th>
	                <th>|</th>
	                <th><a href="<%=contextPath%>/main.ct">고객센터</a></th>
	            </tr>
	            <tr>
	                <th colspan="3"><b><%= loginUser.getUserName() %>님</b> 환영합니다.</th>
	                <th><i class="fas fa-user-circle" fa="lg"></i></th>
	            </tr>
	        </table>
	        
	        <% } %>
        	
    </div>

    <br><br>
    <span class="navWrap" align="center">
        <div class="menu"><a href="<%=contextPath%>">메인페이지</a></div>
        <div class="menu"><a href="<%=contextPath%>/allList.ht">HomeTraining</a></div>
        <div class="menu"><a href="<%=contextPath%>/commMain.co?currentPage=1">Community</a></div>
        <div class="menu"><a href="<%=contextPath%>/infoMain.in?currentPage=1">Info&Tip</a></div>
        <div class="menu"><a href="<%=contextPath%>/myPage.md">My D.R.</a></div>

        <span class="line1"></span>

    <hr>
    </span>
    
	</div> 
  
    
    
    
    
    
    <div class="wrap">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
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


            <!-- 게시글 수정 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div><br>


                <!-- 게시글 수정 폼 -->
                <div id="content_2_2">
                    <div class="updateArea">
                        <form action="<%=contextPath%>/tipUpdate.co" id="updateForm" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="cno" value="<%=c.getCommPostNo()%>">
                            <table align="center">
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="100">
                                                <select name="category" required>
                                                    <option value="식단공유">[식단공유]</option>
                                                    <option value="운동tip">[운동tip]</option>
                                                </select>
                                                <script>
                                                    $(function(){
                                                        $("#updateForm option").each(function() { 
                                                            if($(this).text() == "<%=c.getCategoryName()%>") {
                                                                $(this).attr("selected", true); 
                                                            }
                                                        })
                                                    })
                                                </script>
                                            </td>
                                            <td width="800" height="30">
                                                <input type="text" name="title" id="title" value="<%=c.getPostTitle()%>" required>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="100%" height="30">
                                                        <input type="file" name="reUpfile" style="cursor:pointer;">
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
                                                <textarea class="summernote" name="tContent" id="tContent" rows="20" style="resize:none" required><%=c.getPostContent()%></textarea>   
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                                <div align="right" class="updateArea">
			                   	<button type="submit" onclick="return validate();">등록</button>
			               		</div>
                            </table><br><br>
                            
                          
			               	
			               	
			               	<script>      
								$('.summernote').summernote({
									// 에디터 높이
	                                   height: 300,
	                                // 에디터 한글 설정
	                                   lang: "ko-KR",
	                                // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	                                   focus : true,
	                                   toolbar: [
	                                          // 글꼴 설정
	                                          ['fontname', ['fontname']],
	                                          // 글자 크기 설정
	                                          ['fontsize', ['fontsize']],
	                                          // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	                                          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	                                          // 글자색
	                                          ['color', ['forecolor','color']],
	                                          // 표만들기
	                                          ['table', ['table']],
	                                          // 글머리 기호, 번호매기기, 문단정렬
	                                          ['para', ['ul', 'ol', 'paragraph']],
	                                          // 줄간격
	                                          ['height', ['height']],
	                                          // 그림첨부, 링크만들기, 동영상첨부
	                                          ['insert',['picture','link','video']],
	                                          // 코드보기, 확대해서보기, 도움말
	                                          ['view', ['codeview','fullscreen', 'help']]
	                                        ],
	                                        // 추가한 글꼴
	                                      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	                                       // 추가한 폰트사이즈
	                                      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
									
								});	
                                </script>
			               	
			               	
			               	
			               	
			               	
			               	
			               		<script>
			               			
			               			// 유효성 검사 
				               		function validate() {
				               			
				               			var category = $("#category").val();
				               			var title = document.getElementById("title");
	                            		var tContent = document.getElementById("tContent"); 
	                            		
	                            		var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자이상 등록
	                            		
	                            		
	                            		if(category=="0"){
                                			alert("카테고리를 선택해주세요"); 
                                			
                                			return false;
                                			
                                		}
	                            		
	                            		if(!regExp.test(title.value)){
	                                		alert("제목을 입력해주세요");
	                                	
	                                		title.value="";
	                                		title.focus();
	                                		
	                                		return false;
	                                	}
	                            			
	                            		if(!regExp.test(tContent.value)){ 
	                                		alert("내용을 입력해주세요");
	                                	
	                                		tContent.value="";
	                                		tContent.focus();
	                                		
	                                		return false;
	                                	}	
	                            		
	                            		var result = confirm("게시글 수정을 완료하시겠습니까?");
	                                	if(result){
	                                		
	                                		
	                                	} else {
	                                		alert("게시글 수정이 취소되었습니다");
	                                		return false;
	                                	}
				               		}
				               	
			               	
			               	</script>
			               	
			               	
			               	
			               	
                        </form>
                        
                    </div>
                </div>
            </div>


        </div>    
    </div>
</body>
</html>