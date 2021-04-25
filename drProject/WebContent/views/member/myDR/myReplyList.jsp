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
        width: 620px;
        height: 100px;
        margin: auto;
		margin-left: 50px;
    }
	.outer3{
        width: 620px;
        height: 465px;
        margin: auto;
		margin-left: 50px;
    }
    .listArea{
        border: 1px solid black;
        width: 100%;
        height: 100%;
    }
    .pagingArea{
		width: 650px;
        display: inline-block;
		margin:auto;
		margin-left: 50px;
    }

	#btn1{
		margin-left: 50px;
	}
	#btn3{
		margin-left: 50px;
	}
</style>
<link rel="stylesheet" href="../../../resources/css/drView.css">
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
	<div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md" >회원수정</a></div>
                    <br>
                    <div><a href="" >내 글 보관함</a></div>
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
						<button id="btn1" disabled>내 글 보관함</button>
						<fieldset class="outer2">
							<div class="postCount">
								<p><h2>내가 쓴 글</h2></p>
								<div>
									<h3>23</h3>
								</div>
							</div>
							<div id="line2"></div>
							<div class="replyCount">
								<p><h2>내가 쓴 댓글</h2></p>
								<div>
									<h3>23</h3>
								</div>
							</div>

						</fieldset>
						<br><br><br>
						<button id="btn3">내가 쓴 글</button>
						<button id="btn2">내가 쓴 댓글</button>
						<fieldset class="outer3">
							<div class="postListArea">
								<div class="postList">
									<!-- 글 제목 (댓글 개수)-->
									<p id="p1">운동 싫어요 귀찮아요 증말증말증말루 (12)</p>
									<!-- 쓴 날짜-->
									<p id="p1">2021.03.24</p>
									<hr>
								</div>
								<div class="postList">
									<!-- 글 제목 (댓글 개수)-->
									<p id="p1">운동 싫어요 귀찮아요 증말증말증말루 (12)</p>
									<!-- 쓴 날짜-->
									<p id="p1">2021.03.24</p>
									<hr>
								</div>
								<div class="postList">
									<!-- 글 제목 (댓글 개수)-->
									<p id="p1">운동 싫어요 귀찮아요 증말증말증말루 (12)</p>
									<!-- 쓴 날짜-->
									<p id="p1">2021.03.24</p>
									<hr>
								</div>
								<div class="postList">
									<!-- 글 제목 (댓글 개수)-->
									<p id="p1">운동 싫어요 귀찮아요 증말증말증말루 (12)</p>
									<!-- 쓴 날짜-->
									<p id="p1">2021.03.24</p>
									<hr>
								</div>
								<div class="postList">
									<!-- 글 제목 (댓글 개수)-->
									<p id="p1">운동 싫어요 귀찮아요 증말증말증말루 (12)</p>
									<!-- 쓴 날짜-->
									<p id="p1">2021.03.24</p>
									<hr>
								</div>
								<div class="postList">
									<!-- 글 제목 (댓글 개수)-->
									<p id="p1">운동 싫어요 귀찮아요 증말증말증말루 (12)</p>
									<!-- 쓴 날짜-->
									<p id="p1">2021.03.24</p>
									<hr>
								</div>	
							</div>

							
							
						</fieldset>
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
						   
						</div>
					</div>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
