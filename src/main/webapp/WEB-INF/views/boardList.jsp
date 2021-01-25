<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>

</head>
<body
	style="background-color:#f5f5f5; font-family: 'Poor Story', cursive;">
	<div style='float: left; width: 50%; padding-left: 5%;'>
		<div id="errcontent"></div>
	</div>
	<div
		style='float: right; width: 50%; padding-top: 5%; padding-left: 3%;'>
		<div id="errcontent1"></div>
	</div>
</body>

<script type="text/javascript">

	window.onload = function() { 
	//window가 실행되면 무조건 실행

		var str = "";
		//현재 sessionStorage의 길이를 계산
		var length = sessionStorage.length;
		//'number' sessionStorage 값을 가져옴
		var count1 = sessionStorage.getItem("number");
		
		str += "<div class='container'><div class='table-responsive' style='padding-top:5%;float:left;width:50%;'>"
		str += "<h1><strong>게시판</strong></h1><table border=2 class='table table-striped table-sm'><tr>";
		str += "<td><strong>NO</strong></td>";
		str += "<td><strong>제목</strong></td>";
		str += "<td><strong>등록자명</strong></td>";
		str += "<td><strong>등록일</strong></td></tr>";

		//sessionStorage 에 들어간 값이 하나도 없으면
		if (length ==0 || length == 1) 
			str += "<tr><td colspan='4' align='center'>등록된 글이 없습니다.</td></tr>";
		
		//sessionStorage 에 들어간 값이 하나라도 있을 경우
		else {
			
			var i = 0;
			do {

					while(sessionStorage.getItem(i) == null) i++;
					
					//','를 기준으로 잘라서 배열 'array'에 넣어줌
					var array = sessionStorage.getItem(i).split(',');
					console.log(array);

					//<tr> 열을 클릭하면 getTable(i)함수 호출
					str += "<tr onclick='getTable(" + (i) + ")'>";

						str += "<td>";
						str += "<input type='text' id='no' style='width:40px;background-color:#f5f5f5;border:none;outline:none;'name='no"
								+ (i + 1) + "' readonly value=" + (i + 1) + ">";
						str += "</td>";

						//array.length만큼 for문
						for(var j=0; j<array.length; j++) {
							//content가 있는 자리면 건너뛰기
							if(j==2) j++;
							str += "<td style='cursor:pointer;'>";
							str += array[j];
							str += "</td>";
						}
					
					str += "</tr>";
					
				i++;
						
			} while (i < count1);
		}

		str += "</table><br><h3><a href='moveInsertBoard.do'>글 쓰기</a></h3><br>";
		str += "<button type='button'onclick='clearSession()'class='btn btn-primary'>세션스토리지값 초기화</button>"
		str += "</div></div>";
		
		document.getElementById("errcontent").innerHTML = str;

	}

	//table에 <tr> 열을 클릭하면 실행
	$(function(){
		
        $("table tr").click(function(){
            
        	$('table tr').eq(0).not('table tr').css('color', 'black');
            //table tr 글씨 색상을 black으로 초기화
        	$("table tr").css("color", "black");
        	//클릭된 <tr> 해당열의 글씨 색상을 바꿈
        	$(this).css("color", "#8181F7");
        	$("tr:first").css("color", "black");
        	
        });
        
    });

	//<tr> 열을 클릭하면 실행
	function getTable(i) {

		var array = sessionStorage.getItem(i).split(',');
		var str2 = "";

		str2 += "<h1><strong>[내용]</strong></h1><br>";

		//content 내용 출력
		str2 += "<div style='float:left;'><h1>"+ array[2] + "</h1></div><br>";

		str2 += "<div style='padding-top:25%;'><button type='button'onclick='deleteTable("+i+")'class='btn btn-basic'>해당 글 삭제</button></div>"
		str2 += "<div style='padding-top:5%;'><button type='button'onclick='updateTable("+i+")'class='btn btn-basic'>해당 글 수정</button></div>"

		document.getElementById("errcontent1").innerHTML = str2;
		
	}

	//세션스토리지값 초기화 버튼을 누를 시에는 모든 스토리지 초기화
	function clearSession() {
		
		sessionStorage.clear();
		location.reload();
		
	}

	//해당 글 삭제 버튼을 눌렀을 때 실행
	function deleteTable(i) {
		
		sessionStorage.removeItem(i);
		var eq = i+1;
		$('table tr').eq(eq).remove();
		location.reload();
		
	}

	//해당 글 수정 버튼을 눌렀을 때 실행
	function updateTable(i) {
		
		sessionStorage.setItem("update", i);
		window.location.href="/web/updateBoard.do";
		
	}
	
</script>

</html>