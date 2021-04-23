<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.Comm" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



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
        background:rgb(250, 214, 9);;
        color:white;
        border:rgb(250, 214, 9);;
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

            
            <!-- 게시글 작성 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div><br>

                
                <!-- 게시글 작성 폼 -->
                <div id="content_2_2">
                    <div class="enrollArea">
                       <form action="<%=contextPath%>/tipInsert.co" id="enrollForm" method="post" enctype="multipart/form-data">
                            <table align="center">
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="100">
                                                <select name="category" required>
                                                    <option value="식단공유">[식단공유]</option>
                                                    <option value="운동tip">[운동tip]</option>
                                                </select>
                                            </td>
                                            <td width="800" height="30">
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
                                                    	<!-- 버튼 클릭 시 파일 삭제 -->
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button><br>
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="500">
                                                <div class="summernote"></div>    
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                            </table><br><br>
                            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
							<br><br>

                            <div align="right" class="enrollButton">
                                <button type="submit" onclick="return validate();">등록</button>
                                <button type="reset">취소</button>
                            </div>

							<script>
                 		    
                 		    	// 유효성 체크 
                 		    	
                 		    
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






                 		    
                        </form>  
                    </div>
                </div>
            </div>


        </div> 
    </div>
</body>
</html>