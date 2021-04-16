<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:700px;
        height:600px;
        margin: auto;
    }
    #updateForm th{
        width:130px;
        text-align: left;
        padding: 12px;
    }
</style>
</head>
<body>
    <div class="outer">
        <form action="" name="updateEnrollForm">
            &nbsp<button>회원 정보 수정</button>
            <div>
                <fieldset>
                    <table id="updateForm">
                        <br>
                        <tr>
                            <th>아이디</th>
                            <td colspan="2">corin2</td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td colspan="2">이코린</td>
                        </tr>
                        <tr>
                            <th>새 비밀번호</th>
                            <td><input type="password" size="27" maxlength="15" placeholder="새 비밀번호를 입력하세요" required></td>
                            <td><p style="color: gray; font-size: 11px;">영어,숫자,특수문자 포함 8~15자리</p></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" size="27" maxlength="15" placeholder="비밀번호 확인"required></td>
                            <td><p style="color:gray; font-size: 11px;">비밀번호가 틀렸습니다.</p></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td>
                                <input type="text" size="4" maxlength="4"> 년 &nbsp;
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
                                </select> 월 &nbsp;
                                <input type="text" size="2" maxlength="2"> 일 &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="2">corin2@naevr.com&nbsp;&nbsp;<button>수정하기</button></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td colspan="2">010-2123-3232&nbsp;&nbsp;<button>수정하기</button></td>
                        </tr>
                    </table>
                    <br>
                </fieldset>

                <br>
                <div class="buttons" align="center">
                    <button>확인</button>
                    <button>취소</button>
                    <button>탈퇴하기</button>
                </div>
                
            </div>
            
        </form>
    </div>
    
    
</body>
</html>