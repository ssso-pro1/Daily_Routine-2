<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	// 관리자 페이지 url ..? 
	String contextPath = request.getContextPath();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>관리자 메인 페이지- 좌측 메뉴바</title>

    <style>
        div{
            box-sizing:border-box;
        }
        .wrap{
            width:1000px;
            height:800px;
            margin:auto;
            margin-top:15px;
            background-color: rgb(33, 33, 34);
        }
        .wrap>div{
            width:100%;
        }

        
        #content{height:100%; width:100%;}

        #content>div{
            height:100%;
            float:left;
        }

        #content_1{width:15%;}
        #content_2{width:80%; margin-left:30px;}
        #line{width:1%;}

        #line{
            border:1px solid gray;
            width:0.1px;
            height:150px;
        }


        #welcome{
            text-decoration: none;
            color:white;

        }
        #welcome:hover{
            color: rgb(33, 33, 34);
        }
        /* #content_2_1{height:10%;}
        #content_2_2{height:35%;}
        #content_2_3{height:35%;} */

        #nav{
            width:100%;
            height:40px;
            background-color: gray;
            padding:5px;
            
            display:flex;
            justify-content:space-between;

            color:white;
            font-weight:bold;
            font-size:20px;
        }


        #content_1 *{
            color:gray;
            margin: 10px 3px;
        }

        #content_1>div{
            font-size:13px;
            margin-top:20px;
            margin-left:10px;
        }

        #content_1 a{
            font-size:12px;
            text-decoration:none;
            font-weight:bold;
            margin-left:10px;
        }

        /* wrap a#content_1 a:hover{color:white;} */

        #content2_1{
            color:white;
            font-size:10px;
            padding:10px;
        }

   
        #title{
            margin-left:25px;
        }
        .listArea{
            border:1px solid gray;
            text-align:center;
            width: 95%;
            margin: auto;
        }
        .listArea>tbody>tr:hover{
            background:rgb(219, 217, 217);
            cursor:pointer;
        }
        .listArea>thead>tr{
            background:rgb(247, 209, 86);
        }
        .listArea>tr,th,td{
            height:30px;
        }

        
        
        


    </style>
