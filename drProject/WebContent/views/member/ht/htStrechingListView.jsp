<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.ht.model.vo.Ht, com.dr.common.model.vo.PageInfo" %>
<%

	ArrayList<Ht> list = (ArrayList<Ht>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<style>
	.wrap{
		font-family: 'Do Hyeon', sans-serif;
	}
	.listArea{
		display: inline-block;
	}
	.pagingArea{
		text-align: right;
        width: 500px;
        display: inline-block;
        margin-right: 300px
    }	
    .thumbnail{
    	cursor:pointer;
    }
            .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:-60px;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        font-family: 'Do Hyeon', sans-serif;
    }


    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);

    }
    .footer1_2{
    	margin-right:250px;
    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
    }
</style>
</head>
<body>
   
    <div class="wrap">
     <%@ include file="../../common/menubar.jsp" %>
		<div id="content">
			<div id="content_1">
                <h1>Home<br>Training</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/allList.ht?currentPage=1">전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/bodyList.ht?currentPage=1">전신 운동</a></div>
                    <br>
					<div><a href="<%=contextPath%>/absList.ht?currentPage=1">복부 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/upperList.ht?currentPage=1">상체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/lowerList.ht?currentPage=1">하체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/strechingList.ht?currentPage=1" style="color:rgb(250, 214, 9);">스트레칭</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>HomeTraining > 스트레칭</h2>
                    <hr>
                    <p>홈트레이닝 스트레칭 조회입니다.</p>
                </div>
                <br>
				<div id="content_2_2">

					<div class="tipcategory" style="margin-left:10px">
						<select name="category">
							<option value="upload">업로드순</option>
							<option value="like">좋아요순</option>
							<option value="view">조회수순</option>
						</select>
					</div>
					
					<script>
						// 기본 상태 = 업로드순
						$(function(){
							$(".listArea").load("strechingListArea.ht?currentPage=1");
						})
					
						
						$("select[name=category]").change(function(){
							var value = ($(this).val());
							
							$.ajax({
								type:"post",
								url: "strechingListArea.ht?currentPage=1",
								dataType : "html",
								data:{
									value:value
								},success:function(){
									$(".listArea").load("strechingListArea.ht?currentPage=1");
									console.log(value);
								},error:function(){
									cosole.log("실패");
								}
							})
						})
						
						
					</script>
					
					
					<div align="center" class="searchArea">
						<form action="<%= contextPath %>/searchList.ht" method="post">
							<!-- 제목검색? -->
							<input type="text" name="searchTitle">
							<button type="submit">검색</button> 
						</form>
					</div>

					
					<br><br>
					<!-- 여기에 listArea페이징이랑, 조회한거랑 디테일뷰 스크립트가 들어옴 -->
					<div class="listArea"></div>
					<br>
				</div>
			</div>
		</div>
				<!-- footer -->
	    <div class="footerOuter">	
	            <div class="footer1">
	                <div class="footer1_1">
	                    <a href="">이용약관</a> | 
	                    <a href="">개인정보보호정책</a>
	                </div>
	
	                <div class="footer1_2" align="right">
	                    <i class="fab fa-instagram-square" fa="lg" ></i>
	                    <i class="fab fa-youtube"></i>
	                    <i class="fab fa-facebook"></i> 
	                    <i class="fas fa-arrow-up" fa="lg"></i>
	                </div>
	            </div>
	          
	            
	            <div class="footer2">
	                <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
	                    Daily Routine : DR <br>
	                    주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
	                    고객센터 및 제휴문의 : daily@routine.co.kr           
	                    <br>
	                    CopyRight 2000-2021 Daily Routine All Right Reserved
	                </p>
	            </div>
	    </div>
	</div>
</body>
</html>