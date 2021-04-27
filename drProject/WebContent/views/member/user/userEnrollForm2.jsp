<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 유효성검사 resource -->
    <!-- <link rel="script" type="text/javascript" href="../../../resources/js/userEnrollForm.js"/> -->
    <!-- href="${pageContext.request.contextPath}/resources/js/userEnrollForm.js"> -->

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입_2.회원정보입력</title>
        
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
      .formOuter{
            border:1px solid gray;
            padding-top:80px;
            width:50%;
            margin:auto;
        }
        .menuWrap{
            width:100%;
            height:50px;
            margin-top:30px;
            margin-bottom:60px;

            display:flex;
            justify-content:center;

        }
        
        .menuWrap>span{
            text-decoration:none;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            height:100%;
            margin:0px 50px;
        }

        .step_2, .arrow2 {color:rgb(250, 214, 9);}
        .step_1, .step_3{color:rgb(116, 116, 116);}

        i{margin-top:20px; color:rgb(116, 116, 116);}
    


        .btn{
            display:flex;
            justify-content:center;
            margin:10px;
        }

    
        #enrollForm table{margin:auto; 
            /*정 가운데로 옮김*/}
        #enrollForm input{margin:5px;}
        /*아래 위 서로 간격 띄움*/

        table th{
            font-size:15px;
        }

        table td{
            padding-bottom:10px;
            font-size:12px;
        }

    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<!--     
    <hr style="border:1px solid lightgray"> -->
    
    <div class="menuWrap" align="center">
        <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_3">회원가입완료</span>
    </div>

    <div class="formOuter">

        <form action="<%= request.getContextPath()%>/insert.us" method="post" id="enrollForm">
            
            <table>
                <tr>
                    <th >아이디</th>
                    <th><input type="text" name="userId" id="userId" minlength="5" maxlength="30" placeholder="아이디를 입력하세요">
                    </th>
                    <th><button type="button" class="btn-outline-warning" onclick="idCheck();" style="background:white;">중복확인</button></th>
                </tr>
                <tr>
                    <td colspan="3" id="msg1">5~20자의 영문,소문자,숫자만 사용가능합니다.</td>
                </tr>
                
                <tr>
                    <th>비밀번호</th>
                    <th><input type="password" name="userPwd" id="userPwd" minlength="8" maxlength="15" placeholder="비밀번호" ></th>
                </tr>
                <tr>
                    <td colspan="3" id="msg2">8~15자 영문 대소문자, 숫자, 특수문자를 사용하세요.</td>
                </tr>
                <tr>
                    <th>비밀번호 재확인</th>
                    <th><input type="password" name="userPwd2" id="userPwd2" minlength="8" maxlength="15" placeholder="비밀번호 재확인" ></th> 
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" id="msg4"></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <th><input type="text" name="userName" id="userName" maxlength="5" placeholder="이름" ></th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" id="msg5">한글과 영문 대소문자를 사용하세요. (특수기호, 공백 사용 불가)</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <!--  -->
                    <th><input name="birth" id="yeear" type="text" size="3" maxlength="4"> 년 &nbsp;
                        <select name="birth">
                            <option value="" selected name="birth">선택안함</option>
                            <option value="1" name="birth">01</option>
                            <option value="2" name="birth">02</option>
                            <option value="3" name="birth">03</option>
                            <option value="4" name="birth">04</option>
                            <option value="5" name="birth">05</option>
                            <option value="6" name="birth">06</option>
                            <option value="7" name="birth">07</option>
                            <option value="8" name="birth">08</option>
                            <option value="9" name="birth">09</option>
                            <option value="10" name="birth">10</option>
                            <option value="11" name="birth">11</option>
                            <option value="12" name="birth">12</option>
                        </select> 월 
                        <input name="birth" type="text" size="3" maxlength="2"> 일 &nbsp;</th>
                </tr>
                <tr>
                    <th>성별</th>
                    <th colspan="2">
                        <select name="gender" id="gender" >
                            <option value="" selected>선택안함</option>
                            <option value="여" name="gender">여</option>
                            <option value="남" name="gender">남</option>
                        </select>
                    </th>
                </tr>
                <tr>
                    <th>본인확인 이메일(선택)</th>
                    <th><input type="email" name="email"></th>
                    <td></td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <th><input type="tel" name="phone" id="tel" placeholder="(-포함해서 입력)" required></th>
                    <th><button type="button" class="btn-outline-warning" style="background:white" onclick="send()">인증번호</button></th>
                </tr>
                <tr>
                    <th></th>
                    <th><input size="20" type="text" id="idNum" placeholder="인증번호를 입력하세요" required></th>
                    <th><button type="button" class="btn-outline-warning" style="background:white" onclick="enter()">인증하기</button></th>
                </tr>
                <tr>
                    <th colspan="3">
                        <div class="btn">
                            <!-- 유효성검사 -->
                            <button type="submit" class="btn btn-warning"  onclick="return validate();" disabled>회원가입</button>
                            <button type="reset" class="btn btn-secondary">취소</button>
                        </div>
                    </th>
                </tr>
            </table>
    
        </form>

 
    </div>

    <script>
       

            function send(){
                alert('인증번호가 발송되었습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.');
            }
    
            
            function enter(){
                
                if($("#idNum").val() == ""){
                    alert("인증번호를 입력하세요.")
                    idNum.value = "";
                    idNum.focus();

                    return false;
                }else{
                    alert("확인되었습니다.");
               }
                
                   
            }
    
        /*중복확인 펑션*/
        function idCheck(){
        
            var $userId = $("#enrollForm input[name=userId]"); //jquery 방식으로 선택한 요소 객체 알리기 위한 $
            
            $.ajax({
                url:"idCheck.us",
                type:"get",
                data:{checkId:$userId.val()}, //사용자가 입력한 id값
                success:function(result){		
                    
                
                	if(result == 'NNNNN'){ //사용 불가
                		alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                		$userId.focus(); 
                	}else{ //사용가능
                		
                		if(confirm("사용가능한 아이디입니다. 정말로 사용하시겠습니까?")){
                			
                			//사용하겠다 =>더 이상 변경불가, 회원가입버튼 활성화
                			// $userId.attr("readonly", true);
                			$("#enrollForm :submit").removeAttr("disabled"); 
                			
                		}else{
                			//다시 입력
                			$userId.focus(); 
                		}
                	}
                	
                },error:function(){ 
                	
                    console.log("아이디 중복체크용 ajax 통신 실패");
                }
            })
            
    }
