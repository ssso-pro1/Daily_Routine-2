<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
		height:800px;
		margin:auto;
	}
    .outer2{
        width: 630px;
        height: 800px;
        margin: auto;
		margin-left: 50px;
    }
    .listArea{
        border: 1px solid black;
        width: 100%;
        height: 100%;
		margin: auto;
    }
    .thumbnail{
        display: inline-block;
        margin-top: 30px;
        margin-left: 18px;
        
    }
    .thumbnail p{
        width: 250px;
        text-align: left;
        margin-left: 30px;
    }
    .check{
        width: 30px;
        float: left;
    }
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 175px;
    }
    .Btns{
        width: 130px;
        text-align: right;
        float: right;
    }
	.btn1{
		margin-left: 10px;
	}

</style>
<link rel="stylesheet" href="../../../resources/css/drView.css">
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
    <div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>Home<br>Training</h1><br>
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md" >회원수정</a></div>
                    <br>
                    <div><a href="">내 글 보관함</a></div>
                    <br>
                    <div><a href="" style="color:rgb(250, 214, 9);">북마크 보관함</a></div>
                    <br>
                    <div><a href="">다이어리</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
					<div class="outer">
						<div class="outer2">
							<button id="btn1" disabled>북마크 보관함</button>
							<div class="listArea">
								<div class="thumbnail" align="center">
									<!-- 수정버튼 눌러야 등장 -->
									<div class="check">
										<input type="checkbox">
									</div>
									<img src="" width="250" height="150">
									<p>
										초보자를 위한 운동 tip! <br>
										조회수 : 20 좋아요 : 150 <br>
										2020-04-20
									</p>
								</div>
								<div class="thumbnail" align="center">
									<div class="check">
										<input type="checkbox">
									</div>
									<img src="" width="250" height="150">
									<p>
										초보자를 위한 운동 tip! <br>
										조회수 : 20 좋아요 : 150 <br>
										2020-04-20
									</p>  
								</div>
								<div class="thumbnail" align="center">
									<div class="check">
										<input type="checkbox">
									</div>
									<img src="" width="250" height="150">
									<p>
										초보자를 위한 운동 tip! <br>
										조회수 : 20 좋아요 : 150 <br>
										2020-04-20
									</p>
								</div>
								<div class="thumbnail" align="center">
									<div class="check">
										<input type="checkbox">
									</div>
									<img src="" width="250" height="150">
									<p>
										초보자를 위한 운동 tip! <br>
										조회수 : 20 좋아요 : 150 <br>
										2020-04-20
									</p>  
								</div><div class="thumbnail" align="center">
									<div class="check">
										<input type="checkbox">
									</div>
									<img src="" width="250" height="150">
									<p>
										초보자를 위한 운동 tip! <br>
										조회수 : 20 좋아요 : 150 <br>
										2020-04-20
									</p>
								</div>
								<div class="thumbnail" align="center">
									<div class="check">
										<input type="checkbox">
									</div>
									<img src="" width="250" height="150">
									<p>
										초보자를 위한 운동 tip! <br>
										조회수 : 20 좋아요 : 150 <br>
										2020-04-20
									</p>  
								</div>            
							</div>
						   
							<br>
					
							<div align="center" class="pagingArea">
								<button><</button>
								<button>1</button>
								<button>2</button>
								<button>3</button>
								<button>4</button>
								<button>5</button>
								<button>></button>
						   </div>
						   <div class="Btns">
							   <button type="reset" id="resetBtn">삭제</button>
							   <button type="submit" id="submitBtn">수정완료</button>
						   </div>
						</div>
					</div>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
