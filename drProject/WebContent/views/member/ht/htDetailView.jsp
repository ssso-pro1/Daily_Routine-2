<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
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
                    <h2>HomeTraining > 코어 운동</h2>
                    <hr>
                </div>
                <br>
				<div id="content_2_2">
					<h2>title 매일 9분 복근 만들기</h2>
					<p>간략설명</p>
					<p>이 운동은 이런 분들에게 좋아요</p>
					<p>
						<ul>
							<li>복근을 만들고 싶으신 분</li>
							<li>코어 힘을 키우고 싶으신 분</li>
						</ul>
					</p>
					<br>
					<video src="https://youtu.be/zcQ16cfJN9Q"  controls autoplay loop width="500px" height="300px"></video>
					<br>
					<p>
						운동방법<br>
						<ul>
							<li>배아픈거 : 코어힘으로 버텨야해요</li>
							<li>배아픈거 : 그래서 싫어요</li>
						</ul>
					</p>
					<pre style="text-align: left;">  
이 운동루틴은 영국에서 최초로 시작되어 매일매일 일년 운동한 사람에게 행운을 주었고 지금은 당신이 알게 된 이 운동 루틴은 오늘 당장부터 시작해서 4일 이상 쉬면 안됩니다. 
운동을 하시면서 7명의 사람에게 이 루틴을 알려주셔야합니다. 치팅을 해도 좋습니다. 혹시 운동효과를 못볼것 같지만 꾸준히 하면 효과가 있습니다.
영국에서 Amyear Mulzomdao이라는 사람은 1930년에 이 운동 루틴을 시작했습니다. 그녀는 매일 같이 운동하여 1년뒤에 그녀가 얻고자하는 몸과 건강을 얻으며 영생을 얻게 되었습니다. 어떤이는 이 운동을 하였으나 95시간 이내 운동을 재개해야 하는 사실을 잊었습니다. 그에게는 다시 요요가 찾아왔습니다. 미국의 케네디 대통령은 이 운동을 시작했지만 곧 포기 하였습니다. 9일 후 그는 암살당했습니다. 기억해주세요. 이 운동을 마치면,  체중감량, 자세교정, 핏, 건강과  행운이 7년동안 있을 것이고, 그렇지 않으면 3년의 불행이 있을것입니다. 운동을 RM이나, 세트를 생략하는것은 절대 안됩니다. 1년입니다. 이 운동 루틴을 마친 사람은 행운이 깃들것입니다. 힘들겠지만 좋은게 좋다고 생각해주세요. 7년의 행운을 빌며..
					  </pre>
				</div>
			</div>
		</div>
	</div>
</body>
</html>