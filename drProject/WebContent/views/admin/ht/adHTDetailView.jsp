<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.admin.user.model.vo.AdUser"%>
<%
	AdUser loginUser = (AdUser)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지- 좌측 메뉴바</title>
    <!-- jQuery library-->
    <script src="https://ajax.googleeapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
      

        .outer{
            background: rgb(33, 33, 34);;
            color: white;
            width:1000px;
            height:800px;
            margin:auto;
            margin-top:50px;

        }

        #content_2_2 td, #content_2_2 th{
            border: 1px solid gray;
            text-align:center;
        }
        
        
    </style>
</head>
<body>
	
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <%@include file = "../adminPageLeftMenuBar.jsp"%>

    <div class="outer">
        <table id="content_2_2" align="center">
            <tr>
                <th width="70">제목</th>
                <td width="500">xxxxxxxx</td>
                <th>작성자</th>
                <td>xxx</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>xx</td>
                <th>수정일</th>
                <td>xxxx-xx-xx</td>
            </tr>
            
            <tr>
                <th>썸네일이미지</th>
                <td colspan="3">
                    <div align="center">
                        <img src="//xxx.jpg" width="500" height="300" alt="">
                    </div>
                </td>
            </tr>
            <tr>
                <th>상세사진</th>
                <td colspan="3">
                    <div align="center">
                        <img src="//xxx.jpg" width="200" height="150" alt="">
                        <img src="//xxx.jpg" width="200" height="150" alt="">
                        <img src="//xxx.jpg" width="200" height="150" alt="">
                    </div>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="4">
                    <p style="height:50px;">xxxxxxxxxxxxxxxxxxx</p>
                </td>
            </tr>
        </table>
    </div>


        </div>


</body>
</html>