<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ht게시글 등록</title>
</head>
<body>
    <form action="<%= request.getContextPath()%>/htPostInsert.aht" method="post">
    
        <div class="buttons">
            <a href="<%= request.getContextPath()%>/htPostForm.aht"><input type="button" value="게시글 등록"></a>
            <!-- 게시물 조회 리스트에서 글 detail view에서 수정? -->
            <a href="<%= request.getContextPath()%>/htListView.aht"><input type="button" value="게시글 수정"></a>
        </div>

        <br>
        <form action="<%= request.getContextPath()%>/htPostForm.aht" class="enrollForm" method="post">
            <!-- 글번호, 카테고리, 제목, 작성자, 작성일, 수정일, 조회수 -->
            <table class="postArea" align="center">
                    <thead>
                        <tr>
                            <th width="70">카테고리</th>
                            <td width="500">
                                <select name="category" id="category">
                                    <option value="">전체</option>
                                    <option value="">전신 운동</option>
                                    <option value="">코어 운동</option>
                                    <option value="">상체 운동</option>
                                    <option value="">하체 운동</option>
                                    <option value="">스트레칭</option>
                                </select>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td colspan="2"><input type="text"></td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr>
                            <th>영상 첨부</th>
                            <td colspan="2"><input type="text"></td>
                        </tr>
                        <tr></tr>
                        <tr></tr>

                        <tr>
                            <td></td>
                            <td colspan="2"><input type="text" placeholder="HT 게시글 제목"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"><textarea name="" id="" cols="30" rows="5" placeholder="HT 간략설명">복근운동입니다.</textarea></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td colspan="2"><textarea name="" id="" cols="30" rows="5" placeholder="HT 권장사항">복근 힘을 기르고 싶은 분들께 추천합니다.</textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"><textarea name="" id="" cols="30" rows="5" placeholder="HT 간략설명">첫 번째로 적당한 의복을 갖춘 후 두 번째, 열심히 헛둘헛둘하면 됩니다.</textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"><textarea name="" id="" cols="30" rows="5" placeholder="HT 운동주의사항">주의사항입니다.</textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"><textarea name="" id="" cols="30" rows="10" placeholder="HT 게시글 내용">하루라도 더 젊을 때 운동을 시작해야 겠다는 생각이 들었을 때 하기 좋은 운동입니다. </textarea></td>
                        </tr>
                    </tbody>
            </table>
        <br>

        <div class="buttons2" align="center">
            <input type="submit" value="등록"></a>
            <a href="<%= request.getContextPath()%>/htPostForm.aht"><input type="button" value="취소"></a>
        </div>
    </form>
        


</body>
</html>