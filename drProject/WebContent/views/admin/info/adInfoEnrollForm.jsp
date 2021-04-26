<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<title>공지사항</title>

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
                    <h2>게시물관리 > info&tip 관리</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">





            <!--info-->
            <div id="content_2_3">    
                <p style="font-size: 20px; color: white; font-weight: 600;">info&tip 관리 > 새 글 등록</p>
                <div class="underLine"></div>
            </div>


            <!--info 글쓰기폼-->
            <div id="content_2_4" style="background: white; width: 800px; height: 6000px;">

                
                  
                    
                    
                <form action="<%= contextPath %>/infoInsert.ad" id="enrollForm" method="post" enctype="multipart/form-data">
                
                	<div id="infoEnroll">
                    
                        <table border="1" align="center" >
                            <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="infoTitle" id="title" style="width: 80%;" required></td>
                                </tr>
                                
                                <!--  
                                <tr>
                                    <th>작성자</th>
                                    <td><input type="text" name="noticeWriter" required></td>
                                </tr>
                                -->
                            
                                <tr>
                                    <th>내용</th>
                                    <td>
	                                    <textarea name="infoContent" id="summernote" cols="10" rows="" style="resize: none;"></textarea>    
				                    </td>
                                </tr>
                                <tr>
                                    <th>썸네일 선택</th>
                                    <td colspan="3">
                                        <input type="file" name="upfile" id="upfile" onchange="loadImg(this, 1);" required>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>썸네일</th>
                                    <td colspan="3" align="center">
                                        <!--대표이미지 미리보기할 img-->
                                        <img id="titleImg" width="250" height="170">
                                    </td>
                                </tr>

                            </tbody>
                            <tfoot>
                            	<tr>
                            		<th>카테고리 선택</th>
                            		<td>
                            			<input type="radio" id="workout" name="category" value="1" checked><label for="workout">운동정보</label>
                                        <input type="radio" id="meal" name="category" value="2"><label for="meal">식단정보</label>
                            		
                            		</td>
                            
                            	</tr>
                                <tr>
                                    <th>게시여부 선택</th>
                                    <th>
                                        <input type="radio" id="statusY" name="status" value="Y" checked><label for="statusY" >게시</label>
                                        <input type="radio" id="statusN" name="status" value="N"><label for="statusN">보류</label>
                                        
                                        <label style="float: right;">
                                        
                                        <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                                        
                                        <button type="submit" onclick="return validate();">등록</button>
                                        <button onclick="return back();"><a href="<%=contextPath %>/info.ad?currentPage=1">취소</button>
                                        </label>
                                    </td>
                                </tr>
                            </tfoot>
                            
                        </table>


					</div>

                  </form>
                  
                  <script>
                  
                  //취소버튼 눌렀을 때
                  function back(){
                    var result = confirm("게시글 작성을 취소하시겠습니까?");
                    if(result){
                                    		
                      return true;
                      } else {
                                    		
                    return false;
                       }
                    }
                        
                   // 글 제목 50글짜 이상 입력방지 , 알러트
                   $(document).ready(function(){
					   $("#title").on("keyup", function(){
                                            
						if($(this).val().length>50){
							$(this).val($(this).val().substring(0, 50));
                                alert("50자이상 입력하실 수 없습니다.");
							        }
							 });
						});

					// 글 내용 5000자 이상 입력 방지, 알러트
                    $(document).ready(function(){
						$("#summernote").on("keyup", function(){
                        //var inputlength=$(this).val().length;
                        //var remain = 450-inputlength;

						if($(this).val().length>5000){
							  $(this).val($(this).val().substring(0, 5000));
                                   alert("5000자이상 입력하실 수 없습니다.");
							       }
							  });
					 });                 

                                    
                                    
                                    
                                    
                    // 글등록 유효성 체크
                    function validate(){
                                    	
                       var title = document.getElementById("title");
                       var content = document.getElementById("summernote");
                                        
                       var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자이상 등록
                                    	
                                    	
                                    	
                                    	
                                    	
                       if(!regExp.test(title.value)){
                           alert("제목을 입력해주세요");
                                    	
                           title.value="";
                           title.focus();
                                    		
                           return false;
                        }
                                    	
                                    	
                                        
                       if(!regExp.test(content.value)){ 
                            alert("내용을 입력해주세요");
                                    	
                            content.value="";
                            content.focus();
                                    		
                            return false;
                        }
                                    	
                                        

                                    	
                       var result = confirm("글을 등록하시겠습니까?");
                           if(result){
                                    		
                       } else {
                            alert("게시글 등록이 취소되었습니다");
                             return false;
                       }

                       }
                                    
                   </script>
                               
               
               
	               <script>
	
	               
	
	                function loadImg(inputFile, num){
	                    // inputFile : 현재 변화가 생긴 input type="file"요소 객체
	                    // num : 몇번째 input요소인지 확인 후 해당 그 영역에 미리보기하기위해
	
	                    // 파일을 선택한느 순간 inputFile.files라는 속성배열에 0번  인덱스에 파일 담김
	                    if(inputFile.files.length == 1){ // 선택된 파일이 있을경우
	
	                        // 파일을 읽어들일 FileReader 객체 생성
	                        var reader = new FileReader();
	
	                        //  선택된 파일을 읽어들이기
	                        // => 읽어들이는 순간 해당 그 파일만의 고유한 url부여됨
	                        reader.readAsDataURL(inputFile.files[0]);
	
	                        // 파일 읽어들이기가 다 완료된 순간 실행할 함수 정의
	                        reader.onload = function(e){
	                            // 각 영역에 맞춰서 이미지 미리보기
	                            switch(num){
	                                case 1 : $("#titleImg").attr("src", e.target.result); break;
	                                
	                            }
	
	                        }
	
	                    }else{ // 선택된 파일이 사라졌을 경우
	                        switch(num){
	                                case 1 : $("#titleImg").attr("src", null); break;
	                               
	                            }
	
	                    }
	
	
	                }
	            </script>
                  
                <script>
                    $('#summernote').summernote({
                          // 에디터 높이
                          height: 350,
                          // 에디터 한글 설정
                          width:700,
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
                               
                              ],
                              // 추가한 글꼴
                            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                             // 추가한 폰트사이즈
                            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                            
                        });
                    </script>
        
        
        


      
     

                  
                  
                  
                  
                  
                  
                  
			</div>    

            

         </div>


</div>




</body>
</html>