<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
/* 
  *  replaceAll을 사용하기 위해 선언
*/
String.prototype.replaceAll = function(search, replacement) {
		var target = this; return target.replace(new RegExp(search, 'g'), replacement); 
};


/*
 * 날자 기본값을 현재 날자로 설정	year month
 */
$(document).ready(function() {
 	//document.getElementById('cal1').valueAsDate =new Date();
	document.getElementById('cal2').valueAsDate = new Date();
	var now = new Date();			// 현재 날자
	var year = now.getFullYear();		// 년
	var month = now.getMonth()+1;	// 월
	var date = now.getDate();		// 일
/* 	
 	var d2 = new Date(); 
	d2.setDate(20);			// 일에 20일 세팅
 */
	//alert(now);
	//alert(year);
	//alert(month);
	//alert(date);
//	var work_dt = $("#cal2").val().replaceAll("-",""); // replaceAll  "-" 를 ""로 바꿈"
//	workMonth = work_dt.substring(0,6);			// 0~6 자리 까지만 가져오기 
	//alert(workMonth);
	//parseInt(workMonth) // String 을 int로 바꾸기 
	//emp_nm.trim().length           .trim() 함수는 앞뒤 공백을 없애주는 함수이다.
	
	
		var toDate = new Date();
	 	var week = toDate.getDay();//일 = 0, 월 = 1, 화 = 2, 수 = 3, 목 = 4, 금 = 5, 토 = 6 
	 	// 일주전
	    var startDate = new Date();
	    startDate.setDate(toDate.getDate()-7); 
	    var stYear= startDate.getFullYear();
	    var stMon = (startDate.getMonth()+1)>9 ? ''+(startDate.getMonth()+1) : '0'+(startDate.getMonth()+1);
	    var stDay = startDate.getDate()>9 ? ''+startDate.getDate() : '0'+startDate.getDate();
	    var startDt = stYear+stMon+stDay;
	    //alert("일주일 전 = " + startDt);
		// 하루전
	    var endDate = new Date();
	    endDate.setDate(toDate.getDate()-1);     // 하루전 세팅을 위해 toDate.getDate()-1   // 첫째날을 세팅하려면  toDate.getDate()-1 대신  1 을 입력
	    var endYear= endDate.getFullYear();
	    var endMon = (endDate.getMonth()+1)>9 ? ''+(endDate.getMonth()+1) : '0'+(endDate.getMonth()+1);
	    var endDay = endDate.getDate()>9 ? ''+endDate.getDate() : '0'+endDate.getDate();
	    var endDt = endYear+"-"+endMon+"-"+endDay;
	    // 하루 전날 날짜에 새팅
		document.getElementById('cal1').value = endDt;
});	    	


/*
 * 현재시간
 */
function getTime() { // return 10 --> 1000
	var today = new Date();
	var hour = today.getHours() + "";
	var minute = today.getMinutes() + "";
	return hour + minute;
}


/*
 * 조회시작일과 종료일의 일수 계산.
 */
function getDateDiffByDay(startYmd, endYmd) {
	startYmd = startYmd.replaceAll("-", "");
	endYmd = endYmd.replaceAll("-", "");
	var eDate = new Date(eval(endYmd.substring(0, 4)), eval(endYmd.substring(4,
			6)), eval(endYmd.substring(6, 8)));
	var sDate = new Date(eval(startYmd.substring(0, 4)), eval(startYmd
			.substring(4, 6)), eval(startYmd.substring(6, 8)));
	var eDate2 = eDate.getTime();
	var sDate2 = sDate.getTime();
	var cnt = eDate2 - sDate2;
	cnt = Math.floor(cnt / (24 * 3600 * 1000));
	return cnt;
}


/*
 * 조회시작월과 종료월의 월수 계산.
 */
function getDateDiffByMonth(startYm, endYm) {
	startYm = startYm.replaceAll("-", "");
	endYm = endYm.replaceAll("-", "");
	var eDate = new Date(eval(endYm.substring(0, 4)), eval(endYm
			.substring(4, 6)), 1);
	var sDate = new Date(eval(startYm.substring(0, 4)), eval(startYm.substring(
			4, 6)), 1);
	var eDate2 = eDate.getTime();
	var sDate2 = sDate.getTime();
	var cnt = eDate2 - sDate2;
	cnt = Math.floor(cnt / (24 * 3600 * 1000));
	cnt = Math.floor(cnt / 30);
	return cnt;
}


