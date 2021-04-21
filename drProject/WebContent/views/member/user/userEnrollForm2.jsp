<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.회원가입_2.회원정보입력</title>
        
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .outer{
            padding:35px;
            width:80%;
            height:auto;
            margin:auto;
            margin-top:30px;
            border:1px solid gray;
        }

        .menuWrap{
            width:100%;
            height:50px;
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
        <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-right fa-lg"></i>
        <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-right fa-lg"></i>
        <span class="step_3">회원가입완료</span>
    </div>

    <div class="outer">

        <form action="<%= request.getContextPath() %>/insert.us" method="post" id="enrollForm">
            
            <table>
                <!-- AJAX -->
                <tr>
                    <th >아이디</th>
                    <th><input type="text" name="userId" minlength="5" maxlength="30" required placeholder="아이디를 입력하세요">
                    </th>
                    <th><button type="button" onclick="idCheck();">중복확인</button></th>
                </tr>
                <tr>
                    <td colspan="3" id="msg1">5~30자의 영문,소문자,숫자와 특수기호(_)(-)만 사용가능합니다.</td>
                </tr>
                
                <tr>
                    <th>비밀번호</th>
                    <th><input type="password" name="userPwd" minlength="8" maxlength="15" placeholder="비밀번호" required></th>
                </tr>
                <tr>
                    <td colspan="3" id="msg2">8~16자 영문 대소문자, 숫자, 특수문자를 사용하세요.</td>
                </tr>
                <tr>
                    <th>비밀번호 재확인</th>
                    <th><input type="password" maxlength="15" placeholder="비밀번호 재확인" required ></th> 
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" id="msg4">비밀번호가 일치하지 않습니다.</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <th><input type="text" name="userName" maxlength="5" placeholder="이름" required></th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" id="msg5">한글과 영문 대소문자를 사용하세요. (특수기호, 공백 사용 불가)</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <th><input type="text" size="3" maxlength="4"> 년 &nbsp;
                        <select name="month">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select> 월 
                        <input type="text" size="3" maxlength="2"> 일 &nbsp;</th>
                </tr>
                <tr>
                    <th>성별</th>
                    <th colspan="2">
                        <select name="gender" id="" >
                            <option value="" selected>선택안함</option>
                            <option value="F">여성</option>
                            <option value="M">남성</option>
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
                    <th><input type="text" name="phone" placeholder="(-포함해서 입력)"></th>
                    <th><button type="button">인증하기</button></th>
                </tr>
                <tr>
                    <th></th>
                    <!-- 인증번호 required 임의로 없앰 -->
                    <th colspan="2"><input size="20" type="text" placeholder="인증번호를 입력하세요" ></th>
                </tr>
                <tr>
                    <th colspan="3">
                        <div class="btn">
                            <button type="submit" class="btn btn-warning" disabled>가입하기</button>
                        </div>
                    </th>
                </tr>
            </table>
    
        </form>

 
    </div>

    <script> /*중복확인 펑션*/
        function idCheck(){
        
            var $userId = $("#enrollForm input[name=userId]");
            
            $.ajax({
                url:"idCheck.us",
                type:"get",
                data:{checkId:$userId.val()},
                success:function(result){
                    
                
                	if(result == 'NNNNN'){ //사용 불가
                		alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                		$userId.focus(); 
                	}else{ //사용가능
                		if(confirm("사용가능한 아이디입니다. 정말로 사용하시겠습니까?")){
                			
                			//사용하겠다 =>더 이상 변경불가, 회원가입버튼 활성화
                			$userId.attr("readonly", true);
                			$("#enrollForm :submit").removeAttr("disabled"); 
                			
                		}else{
                			//다시 입력
                			$userId.focus(); 
                		}
                	}
                	
                },error:function(){ //사용가능
                	
                    console.log("아이디 중복체크용 ajax 통신 실패");
                }
            })
            
    }
    
    </script>

</body>
</html>