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
        margin-top:15px;
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
    #content_2{width: 80%; margin-left: 25px;}
    #line{width: 1%;}

    #line {
        border: 1px solid gray;
        width: 0.1px;
        height: 150px;
    }

    

    #content_2_1{height: 8;}
    #content_2_2{height: 12%;}
    #content_2_3{height: 80%;}
    
    


    #upperIcon{
        
        width:180px;
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
        border: 1px solid
       
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

    th{font-size: 20px;}

    .enrollButton>button{
        color:black;
        text-decoration:none;
        font-size:18px;
        font-weight:bolder;
        border:rgb(250, 214, 9);
    }
    .enrollButton>#enrollBtn:hover{
    	color:rgb(250, 214, 9);
    }
    .enrollButton>#enrollBtn a:hover{
    	color:rgb(250, 214, 9);
    }
    
    /* footer */
    .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:500px;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        
        
    }

    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);
        padding-top:10px;
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

<%@include file="../../common/menubar.jsp" %>

<body>
<div class="wrap">
    <div id="content">
    
       <!--왼쪽 공통메뉴-->
        <div id="content_1"  class="ff" >
            <a href="<%=contextPath%>/main.ct" id="leftMenu"><h1 class="ff">고객센터</h1></a>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu">FAQ</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct" id="leftMenu" style="color:rgb(250, 214, 9);">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1" id="leftMenu">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1" id="leftMenu">공지사항</a></div>
            </div>
        </div>
        
        <div id="line"></div>
        
        <!--버튼-->
        <div id="content_2" class="ff">
            <div id="content_2_1">
                <h2>고객센터 > 1:1 문의 </h2>
                <hr>
            </div>

            <div id="content_2_2" style="margin-left: 20px; width: 900px;">
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
            


            <!--문의입력-->
            <div id="content_2_3">
                
                <div class="queryArea">
                    <form id="enrollQueryFrorm" action="<%= contextPath %>/insertQuery.ct" method="post">
                    	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <table class="ff" style="width: 600px;">
                            <tr><td style="height: 20px;"></td></tr>
                            <tr>
                                <th style="height: 30px;">문의유형</th>
                                <td>
                                	
                                    <select name="qCategory" id="qCategory" class="ff" required style="width: 101%; font-size: 17px;">
                                        <option id="qCategory" value="0">선택해주세요</option>
                                        <option name="qCategory" id="qCategory" value="회원정보" >회원정보</option>
                                        <option name="qCategory" id="qCategory" value="게시글/댓글">게시글/댓글</option>
                                        <option name="qCategory" id="qCategory" value="신고">신고</option>
                                        <option name="qCategory" id="qCategory" value="기타문의">기타문의</option>
                                    </select>
                                    
                                    
                                 </td>
                                 <td style="width: 30px;"></td>
                            </tr>
                            <tr>
                                <th style="height: 30px;">제목</th>
                                <td><input type="text" name="qTitle" id="qTitle"  class="ff" placeholder="제목을 입력해주세요" style="width: 99%; font-size: 15px;" required maxlength="50"></td>
                            </tr>
                            <tr>
                                <th style="height: 200px">내용</th>
                                <td>
                                    <div>
                                        <textarea id="qContent" name="qContent"  class="ff" style="width: 100%; font-size: 15px; resize: none;" rows="15" placeholder="궁금하신 내용을 입력하세요 (300자 이내)" required></textarea>
                                        <label style="float: right;" class="ff"><span id="count" name="count" class="ff">0</span> / 300</label>
                                    </div>
                                    
                            </td>
                            <td></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right" style="height: 10px" class="enrollButton">
                                    <button type="submit" id="enrollBtn" class="ff" onclick="return validate();">등록</button>
                                    <button id="enrollBtn" class="ff" onclick="return back();"><a href="<%= contextPath%>/enrollQuery.ct">취소</a></button>
                                </td>
                                
                            </tr>
                            <tr><td style="height: 20px;"></td></tr>


                        </table>

                                <script>
	                                function back(){
	                    				var result = confirm("게시글 작성을 취소하시겠습니까?");
	                                	if(result){
	                                		
	                                		return true;
	                                	} else {
	                                		
	                                		return false;
	                                	}
	                    			}
	                                
                                	
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

<br><br><br><br>
<!-- footer -->
<div class="footerOuter ff">
    

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



</body>
</html>