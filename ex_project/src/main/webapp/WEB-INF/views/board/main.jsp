<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.aaa ul li {
		float: left;
		padding: 18px;
		list-style:none;
}
</style>

<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#write").on("click",function(){
			var s_mem_id = $('#s_mem_id').val();  // hidden에 있는 session id를 가져와 null값 체크후 글쓰기 페이지 이동
			if(s_mem_id != null){
				location.href = "post_view";	
			} else {
				alert("로그인후 이용해주세요.");
				location.href = "login_page";	
			}
						
		})
	})
/* 체크 박스 */
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkAll").click(function(){
        //클릭되었으면
        if($("#checkAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
})
$(document).ready(function(){
	 $("input[name=check]").on("click",function(){
		var test = $("input:checkbox[name=check]").length // check 전체 개수
		var tset1 = $("input:checkbox[name=check]:checked").length // check 선택된 개수
		if(test == tset1){
			 $("input[name=checkAll]").prop("checked",true);
		} else {
			$("input[name=checkAll]").prop("checked",false);
		}
	 })
})


 /* 게시글 삭제 */
	$(document).ready(function(){
		 $("#post_delete").click(function(){
			if ($("input[name=check]").is(':checked') == false) {
					alert("삭제할 항목을 체크해주세요.");
			} else {
				var checkRow = "";
				
				$( "input[name='check']:checked" ).each (function (){
					checkRow +=  $(this).val()+"," ;
				});
				
				checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); 
				
				$.ajax({
					url : "post_delete",
					type : "post",
					data : {
						"post_no" : checkRow
					},
					success : function(data) {
						location.href="main";
						alert("data"+ data.resultMap.msg );
						//+ data.resultMap.msg
					},
					error:function(jqXHR, textStatus, errorThrown){
		                 alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            }
				})
			 }
		 })
	})
	
	/* 검색창 */
	$(document).ready(function(){
			$("#search_btn").on("click",function(){
				var search_txt = $("#search_txt").val(); 
				if(search_txt == ""){
					alert("검색어를 작성해주세요 ")
					$("#search_btn").focus();
				} else {
					var frm = document.search_form;
					frm.method = "post";
					frm.action = "main";
					frm.submit();
				}
			})
		})
</script>
</head>
<body>
<!-- session 저장 data -->
	id	= ${sessionScope.member_map.MEM_ID }<br>
	name = ${member_map.MEM_NAME }<br>
	id = ${member_map.MEM_ID }<br>
	job = (${member_map.MEM_JOB }) 
	
	
	<input type="hidden" id="s_mem_id" name="s_mem_id" value=" ${member_map.MEM_ID }">
	<table border="1">
		<tr>
			<td>
				<input type="checkbox" id="checkAll" name="checkAll">
			</td>
			<td>
				게시글 번호
			</td>
			<td>
				제목
			</td>
			<td>
				작성자
			</td>
			<td>
				작성일
			</td>
			
		</tr>	
 		<c:forEach var="boardlist" items="${list }">
			<tr>
				<td>	
					<input type="checkbox" id="check" name="check" value="${boardlist.POST_NO}" >
				</td>
				<td>
					${boardlist.POST_NO}
				</td>
				<td>
					<a href="post_View?post_no=${boardlist.POST_NO}">${boardlist.SUBJECT}</a>
				</td>
				<td>
					${boardlist.MEM_ID}
				</td>
				<td>
					<fmt:formatDate value="${boardlist.REG_DATE}" pattern="yyy-MM-dd"/>
				</td>	
			</tr>
		</c:forEach>
	</table>
			<div class="row" style="height: 50px;">  <!-- 페이징 -->
		            <div class="aaa">
		            	<ul class="pagination" style="padding:0; margin:0 auto;">
		            	<c:if test="${pg.startPage > pg.pageBlock}">
						  <li class="page-item"><a class="page-link" href="board_list?currentPage=${pg.startPage - pg.pageBlock}">Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						  <li class="page-item"><a class="page-link" href="board_list?currentPage=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${pg.endPage < pg.totalPage}">
						  <li class="page-item"><a class="page-link" href="board_list?currentPage=${pg.startPage + pg.pageBlock}">Next</a></li>
						</c:if>
						</ul>
		            </div>
	      	</div> 
	      	<br>
	      	<form id="search_form" name="search_form">
	      		<select id="search_number" name="search_number">
		      		<option value="1">제목+내용</option>
		      		<option value="2">제목</option>
		      		<option value="3">내용</option>
		      		<option value="4">닉네임</option>
		      	</select>
		      	<input type="text" id="search_txt" name="search_txt">
		      	<input type="button" id="search_btn" name="search_btn" value="검색"> 
	      	</form>
			<br>	      	
	      	<input type="button" id="write" name="write" value="글쓰기">
	      	<input type="button" id="post_delete" name="post_delete" value="삭제">
</body>
</html>