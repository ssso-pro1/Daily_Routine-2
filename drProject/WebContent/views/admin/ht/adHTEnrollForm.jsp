<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.admin.user.model.vo.AdUser"%>
<%
	AdUser loginUser = (AdUser)session.getAttribute("loginUser");
	
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
                <div id="content_2_1">
                    <h2>HomeTraining </h2>
                </div>

                <hr style="border:1px solid gray">
                <p style="color:white;">HomeTraining 게시글 작성폼입니다.</p>
                

                <br>
        
        
        
                <div id="content3">
                    <form action="<%= request.getContextPath()%>/htInsert.aht" class="enrollForm" method="post" enctype="multipart/form-data">
                        <div id="htEnroll">
							
							<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
                            <table align="center">
                                <thead>
                                    <tr>
                                        <select name="categoryName" id="categoryName" required>
                                            <option name="categoryName" value="전체" selected >전체</option>
                                            <option name="categoryName" value="전신운동">전신운동</option>
                                            <option name="categoryName" value="코어운동">코어운동</option>
                                            <option name="categoryName" value="상체운동">상체운동</option>
                                            <option name="categoryName" value="하체운동">하체운동</option>
                                            <option name="categoryName" value="스트레칭">스트레칭</option>
                                        </select>
                                    </tr>
                                </thead>
    <!-- 카테고리명, 제목, 내용, 첨부파일, URL -->
                                <tbody>
                                    <tr>
                                        <th>제목</th>
                                        <td><input type="text" name="htPostTitle" style="width: 100%;" id="title" required></td>
                                        <!-- 초보자도 쉽게하는 어깨 이완 -->
                                    </tr>
                            
                                    <tr>
                                        <th>영상 첨부</th>
                                        <td><input type="text" name="videoLink" style="width: 100%;" required></td>
                                    </tr>
                                
                                    
                                    <tr> 
                                        <th>썸네일이미지(첨부파일)</th>
                                        <td>

                                            <!-- <img type="file" name="fileNo" id="titleImg" width="250" height="250" src="http://img.youtube.com/vi/xpzMr3nSOIE/maxresdefault.jpg"> -->
                                            <img type="file" id="titleImg" width="250" height="250" src="">

                                            <!-- <input type="file" name="fileNo" style="width: 100%;"> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <!--간략설명, 권장사항, 운동방법, 운동주의사항 + thumbnail?? + 영상첨부??-->
                                        <th>게시글내용</th>
                                        <td>
                                            <textarea name="htPostContent" class="summernote" cols="10" rows="" style="resize: none;">  
                                                <!-- <td><img id="contentImg1" width="150" height="150" src=""></td> -->
                                                <!-- <img type="file" name="fileNo" id="titleImg" width="250" height="250" src="http://img.youtube.com/vi/xpzMr3nSOIE/maxresdefault.jpg"> -->
                                                <td><img id="contentImg1" width="150" height="120"></td>
                                                <td><img id="contentImg2" width="150" height="120"></td>
                                                <td><img id="contentImg3" width="150" height="120"></td>
                                            </textarea>
                                        </td>     
                                    </tr>

                                </tbody>
                            </table>
						
                            <div id="fileArea">
                                <input type="file" name="file1" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                                <input type="file" name="file2" name="file2" id="file2" onchange="loadImg(this, 2);">
                                <input type="file" name="file3" name="file3" id="file3" onchange="loadImg(this, 3);">
                                <input type="file" name="file4" name="file4" id="file4" onchange="loadImg(this, 4);"> 
                            </div>

                            <script>
                                /*
                                 $(function(){
                                    $("#fileArea").hide();
                                    
                                    $("#titleImg").click(function(){
                                        $("#file1").click();
                                    });

                                    $("#contentImg1").click(function(){
                                        $("#file2").click();
                                    });

                                    $("#contentImg2").click(function(){
                                        $("#file3").click();
                                    });

                                    $("#contentImg3").click(function(){
                                        $("#file4").click();
                                    });
                                    
                                })*/

                                function loadImg(inputFile, num){
                                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                                    // num : 몇 번째 input요소인지 확인 후 해당 그 영역에 미리보기하기 위해
                                    
                                    // 파일을 선택하는 순간 inputFile.files라는 속성배열에 0번 인덱스에 파일 담김
                                    console.log(inputFile.files);
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
                                                case 2: $("#contentImg1").attr("src", e.target.result); break;
                                                case 3: $("#contentImg2").attr("src", e.target.result); break;
                                                case 4: $("#contentImg3").attr("src", e.target.result); break;
                                            }
                                        }

                                    }else{ // 선택된 파일이 사라졌을 경우

                                        switch(num){
                                            case 1: $("#titleImg").attr("src", null); break;
                                            case 2: $("#contentImg1").attr("src", null); break;
                                            case 3: $("#contentImg2").attr("src", null); break;
                                            case 4: $("#contentImg3").attr("src", null); break;
                                        }
                                    }
                                }
                            </script>
                            <br>
                                        
                            <div align="center"> 
                                <button type="submit" onclick="return validate();"><a href="<%= request.getContextPath()%>/htListView.aht"></a>등록</button>
                                <button onclick="return back();"><a href="<%=contextPath %>/htList.aht?currentPage=1">취소</button>
                            </div>
                                    
                                
                            
                        </div>
                    </form>
                </div>
        </div>
    </div>
 </div> 

        <script>
                                
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
                
                var result = confirm("글을 등록하시겠습니까?");
                if(result){
                    
                    
                } else {
                    alert("게시글 등록이 취소되었습니다");
                    return false;
                }
                
            }
            
     
        $('.summernote').summernote({
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