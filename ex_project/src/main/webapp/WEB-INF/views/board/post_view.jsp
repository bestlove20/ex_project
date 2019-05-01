<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#list_views").on("click",function(){
			location.href = "main";
		})
		
		$("#post_insert").on("click", function(){
			var s_mem_id = $('#s_mem_id').val();
			var subject = $('#subject').val();
			var content = $('#content').val();
			if (s_mem_id == '') { // 세션id 체크해서 로그인 확인
				alert("로그인후 이용해주세요");
				location.href = "login_page";
			} if(subject == ''){
				alert("제목을 입력해주세요.");
				$("#subject").focus();
			} else if(content == null){
				alert("본문을 입력해주세요.");
				$("#content").focus();
			}  else {
				$.ajax({
					url : "post_insert",
					type : "post",
					data : {
						"mem_id" : s_mem_id,
						"subject" : subject,
						"content" : content
					},
					success : function(data) {
						//alert(JSON.stringify(data.msg));
						if(data.msg < 1){
							alert("게시글 등록 실패")
						} else {
							alert("게시글 등록 성공")
							location.href = "main";
						}
					},
					error:function(jqXHR, textStatus, errorThrown){
			             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			        }
				}) 
			}
		})
		
		
		$("#post_update").on("click", function(){
			var subject = $('#subject').val();
			var content = $('#content').val();
			var post_no = $('#post_no').val();
			if(subject == ''){
				alert("제목을 입력해주세요.");
				$("#subject").focus();
			} else if(content == ''){
				alert("본문을 입력해주세요.");
				$("#content").focus();
			} else {
				$.ajax({
					url : "post_update",
					type : "post",
					data : {
						"post_no" : post_no,
						"subject" : subject,
						"content" : content
					},
					success : function(data) {
						//alert(JSON.stringify(data.msg));
						if(data.msg < 1){
							alert("게시글 수정 실패")
						} else {
							alert("게시글 수정 성공")
							location.href = "main";
						}
					},
					error:function(jqXHR, textStatus, errorThrown){
			             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			        }
				}) 
			}
		})
	})

</script>
<body>
<input type="hidden" id="post_no" name="post_no" value="${list.POST_NO}">
<input type="hidden" id="s_mem_id" name="s_mem_id" value=" ${member_map.MEM_ID }">

	<table>
		<tr>
			<td>	
				작성자
			</td>
			<td>
				<c:if test="${list.MEM_ID == null }">
					${member_map.MEM_ID }
				</c:if>
				<c:if test="${list.MEM_ID != null}">
					${list.MEM_ID}
				</c:if>
			</td>
		</tr>
		<tr>
			<td>	
				제목
			</td>
			<td>
				<input type="text" id="subject" name="subject" value="${list.SUBJECT}">
			</td>
		</tr>
		<tr>
			<td>	
				본문
			</td>
			<td>
				<input type="textarea" id="content" name="content" value="${list.CONTENT}">
			</td>
		</tr>
		<tr>
			<td>	
				작성일
			</td>
			<td>
				${list.REG_DATE}
			</td>
		</tr>
	</table>
	<input type="button" id="list_views" name="list_views" value="목록">
	<c:if test="${list.MEM_ID == null}">             <!-- 로그인이 되잇어야지 게시글 등록할수있게 체크 -->
		<input type="button" value="게시글 등록" id="post_insert" name="post_insert">
	</c:if>
	<c:if test="${list.MEM_ID == member_map.MEM_ID}"> <!-- 작성자 id와 로그인한 id가 같은지 확인후 수정 -->
		<input type="button" value="수정" id="post_update" name="post_update">
	</c:if>
</body>
</html>