//두개의 날짜 사이의 총 일수를 구한다.
function getDiffDate(sdate, edate) {
 	var fromDate = new Date(Number(sdate.substring(0,4)),Number(sdate.substring(4,6))-1,Number(sdate.substring(6,8))-1);
	var toDate = new Date(Number(edate.substring(0,4)),Number(edate.substring(4,6))-1,Number(edate.substring(6,8)));

	var fromMillis = fromDate.getTime();
	var toMillis = toDate.getTime();
	return (toMillis - fromMillis) / (1000 * 60 * 60 * 24);
}


//천단위마다 쉼표 넣기
function _commify(n) {
	var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	n += '';                          // 숫자를 문자열로 변환

	while (reg.test(n)) {
		n = n.replace(reg, '$1' + ',' + '$2');
	}

	return n;
}


//해당월의 마지막 날짜 : _lastDateNum("20100501");
function _lastDateNum(sDate)
{
	var nMonth, nLastDate;

	nMonth = parseInt(sDate.substr(4,2), 10);
	if( nMonth == 1 || nMonth == 3 || nMonth == 5 || nMonth == 7  || nMonth == 8 || nMonth == 10 || nMonth == 12 )
		nLastDate = 31;
	else if( nMonth == 2 )
	{
		if( _isLeapYear(sDate) == true )
			nLastDate = 29;
		else
			nLastDate = 28;
	}
	else
		nLastDate = 30;

	return nLastDate;
}








/* 
 * 조회시작일과 종료일의 일수 계산.       replaceAll 없이 사용
*/
function dateDiff(_date1, _date2) {
    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
 
    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
 
    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
    diff = Math.ceil(diff / (1000 * 3600 * 24));
 
    return diff;
}




	function bankDisplay1(frm) {  // frm = select box 선택한 value값이 넘어옴
		$.ajax({
			url : "cars_selectbox2",
			type : "POST",
			dataType: "json",
			async: false,
			data : {
				"cars_company" : frm
			},
			success : function(data) {
				$("#select2 option").remove();    // select box (#select2) option를 초기화
				$("#select2").append("<option>차량명선택</option>");
				$("#select3 option").remove();    // select box (#select2) option를 초기화
				$("#select3").append("<option>등급선택</option>");
				//alert("data 길이 = " + data.carslist.length);
				$.each(data.carslist, function(i){
					//if(data.carslist.getRowCount() < 1) {
					//	alert("조회된 데이터가 없습니다.");
					//	return;
					//} else {
						$("#select2").append("<option value='"+data.carslist[i]['CARS_MODEL']+"'>"+data.carslist[i]['CARS_MODEL']+"</option>");
					//}
				}); 
			},
			error:function(jqXHR, textStatus, errorThrown){
                 alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            } 
		})
	}
	function bankDisplay2(frm) {  // frm = select box 선택한 value값이 넘어옴
		$.ajax({
			url : "cars_selectbox3",
			type : "POST",
			dataType: "json",
			async: false,
			data : {
				"CARS_MODEL" : frm
			},
			success : function(data) {
				$("#select3 option").remove();    // select box (#select2) option를 초기화
				$("#select3").append("<option>등급선택</option>");
				//alert("data 길이 = " + data.carslist.length);
				$.each(data.carslist, function(i){
					$("#select3").append("<option value='"+data.carslist[i]['CARS_MODEL_DETAILS']+"'>"+data.carslist[i]['CARS_MODEL_DETAILS']+"</option>");
				}); 
			},
			error:function(jqXHR, textStatus, errorThrown){
                 alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            } 
		})
	}
	
	$(document).ready(function(){
		$("#search_btn").on("click",function(){
			 var allData = {
					 		"CARS_COMPANY": $("#select1").val(),
					 		"CARS_MODEL": $("#select2").val(),
					 		"CARS_MODEL_DETAILS": $("#select3").val() 
					 		
			 				};
			 //alert(JSON.stringify(allData));
			 
			 $.ajax({
					url : "cars_list",
					type : "POST",
					dataType: "json",
					async: false,
					data : allData,
					success : function(data) {
						if (!data.carslist.length) {
							alert(" 조회 데이터가 없습니다. ");
							return false;
						} else {
							$.each(data.carslist, function(i){
								$("tbody *").remove();
								$.each(data.carslist, function(i){
									$("tbody").append("<tr><td>"+data.carslist[i]['POST_NO']+"</td><td>"+data.carslist[i]['CARS_SUBJECT']+
											"</td><td>"+data.carslist[i]['MEM_ID']+"</td><td>"+data.carslist[i]['ENROLLMENT_DATE']+
											"</td><td>"+data.carslist[i]['COMPANY']+"</td><td>"+data.carslist[i]['MODEL']+
											"</td><td>"+data.carslist[i]['MODEL_DETAILS']+"</td></tr>");
									return true;
								});
							}); 
						}
					},
					error:function(jqXHR, textStatus, errorThrown){
		                 alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		            } 
				})
			 
			 
		})
	})
	
	
