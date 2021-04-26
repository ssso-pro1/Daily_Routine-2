<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    div{
        box-sizing:border-box
    }
    .wrap{
        width: 1000px;
        height: 800px;
        margin: auto;
    }
    .wrap>div{
        width: 100%;
    }
    
    #content{height: 100%; width: 100%;}
    
    #content>div{
        height: 100%;
        float: left;
    }

    #content_1{width: 15%;}
    #content_2{width: 80%; margin-left: 15px;}
    #line{width: 1%;}

    #line {
        border: 1px solid gray;
        width: 0.1px;
        height: 150px;
    }

    

    #content_2_1{height: 7;}
    #content_2_2{height: 10%;}
    #content_2_3{height: 10%;}
    #content_2_4{height: 77%;}
    


    #upperIcon{
        
        width:170px;
        height: 40px;
        display:inline-block;
        margin:10px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 500;
        border: rgb(250, 249, 247);
        border-width: 5px;
        border-style: inset;
        border-top-right-radius: 20px;
        border-bottom-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        background-color: rgb(48, 42, 100);
        color: white;
    }

    #upperIcon.query{
        background-color: rgb(250, 234, 16);
        color: black;
        
    }

    .searchArea{
        margin: auto;
        background: lightgray;
        height: 50px;
        width: 600px;
    }
    
   
    .underLine {
        border: 1px solid gray;
        width: 0.1px;
        width: 150px;
        }

    .queryArea{
        height: 90%;
        width: 100%;
    }

    .queryArea>form>table{
        margin: auto;
        width: 500px;
        height: 400px;
    }
    
    a#leftMenu{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a#leftMenu:hover{color:rgb(250, 214, 9);}
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    a{text-decoration: none; color: black;}

</style>
</head>

<%@include file="../../common/menubar.jsp" %>

<body>
<div class="wrap">
    <div id="content">
    
        <!--왼쪽 공통메뉴-->
        <div id="content_1">
            <a href="<%=contextPath%>/main.ct" id="leftMenu"><h1>고객센터</h1></a>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu">FAQ</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct" id="leftMenu">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1" id="leftMenu">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1" id="leftMenu">공지사항</a></div>
            
            </div>
        </div>
        
        <div id="line"></div>
        
        <!--버튼-->
        <div id="content_2">
            <div id="content_2_1">
                <h3>고객센터 > 1:1 문의 </h3>
                <hr>
            </div>

            <div id="content_2_2">
                <div class="iconArea">
                    <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">
                        <div id="upperIcon" class="faq ff" align="center">FAQ</div>
                    </a>
                    <a href="<%=contextPath%>/enrollQuery.ct">
                        <div id="upperIcon" class="query ff" align="center">1:1문의</div>
                    </a>
                    <a href="<%=contextPath%>/queryList.ct?currentPage=1">
                        <div id="upperIcon" class="queryList ff" align="center">나의 문의내역</div>
                    </a>
                    <a href="<%=contextPath%>/notice.ct?currentPage=1">
                        <div id="upperIcon" class="notice ff" align="center">공지사항</div>
                    </a>
                </div>
            </div>
                

            <!--관리자에게 문의하기-->
            <!--로그인한 사용자만 볼수있도록 만들어야지-->
            <div id="content_2_3">    
                <p><h3>1:1 문의하기</h3></p>
                <div class="underLine"></div>
            </div>


            <!--문의입력-->
            <div id="content_2_4">
                
                <div class="queryArea">
                    <form id="enrollQueryFrorm" action="<%= contextPath %>/insertQuery.ct" method="post">
                    	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <table border="1">
                            <tr>
                                <th>문의유형</th>
                                <td>
                                	
                                    <select name="qCategory" id="qCategory" required style="width: 100%;">
                                        <option id="qCategory" value="0">선택해주세요</option>
                                        <option name="qCategory" id="qCategory" value="회원정보" >회원정보</option>
                                        <option name="qCategory" id="qCategory" value="게시글">게시글/댓글</option>
                                        <option name="qCategory" id="qCategory" value="신고">신고</option>
                                        <option name="qCategory" id="qCategory" value="기타문의">기타문의</option>
                                    </select>
                                    
                                    
                                 </td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="qTitle" id="qTitle" placeholder="제목을 입력해주세요" style="width: 100%;" required maxlength="50"></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <div>
                                        <textarea id="qContent" name="qContent" style="width: 100%;" rows="10" style="resize: none;" placeholder="궁금하신 내용을 입력하세요 (300자 이내)" required></textarea>
                                        <br>
                                    </div>
                                    <span id="count" name="count">0</span> / 300
                            </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <button type="submit" onclick="return validate();">등록</button>
                                    <button type="reset">취소</button>
                                </td>
                            </tr>


                        </table>

                                <script>
                                	
 									// 문의글 제목 50글짜 이상 입력방지 , 알러트
                                    $(document).ready(function(){
							            $("#qTitle").on("keyup", function(){
                                            
							            	if($(this).val().length>50){
							                    $(this).val($(this).val().substring(0, 50));
                                                alert("50자이상 입력하실 수 없습니다.");
							                }
							            });
							        });

									// 문의글 내용 300자 이상 입력 방지, 알러트
                                    $(document).ready(function(){
							            $("#qContent").on("keyup", function(){
                                            //var inputlength=$(this).val().length;
                                            //var remain = 300-inputlength;

							                if($(this).val().length>300){
							                    $(this).val($(this).val().substring(0, 300));
                                                alert("300자이상 입력하실 수 없습니다.");
							                }
							            });
							        });

                                    
                                    // 글자수 세기
                                    $(function(){
                                        $("#qContent").keyup(function(){
                                            var inputlength = $(this).val().length;
                                            $("#count").text(inputlength);
                                        })
                                        
                                    }) 
                                    
                                    
                                    // 글등록 유효성 체크
                                    function validate(){
                                    	
                                    	var qCategory = $("#qCategory").val();
                                    	var qTitle = document.getElementById("qTitle");
                                    	var qContent = document.getElementById("qContent");
                                    	var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자이상 등록
                                    	
                                    	if(qCategory=="0"){
                                    		alert("문의유형을 선택해주세요");
                                    		
                                    		return false;
                 
                                    		}
                                    	
                                    	
                                    	
                                    	if(!regExp.test(qTitle.value)){
                                    		alert("제목을 입력해주세요");
                                    	
                                    		qTitle.value="";
                                    		qTitle.focus();
                                    		
                                    		return false;
                                    	}
                                    	
                                    	
                                        
                                    	if(!regExp.test(qContent.value)){ 
                                    		alert("내용을 입력해주세요");
                                    	
                                    		qContent.value="";
                                    		qContent.focus();
                                    		
                                    		return false;
                                    	}
                                    	
                                    	
                                    	var result = confirm("글을 등록하시겠습니까?");
                                    	if(result){
                                    		
                                    	} else {
                                    		alert("게시글 등록이 취소되었습니다");
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