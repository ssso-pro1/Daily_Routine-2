<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User" %>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
%>       
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



</head>
<style>
    .outer{margin-top: 50px;}
    .outer table{margin: auto;}
</style>

<body>
   
   

    <div class="outer">
        <h2 align="center">공지사항 작성페이지</h2>

        <form action="<%= contextPath %>/insert.no" method="POST">
            
            <table border="1">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" size="30" placeholder="제목을 입력하세요" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        
                        <div class="container">
                            <textarea name="content" id="summernote" value=""></textarea>    
                        </div>
                    
                    
                    </td>
                </tr>
            </table>

            <br>
            <div align="center">
                <button type="submit">등록</button>
                <button type="reset">취소</button>
            </div>
        </form>
    </div>




    
    <script>
        $(document).ready(function() {

            var toolbar = [
                    // 글꼴 설정
                    ['fontname', ['fontname']],
                    // 글자 크기 설정
                    ['fontsize', ['fontsize']],
                    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                    ['style', ['bold', 'italic', 'underline','strikethrough']],
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
                ];

           
            
                $('#summernote').summernote(setting);
                });
        
                
        function sendFile(file, el) {
            var form_data = new FormData();
            form_data.append('file', file);
            $.ajax({
              data: form_data,
              type: "POST",
              url: '/image',
              cache: false,
              contentType: false,
              enctype: 'multipart/form-data',
              processData: false,
              success: function(url) {
                $(el).summernote('editor.insertImage', url);
                $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
              }
            })
        }


      
     </script>


</body>
</html>