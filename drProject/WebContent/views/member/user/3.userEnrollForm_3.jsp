<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        fieldset{
            /* width:80%; */
            margin:auto;
            margin-top:50px;
            padding:10px 20px;

        }
        fieldset p{
            text-align:center;
        }

        
        
    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>    

    <fieldset>
        <div>
            <p style="font-weight:bold; font-size:17px;">회원가입이 완료되었습니다.</p>
            <p>Daily Routine과의 즐거운 운동시간 되시길 바랍니다.</p>
        </div>
    </fieldset>

    <button id="btn" align="center" type="submit" onclick="main();">홈 바로가기</button>

    <script>
        function main(){
            location.href= "<%=request.getContextPath() %>/";
        }
    </script>
</body>
</html>