</script>

<script>
        //유효성 검사
       
        function validate(){
                
                // 유효성 검사 : 아이디, 비밀번호, 비밀번호 일치, 이름
            
                // input요소 객체들 가져다두기 (작성되어있는값 아님! input요소객체임!)
                var userId = document.getElementById("userId");
                var userPwd = document.getElementById("userPwd");
                var userPwd2 = document.getElementById("userPwd2");
                var userName = document.getElementById("userName");
                var year = document.getElementById("year");
                var email = document.getElementById("email");
                var tel = document.getElementById("tel");
                var idNum = document.getElementById("idNum");
                
                // 1) 아이디 검사 (영문자,숫자로만 총 5~20글자로 이뤄져야만 하고 단, 첫글자는 영문자(소문자 한글자)로.)
                var regExp = /^[a-z][a-z\d]{5,20}$/;
                if(!regExp.test(userId.value)) { //userId는 요소객체이기 때문에 value붙여야함
                    alert("유효한 아이디를 입력하세요");
            
                    userId.value = "";
                    userId.focus();   
            
                    return false; //틀리면 넘어가지 않게.
                }
            

            
                // 2) 비밀번호 검사 (영문자,숫자,특수문자(!@#$%^&*) 포함 총 8자~15자 입력되게)
                regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
                if(!regExp.test(userPwd.value)){
                    alert("유효한 비밀번호를 입력하세요.");
            
                    userPwd.value = ""; 
                    userPwd.focus();
            
                    return false;
                }
            
                // 3) 비밀번호 일치 검사
                if(userPwd.value != userPwd2.value){
                    alert("동일한 비밀번호를 입력하세요.");
            
                    userPwd2.select(); //입력한 비번내용이 파랗게 선택됨.
                    return false;
                }
                
                // 4) 이름 검사 (한글(결합)로만, 2글자 이상)
                regExp = /^[가-힣]{2,}$/; //{2} : 그냥 2글자
                if(!regExp.test(userName.value)){
                    alert("유효한 이름을 입력하세요.");
            
                    userName.value = "";
                    userName.focus();
            
                    return false;
                }
            
                // 5) 생일 : 년도
                reqExp = /^(19[0-9][0-9])$/;

                if(!regExp.test(year.value)){
                    alert("년도를 4자리로 입력해주세요.");

                    year.value = "";
                    year.focus();

                    return false;
                }
            
                // 6) 이메일
                regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                    if(!regExp.test(email.value)){
                        alert("유효한 이메일을 입력하세요.");

                        email.value = "";
                        email.focus();

                        return false;
                    }

            
            
                 // 7) 휴대폰 번호 정규식
                regExp = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
                    if(!regExp.test(tel.value)){
                    alert("유효한 이메일을 입력하세요.");

                    tel.value = "";
                    tel.focus();

                    return false;
                }

                //8) 인증번호 6자리
                regExp =  /^[0-9]{6}$/;
                if(!regExp.test(idNum.value)){
                    alert("인증번호를 확인하세요.");

                    idNum.value = "";
                    idNum.focus();

                    return false;
                }
      

                
                //빈칸방지
                if(!regExp.test(tel.value)){
                        alert("휴대폰 번호를 입력하세요.");
                    
                        tel.value="";
                        tel.focus();
                        
                        return false;
                    }

                if(!regExp.test(idNum.value)){
                        alert("인증번호 6자리를 입력하세요.");
                    
                        idNum.value="";
                        idNum.focus();
                        
                        return false;
                    }
                    
                    
                    
                   

        }
    
    </script>

    

</body>
</html>