<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User, com.dr.admin.ht.model.vo.adHT"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
	
	adHT t = (adHT)request.getAttribute("t");
%>  
 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>관리자</title>

    <style>
        body{
            background-color: rgb(33, 33, 34);
        }
    .wrap{
        width:1500px;
        height:1300px;
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
        width:1500px;
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
    .outer{
        background: rgb(33, 33, 34);;
        color: white;
        width:100%;
        
       
    }
    #detail td, #detail th{
        border: 1px solid gray;
        text-align:center;
    }
    
     th{text-align: center; color: white;
       border: 1px solid rgba(126, 126, 119, 0.76);}
        
    td{border: 1px solid rgba(126, 126, 119, 0.76);}   

    a{text-decoration: none; color: black;}
    
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
                <p style="color:white;">HomeTraining 게시글</p>
                

                 <div id="content3">
                    <div class="outer" style="width: 1200px; margin-left: 20px;">
                        <table id="detail" >
                            <tr>
                                <th width="70">제목</th>
                                <td width="400"><%=t.getHtPostTitle() %></td>
                                <th>카테고리</th>
                                <td>
                                    <% if(t.getCategoryName().equals("whole")){ %>
                                            전신운동
                                    <% } else if (t.getCategoryName().equals("core")) { %>
                                            코어운동
                                    <% } else if (t.getCategoryName().equals("upper")) { %>
                                            상체운동
                                    <% } else if (t.getCategoryName().equals("lower")) { %>
                                            하체운동
                                    <% } else if (t.getCategoryName().equals("stretching")) {%>
                                            스트레칭
                                    <% } %>
                
                                </td>
                            </tr>
                            <tr>
                                
                                <th>작성일</th>
                                <td><%= t.getHtEnrollDate() %></td>
                                <th>수정일</th>
                                <td>
                                    <% if(t.getHtUpdateDate()==null) { %>
                                        <%= t.getHtEnrollDate() %>
                                    <% } else { %>
                                        <%= t.getHtUpdateDate() %>
                                    <% } %>
                                </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><%= t.getUserId() %></td>
                                <th>게시여부</th>
                                <td>
                                    <% if(t.getStatus().equals("Y")) { %>
                                        게시중
                                    <% } else { %>
                                        보류
                                    <% } %>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>썸네일이미지</th>
                                <td colspan="3">
                                    <div align="center">
                                        <img src="<%= contextPath %>/<%= t.getTitleImg() %>" width="200" height="200" alt="">
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>내용</th>
                                <td colspan="4">
                                    <p style="width:900px; height:auto;"><%= t.getHtPostContent() %></p>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="4">
                                    <button class="btn btn-warning btn-sm"><a href="<%= contextPath%>/htUpdateForm.aht?hno=<%=t.getHtPostNo() %>">수정</a></button>
                                    <button class="btn btn-secondary btn-sm" onclick ="return check();"><a href="<%= contextPath%>/htDelete.aht?hno=<%=t.getHtPostNo() %>">삭제</a></button>
                                    <button class="btn btn-secondary btn-sm"><a href="<%= contextPath%>/htList.aht?currentPage=1">목록으로</a></button>
                                </td>
                                
                            </tr>
                        </table>
                
                    </div>








						
                            
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
                
                var result = confirm("글을 등록하시겠습니까?");
                if(result){
                    
                    
                } else {
                    alert("게시글 등록이 취소되었습니다");
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