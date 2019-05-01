<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(document).ready(function() {
//	alert("시작");
	/* var value = document.getElementById('cal2').text();
	var a =	document.getElementById("node_div").item(1);
	var b =	document.getElementsByClassName("node_ul").item(2);
	var c =	document.getElementsByTagName("node_li").item(1);
	//id가empty인 노드를 구한다.

	var empty = document.getElementsByClassName("node_ul");
	var children = empty.childNodes;
	 
	for(var i = 0; i < children.length; i++){
		alert(children[i].html) ;
	}

	alert("a"+a);
	alert("b"+b);
	alert("c"+c); */
	var d =	document.getElementsByClassName("node_li").length;  // node_li 개수
//	alert("d = " + d);
});
$(document).ready(function(){
	$("#test").on("click",function(){
	//	var select = $("ul.node_ul ").children().last().text();			//	.eq(index)	찾은 요소 n번째 접근하기
		var select = $(".node_ul ").children().eq(8).text();			//	.last() 마지막 자식 노드 접근
	//	var select = $("ul.node_ul ").children().eq(8).append("<input type='button' value='test'>");
	//	var select = $(".node_ul ").children().next().text();
		alert(select);
	})
})

/* 
1. parentNode : 부모 노드
2. childNodes : 자식 노드 리스트
3. firstChild : 첫 번째 자식 노드
4. lastChild : 마지막 자식 노드
5. nextSibling : 다음 형제 노드
6. previousSibling : 이전 형제 노드
- .eq(index)	찾은 요소 n번째 접근하기
- .last() 마지막 자식 노드 접근
- .first() 첫번째 자식 노드 접근
- .remove() 삭제
- .next()  다음 형제 노드 찾기
- .prev()  이전 형제 노드 찾기
- 텍스트 노드 생성 : $("텍스트")
- 텍스트 노드 추가 : $기준노드.append("텍스트")
- 텍스트 노드 변경 : $기준노드.text("새로운 텍스트")


https://mingggu.tistory.com/28
https://crosstheline.tistory.com/41
 */
</script>
<body>
<span><input type="button" id="test" name="test" value="test"> </span>
	<div class="node_div">
		<ul class="node_ul" id="aaa">
			<li class="node_li">1</li>
			<li class="node_li">2</li>
			<li class="node_li">3</li>
			<li class="node_li">4</li>
			<li class="node_li">5</li>
			<li class="node_li">6</li>
		</ul>
		<ul class="node_ul">
			<li class="node_li">a</li>
			<li class="node_li">b</li>
			<li class="node_li">c</li>
			<li class="node_li">d</li>
			<li class="node_li">e</li>
			<li class="node_li">f</li>
		</ul>
		<ul class="node_ul">
			<li class="node_li">ㄱ</li>
			<li class="node_li">ㄴ</li>
			<li class="node_li">ㄷ</li>
			<li class="node_li">ㄹ</li>
			<li class="node_li">ㅁ</li>
			<li class="node_li">ㅂ</li>
		</ul>
	</div>
	
	
</body>
</html>