/* getDateDiffByMonth */
	$(document).ready(function(){
		$("#btn").on("click",function(){
			if ($("#cal1").val() == "") {
				alert("검색 시작월이 없습니다");
				return false;
			} else if ($("#cal2").val() == "") {
				alert("검색 종료월이 없습니다");
				return false;
			}
			var start_date = $("#cal1").val().replaceAll("-",""); 
			toDate = start_date.substring(0,8);
			var start_date = $("#cal2").val().replaceAll("-",""); 
			workDate = start_date.substring(0,8);
			
			
			if (parseInt(toDate) >= parseInt(workDate)) {
				alert("시작날자는 종료날자보다 빨라야 한다.");
				return;
			}
			var a = $("#cal1").val().substr(0,4); // substr - 0 자리 부터 4개
			var s = $("#cal1").val().substring(5,7); // 5번째부터 7번째 자리 까지
			var d = $("#cal1").val().substr(8,2);
			alert($("#cal1").val().split('-'));
			alert(a);
			alert(s);
			alert(d);
			alert(strArray[1] + " @ " + strArray[2] + " @ " + strAtrray[3])
			 
			alert('조회 시작일과 종료일 까지의 차이는 ' + getDateDiffByDay($("#cal1").val(), $("#cal2").val()) + '일 입니다.');

			/* 
			var monCnt = getDateDiffByDay($("#cal1").val(), $("#cal1").val());
				alert("조회 일수 차이 = " + monCnt); */
		})
	})
	
	
	
	
//					var frm = document.search_form;
//					frm.method = "post";
//					frm.action = "list";
//					frm.submit();




//		 			$("#search_form").attr("method","post");
//		 			$("#search_form").attr("action","list");
//		 			$("#search_form").submit();	



//					$("#search_form").attr("action","list").submit();
</script>
</head>
<body>
	<select name="select1" id="select1" onchange="bankDisplay1(this.value)" >
		<option>제조사선택</option>
		<c:forEach items="${list }" var="carslist">
			<option value="${carslist.CARS_COMPANY}">${carslist.CARS_COMPANY}</option>
		</c:forEach>
	</select>
	<select name="select2" id="select2"  onchange="bankDisplay2(this.value)">
		<option>차량명선택</option>
	</select>
	<select name="select3" id="select3">
		<option>등급선택</option>
	</select>
	<input type="button" id="search_btn" name="search_btn" value="검색">
	<br>
	<table border="1">
		<thead>
		<tr>
			<td>
				게시번호
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
			<td>
				회사
			</td>
			<td>
				차량
			</td>
			<td>
				세부사항
			</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${data.carslist }" var="carslist"> 
			<tr>
				<td>
					${carslist.post_no}
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
				<td>
					회사
				</td>
				<td>
					차량
				</td>
				<td>
					세부사항
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br>
	<br>
	<input type="date" id="cal1" name="cal1" >	~  
	<input type="date" id="cal2" name="cal2">	
<!-- 	<input type="month" id="cal1">	~  
	<input type="month" id="cal2">	 -->
	<input type="button" id="btn" name="btn" value="검색">
</body>
</html>