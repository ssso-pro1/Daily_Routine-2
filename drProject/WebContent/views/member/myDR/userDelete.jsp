%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../../../resources/css/drView.css"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/drView.css">
<style>
    .outer{
        width:1000px;
        height:800px;
        margin: auto;
		margin-left: -50px;
    }
    .form{
    	width:800px;
    	height:100%;
    	margin:auto;
    }
    #passwordInput th{
        width:70px;
        text-align: left;
        padding: 8px;
    }
	#btn1{
        border: 1px solid #4375DB;
        background-color: #4375DB;
        color: white;
		font-size: 16px;
		margin-left: -2px;
	}
	#submitBtn{
		background-color: orangered;
		border: 1px solid orangered;
		border-radius:4px;
	}
	#btn1{
		margin-left: -1px;
	}

</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

	<div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md" style="color:rgb(250, 214, 9);">회원수정</a></div>
                    <br>
                    <div><a href="">내 글 보관함</a></div>
                    <br>
                    <div><a href="" >북마크 보관함</a></div>
                    <br>
                    <div><a href="">다이어리</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- ê²ìí ëª©ë¡ -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
					<div class="outer">
						<form action="" name="updateEnrollForm">
							<div class="form">
								&nbsp<button id="btn1" disabled>íì íí´</button>
								<fieldset>
									<p>
										<br>
										<h2><b>ê·¸ëì ë°ì¼ë¦¬ ë£¨í´ì ì´ì©í´ì£¼ìì ê°ì¬í©ëë¤</b></h2> <br>
													íì íí´ íì¤ ê²½ì° íìëì ëª¨ë  ì ë³´ê° ì­ì ë©ëë¤. <br>
													íì¬ íìëê»ì ì¬ ì¤ì¸ ìë¹ì¤ë¥¼ íì¸íì  í ì ì¤í íí´í´ì£¼ìê¸° ë°ëëë¤. <br><br><br>
													<hr><br>
													íì íí´ë¥¼ ìí´ ë¹ë°ë²í¸ë¥¼ ìë ¥í´ ì£¼ì¸ì. <br><br>
										<hr>
									</p>
									<table id="passwordInput">
										<tr>
											<th>ìì´ë</th>
											<td>corin2</td>
										</tr>
										<tr>
											<th>ë¹ë°ë²í¸</th>
											<td><input type="password" size="25" maxlength="15" placeholder="ë¹ë°ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì" required></td>
										</tr>
									</table>
									<br>
									<hr>
									<br>
									<div class="buttons" align="center">
										<button type="submit" id="submitBtn">íí´ ì ì²­</button> &nbsp;
										<button id="resetBtn" onclick="location='<%= contextPath %>/update.md'">ì·¨ì</button>
									</div>
									<br>
								</fieldset>
							</div>
						</form>
					</div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>