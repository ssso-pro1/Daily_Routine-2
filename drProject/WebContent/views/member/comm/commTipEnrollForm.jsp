<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.comm.model.vo.Comm" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing:border-box
    }
    .wrap{
        width:1000px;
        height:800px;
        margin:auto;
        margin-top:15px;
    }
    .wrap>div{
        width:100%;
    }

    a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a:hover{color:rgb(250, 214, 9);}

    #content{height:100%; width:100%;}

    #content>div{
        height:100%;
        float:left;
    }

    #content_1{width:15%;}
    #content_2{width:80%; margin-left:25px;}
    .line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px; 
    }

    #content_2_1{height:15%;}
    #content_2_2{height:70%; margin-left:48px;}
    
    #enrollForm input, #enrollForm textarea{
        width:100%;
        box-sizing:border-box;
    }
    .enrollArea{
        right:500px;
    }
    .enrollButton>button{
        background:rgb(250, 214, 9);;
        color:white;
        border:rgb(250, 214, 9);;
    }
    div>button{
        cursor:pointer;
    }
    .leftMenu>#menu1>a{color:rgb(250, 214, 9);}  
</style>

   <%@ include file="../../common/menubar.jsp"%>


    <div class="wrap">
        
        <div id="content">

            <!--왼쪽 공통메뉴-->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div id="menu1"><a href="<%=contextPath%>/commMain.co?currentPage=1">나만의 운동 Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co?currentPage=1">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co?currentPage=1">질문게시판</a></div>
                </div>
            </div>

            <div id="line"></div>

            
            <!-- 게시글 작성 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div><br>

                
                <!-- 게시글 작성 폼 -->
                <div id="content_2_2">
                    <div class="enrollArea">
                       <form action="<%=contextPath%>/insertTip.co" id="enrollForm" method="post" enctype="multipart/form-data">
                            <table align="center">
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="100">
                                                <select name="category">
                                                    <option value="0">선택안함</option>
                                                    <option value="1">[식단공유]</option>
                                                    <option value="2">[운동tip]</option>
                                                </select>
                                            </td>
                                            <td width="800" height="30">
                                                <input type="text" name="title" placeholder="제목을 입력해주세요." required>
                                            </td> 
                                            
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="800" height="30">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                    </td>
                                                    <td>
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button><br>
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button>
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="500">
                                                <textarea name="content" rows="20" style="resize:none" placeholder="내용을 입력해주세요." required></textarea>   
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                            </table><br><br>
                            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
							<br><br>
                            <div align="right" class="enrollButton">
                                <button type="submit" onclick="return validate();">등록</button>
                                <button type="reset">취소</button>
                            </div>
							
							<script>
								
								// 카테고리 유효성 체크 
								function validate() { 
									
									var category = $("#category").val();
									var title = $("#title").val();
									var content = $("#content").val();
									
									if(category == "0"){
										alert("카테고리를 선택해주세요"); 
										return false;	
										}
									
									if(title == '') {
										alert("제목을 입력해주세요"); 
										return false; 
										}
									
									if(content = '') {
										alert("내용을 입력해주세요"); 
										return false; 
										}
									
									var result = confirom("글을 등록하시겠습니까?"); 
									if(result) {
										
									}else { 
										alert("게시글 등록이 취소되었습니다."); 
										return false; 
									}

								}
								
							</script>
							
							
                        </form>
                    
                    </div>
                </div>
            </div>


        </div> 
    </div>
</body>
</html>