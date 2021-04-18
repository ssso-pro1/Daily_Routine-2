<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/htView.css">
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <div class="wrap">
		<div id="content">
			<div id="content_1">
                <h1>Home<br>Training</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/workoutTip.co" >전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co" >코어 운동</a></div>
                    <br>
					<div><a href="<%=contextPath%>/free.co">전신 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co">상체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co">하체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co" style="color:rgb(250, 214, 9);">스트레칭</a></div>
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
                <br><br><br>
				<div id="content_2_2">
					<div class="tipcategory" style="margin-left:10px">
						<select name="category">
							<option value="upload">업로드순</option>
							<option value="like">좋아요순</option>
							<option value="view">조회수순</option>
						</select>
					</div>
					<div align="center" class="searchArea">
						<input type="text">
						<button>검색</button> 
					</div>
					<br><br>
			
					<div class="listArea">
						<div class="thumbnail" align="center">
							<img src="" width="230" height="150">
							<p>
								초보자를 위한 트레이닝<br>
								조회수 : 20 좋아요 : 150 <br>
								2020-04-20
							</p>
						</div>
						<div class="thumbnail" align="center">
							<img src="" width="230" height="150">
							<p>
								30분 복부 운동 <br>
								조회수 : 20 좋아요 : 150 <br>
								2020-04-20
							</p>
						</div>
						<div class="thumbnail" align="center">
							<img src="" width="230" height="150">
							<p>
								7분 스트레칭 <br>
								조회수 : 20 좋아요 : 150 <br>
								2020-04-20
							</p>
						</div>
						<div class="thumbnail" align="center">
							<img src="" width="230" height="150">
							<p>
								15분 힙업 운동 <br>
								조회수 : 20 좋아요 : 150 <br>
								2020-04-20
							</p>
						</div>
						<div class="thumbnail" align="center">
							<img src="" width="230" height="150">
							<p>
								복부 지방 태우기<br>
								조회수 : 20 좋아요 : 150 <br>
								2020-04-20
							</p>
						</div>
						<div class="thumbnail" align="center">
							<img src="" width="230" height="150">
							<p>
							10분 몸풀기<br>
								조회수 : 20 좋아요 : 150 <br>
								2020-04-20
							</p>
						</div>
						<br><br>
						<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
						<!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
						<div align="center" class="pagingArea">
							<button><</button>
							<button>1</button>
							<button>2</button>
							<button>3</button>
							<button>4</button>
							<button>5</button>
							<button>></button>
						</div>
						<div class="btn">
						<!-- 관리자만 사용할 수 있는 버튼 -->
							<button>글쓰기</button>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>