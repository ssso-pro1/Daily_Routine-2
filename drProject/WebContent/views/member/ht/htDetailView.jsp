<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.ht.model.vo.Ht"%>
<%
	Ht h = (Ht)request.getAttribute("h");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<link rel="stylesheet" href="../../../resources/css/htView.css">
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<style>
	.mark{
        width: 500px;
        text-align: right;
        cursor: pointer;
    }
</style>
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
                    <div><a href="<%=contextPath%>/free.co" style="color:rgb(250, 214, 9);">코어 운동</a></div>
                    <br>
					<div><a href="<%=contextPath%>/free.co">전신 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co">상체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co">하체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co">스트레칭</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>HomeTraining > <%= h.getHtCategory() %></h2>
                    <hr>
                </div>
                <br>
				<div id="content_2_2">
					<h2><%= h.getHtPostTitle() %></h2>
					<p><%= h.getHtComment() %></p>
					<p>이 운동은 이런 분들에게 좋아요</p>
					<p>
						<%= h.getHtRecommend() %>
					</p>
					<br>
					<iframe src="<%= h.getVideoLink() %>?autoplay=1"width="500px" height="300px"></iframe>
					<br>
					<div class="mark">
						북마크 <i id="bookmark" class="far fa-bookmark" onclick="bookmark();"></i> &nbsp;&nbsp;
						좋아요 <i id="like" class="far fa-heart" onclick="like();"></i>
					</div>

					<script>
						function bookmark(){
							var bkClass = document.getElementById('bookmark').className;
							if(bkClass == 'fas fa-bookmark'){ // 꽉찬 북마크 -> 빈 북마크로 => 취소할때
								document.getElementById('bookmark').className = 'far fa-bookmark';
							}else{ // 빈 북마크 -> 꽉찬 북마크로 => 북마크 할 때
								document.getElementById('bookmark').className = 'fas fa-bookmark';
							}
						}
						function like(){
							var lkClass = document.getElementById('like').className;
							if(lkClass == 'fas fa-heart'){ // 꽉찬 하트 -> 빈 하트로 => 취소할 때
								document.getElementById('like').className = 'far fa-heart';
								$.ajax({
									type:"post",
									url: "북마크 할 서블릿",
									data:{
										userId:유저아이디,
										postNo:게시판 번호
									}
									success:function({
										
										
									})
									
								
								})
							}else{ // 빈 하트 -> 꽉찬 하트로 => 좋아요 할 때
								document.getElementById('like').className = 'fas fa-heart';
							}
						}
						
					</script>

					<p>
						운동방법<br>
						<p>
							<%= h.getHtHowToWork() %>
						</p>
					</p>
					<p>
						주의사항<br>
						<p>
							<%= h.getHtSuggestion() %>
						</p>
					</p>
					<pre style="text-align: left;">  
<%= h.getHtPostContent() %>
					  </pre>
				</div>
			</div>
		</div>
	</div>
</body>
</html>