<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User, com.dr.admin.ht.model.vo.adHT"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
	
	adHT t = (adHT)request.getAttribute("t");
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


<title>ht게시글 등록</title>

<style>
    div{
        box-sizing:border-box;
    }
    .wrap{
        width:1000px;
        height:1200px;
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
    #content a:hover{color:white;}
    #content_2_1{
        color:white;
        font-size:10px;
        padding:10px;
    }
    
    #htEnroll>table>tbody>tr{
        border:1px solid white;
    }
    #htEnroll th{
        color:white;
    }
    
    #htEnroll td{
        border:1px solid white;
    }
    #category{
        color:black;
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
                   
                   <!-- 로그인 && 로그인한 아이디가 admin -->
                        
                            <a id="welcome" href="<%=contextPath%>/loginForm.aus">Welcome님</a>
                        
               
                        <div>
                          <br><br>
                           <a id="userWel" href="<%=contextPath%>/loginForm.aus"></a> 
                         
                         <!-- <i class="fas fa-bars"></i> -->
                         <a href="<%=contextPath%>"><i class="fas fa-home"></i></a>
                        </div>
                  
                        
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
                <div id="content_2_1">
                    <h2>HomeTraining </h2>
                </div>

                <hr style="border:1px solid gray">
                <p style="color:white;">HomeTraining 게시글 작성폼입니다.</p>
                

                <br>
        
        
        
                <div id="content3">
                    <form action="<%= request.getContextPath()%>/htUpdate.aht" class="updateForm" method="post" enctype="multipart/form-data">
                        <div id="htEnroll">
							
							<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
							<input type="hidden" name="hno" value="<%= t.getHtPostNo() %>">
                            <table align="center">
                                <thead>
                                    <tr>
                                        <select name="category" id="category" required>
                                            <option value="0">선택</option>
                                            <option value="whole" >전신운동</option>
                                            <option value="core">코어운동</option>
                                            <option value="upper">상체운동</option>
                                            <option value="lower">하체운동</option>
                                            <option value="stretching">스트레칭</option>
                                        </select>
                                    </tr>
                                </thead>
   
                                <tbody>
                                    <tr>
                                        <th>제목</th>
                                        <td><input type="text" name="title" style="width: 100%;" id="title" value="<%= t.getHtPostTitle() %>" required></td>
                                        
                                    </tr>
                            
                                    <tr>
                                        <th>썸네일 선택</th>
                                        <td><input type="file" name="reUpfile" id="reUpfile" onchange="loadImg(this, 1);"></td>
                                    </tr>
                                
                                    
                                    <tr> 
                                        <th>썸네일이미지(첨부파일)</th>
                                        <td>

                                            <img src="<%= contextPath %>/<%= t.getTitleImg() %>" id="titleImg" width="250" height="250">

                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <th>게시글내용</th>
                                        <td>
                                            <textarea name="content" id="summernote" cols="10" rows="" style="resize: none;" required><%= t.getHtPostContent() %></textarea>
                                        </td>     
                                    </tr>
                                    <tr>
	                                    <th>게시여부 선택</th>
	                                    <th>
	                                        <input type="radio" id="statusY" name="status" value="Y" checked><label for="statusY" >게시</label>
	                                        <input type="radio" id="statusN" name="status" value="N"><label for="statusN">보류</label>
										</th>
									</tr>	
                                </tbody>
                            </table>
						
                            

                            <script>
                               
                                function loadImg(inputFile, num){
                                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                                    // num : 몇 번째 input요소인지 확인 후 해당 그 영역에 미리보기하기 위해
                                    
                                    // 파일을 선택하는 순간 inputFile.files라는 속성배열에 0번 인덱스에 파일 담김
                                    //console.log(inputFile.files);
                                    if(inputFile.files.length == 1){ // 선택된 파일이 있을 경우
                                        // 파일을 읽어들일 FileReader 객체 생성
                                        var reader = new FileReader();
                                        // 선택된 파일을 읽어들이기
                                        // => 읽어들이는 순간 해당 그 파일만의 고유한 url부여됨
                                        reader.readAsDataURL(inputFile.files[0]);
                                        // 파일 읽어들이기가 완료된 순간 실행할 함수 정의
                                        reader.onload = function(e){
                                            // 각 영역에 맞춰서 이미지 미리보기
                                            switch(num){
                                                case 1: $("#titleImg").attr("src", e.target.result); break;
                                               
                                            }
                                        }
                                    }else{ // 선택된 파일이 사라졌을 경우
                                        switch(num){
                                            case 1: $("#titleImg").attr("src", null); break;
                                            
                                        }
                                    }
                                }
                            </script>
                            <br>
                                        
                            <div align="center"> 
                                <button type="submit" onclick="return validate();">수정</button>
                                <button onclick="return back();"><a href="<%=contextPath %>/htList.aht?currentPage=1">취소</button>
                            </div>
                                    
                                
                            
                        </div>
                    </form>
                </div>
        </div>
    </div>
 </div> 

        <script>
	        $(function(){
	    		
	    		// option요소들에 순차적으로 접근하면서 그때의 text값을 해당 이 게시글의 카테고리명과 비교
	    		// 일치할 경우 그 때의 option요소에 selected 속성 부여
	    		$(".updateForm option").each(function(){
	    			if($(this).val() == "<%= t.getCategoryName() %>"){
	    				$(this).attr("selected", true);
	    			}
	    		})
	    		
	    	})
		
        
        
        
	        $(function(){
				var status = "<%= t.getStatus()%>";
				
				
				// 체크박스인 input요소들에 순차적으로 접근하면서
				// 해당 그 input요소의 value값이 포함되어있을 경우 => 해당 input요소에 checked속성 부여
				$("input[type=radio]").each(function(){
					if(status.search($(this).val()) != -1){
						$(this).attr("checked", true);
					} 
				})
				
				
			})
        
        
        
        
        
                                
            // 게시글 작성 취소 
            function back(){
                var result = confirm("게시글 작성을 취소하시겠습니까?");
                if(result){
                    
                    return true;
                } else {
                    
                    return false;
                }
            }
            
            // 유효성 검사 
            function validate() {
                
                var category = $("#category").val();
                var title = document.getElementById("title");
                var content = document.getElementById("summernote"); 
                
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
                    
                if(!regExp.test(content.value)){ 
                    alert("내용을 입력해주세요");
                
                    content.value="";
                    content.focus();
                    
                    return false;
                }	
                
                var result = confirm("글을 수정하시겠습니까?");
                if(result){
                    
                    
                } else {
                    alert("게시글 수정이 취소되었습니다");
                    return false;
                }
                
            }
            
     
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

</body>
</html>