</head>
<body>
	
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div class="wrap">

        <div id="nav">
            <span align="left">Admin Center</span>

            <span>
                <!-- 로그인 전 -->
                <i class="fas fa-user-circle"></i>
                
                <a id="welcome" href="<%=contextPath%>/loginForm.us">Welcome님</a>
                
                <!-- <i class="fas fa-bars"></i> -->
                <a href="<%=contextPath%>/"><i class="fas fa-home"></i></a> <!-- 오븐에는 메뉴바로 돼있는데, 저희 왼쪽에 메뉴바가 있어서 홈으로 가는 기능으로 바꾸면 좋을 것 같아서 넣었어요!-->

                <!-- 로그인 후
                <div>admin01님</div> -->
            </span>
        </div>


        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">전체 회원 조회 </a></div>
                    <div><a href="<%=contextPath%>/deleteForm.aus">회원 탈퇴처리</a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>게시물관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">HomeTraining</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">Info&Tip</a></div> 
                    <br>
                </div>

                <div class="content_1_3">
                    <h2>고객센터</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">공지사항</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">FAQ</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">1:1문의</a></div> 
                    <br>
                </div>

                <div class="content_1_4">
                    <h2>신고관리</h2>
                    <div><a href="<%=contextPath%>/userManage.aus">전체신고보기</a></div> 
                    <div><a href="<%=contextPath%>/userManage.aus">블랙리스트</a></div> 
                </div>
            </div>

            <div id="line"></div>



            <!-- content -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content2_1">
                    <h2>고객센터 > FAQ 관리</h2>
                </div>

                <hr style="border:1px solid rgb(145, 144, 144)">





            <!--FAQ-->
            <div id="content_2_3">    
                <p style="font-size: 20px; color: white; font-weight: 1000;">FAQ 관리 > FAQ 등록</p>
                <div class="underLine"></div>
            </div>


            <!--FAQ 글쓰기폼-->
            <div id="content_2_4" style="background: white; width: 800px; height: 550px;">
                <br>
                <div id="faqEnroll">
                    <form action="<%=contextPath %>/ctFaqInsert.ad" method="post">
                    <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <table border="1" align="center">
                            <tbody>
                                <tr>
                                    <th>문의유형</th>
                                    <td width=300px>
                                        <select name="fCategory" id="fCategory" required style="width: 100%;">
                                            <option id="fCategory" value="0">선택해주세요</option>
                                            <option name="fCategory" id="fCategory" value="top" >TOP10</option>
                                            <option name="fCategory" id="fCategory" value="userInfo" >회원정보</option>
                                            <option name="fCategory" id="fCategory" value="content">게시글/댓글</option>
                                            <option name="fCategory" id="fCategory" value="report">신고</option>
                                            <option name="fCategory" id="fCategory" value="etc">기타</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="fTitle" id="fTitle" placeholder="제목을 입력해주세요" style="width: 100%;"  maxlength="50" required></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <div>
                                            <textarea id="fContent" name="fContent" cols="50" rows="20" style="resize: none;" placeholder="내용을 입력하세요 (450자 이내)" required></textarea>
                                            <br>
                                        </div>
                                        <label style="float: right;"><span id="count" name="count" >0</span> / 450</label>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                            
                                <tr>
                                    <th>게시여부 선택</th>
                                    <th>
                                        <input type="radio" id="statusY" name="status" value="Y" checked><label for="statusY" >게시</label>
                                        <input type="radio" id="statusN" name="status" value="N"><label for="statusN">보류</label>
                                        
                                        <label style="float: right;">
                                        <button type="submit" onclick="return validate();">등록</button>
                                        <button onclick="return back();"><a href="<%=contextPath %>/ctFaqList.ad?currentPage=1&ctg=top">취소</a></button>
                                        </label>
                                    </td>
                                </tr>
                            </tfoot>

                        </table>

                        <p align="center"><button onclick="return back();"><a href="<%=contextPath %>/ctFaqList.ad?currentPage=1&ctg=top">목록으로</a></button></p>
                        
                        
                        
                        <script>
                        			function back(){
                        				var result = confirm("게시글 작성을 취소하시겠습니까?");
                                    	if(result){
                                    		
                                    		return true;
                                    	} else {
                                    		
                                    		return false;
                                    	}
                        			}
                        
                        
                        
                                	
 									// 글 제목 50글짜 이상 입력방지 , 알러트
                                    $(document).ready(function(){
							            $("#fTitle").on("keyup", function(){
                                            
							            	if($(this).val().length>50){
							                    $(this).val($(this).val().substring(0, 50));
                                                alert("50자이상 입력하실 수 없습니다.");
							                }
							            });
							        });

									// 글 내용 450자 이상 입력 방지, 알러트
                                    $(document).ready(function(){
							            $("#fContent").on("keyup", function(){
                                            //var inputlength=$(this).val().length;
                                            //var remain = 450-inputlength;

							                if($(this).val().length>450){
							                    $(this).val($(this).val().substring(0, 450));
                                                alert("450자이상 입력하실 수 없습니다.");
							                }
							            });
							        });

                                    
                                    // 글자수 세기
                                    $(function(){
                                        $("#fContent").keyup(function(){
                                            var inputlength = $(this).val().length;
                                            $("#count").text(inputlength);
                                        })
                                        
                                    }) 
                                    
                                    
                                    // 글등록 유효성 체크
                                    function validate(){
                                    	
                                    	var fCategory = $("#fCategory").val();
                                    	var fTitle = document.getElementById("fTitle");
                                    	var fContent = document.getElementById("fContent");
                                        
                                    	var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자이상 등록
                                    	
                                    	if(fCategory=="0"){
                                    		alert("문의유형을 선택해주세요");
                                    		
                                    		return false;
                 
                                    	}
                                    	
                                    	
                                    	
                                    	if(!regExp.test(fTitle.value)){
                                    		alert("제목을 입력해주세요");
                                    	
                                    		qTitle.value="";
                                    		qTitle.focus();
                                    		
                                    		return false;
                                    	}
                                    	
                                    	
                                        
                                    	if(!regExp.test(fContent.value)){ 
                                    		alert("내용을 입력해주세요");
                                    	
                                    		fContent.value="";
                                    		fContent.focus();
                                    		
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







</body>
</html>