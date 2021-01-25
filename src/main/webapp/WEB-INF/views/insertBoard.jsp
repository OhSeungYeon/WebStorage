<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
</head>
<body style="background-color:#f5f5f5;font-family:'Poor Story', cursive;" align='center'>
	<h1><strong>글 쓰기</strong></h1>
	<hr>
	<div class="container">
	<form id="frm" name="frm" action="<c:url value='/web/getBoardList.do' />" method="post">
		<table align="center" border="2" class="table table-condensed" style="width:500;height:200;">
			<tr>
				<td bgcolor="#CED8F6" width="70"><h3>제목</h3></td>
				<td align="left">
					<input type="text" id="title" name="title" class="form-control">
					
				</td>
			</tr>
			<tr>
				<td bgcolor="#CED8F6"><h3>작성자</h3></td>
				<td align="left">
					<input type="text" id="writer" name="writer" class="form-control" size="10" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#CED8F6"><h3>내용</h3></td>
				<td align="left">
					<textarea id="content" name="content" class="form-control" cols="40" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type='button'name="write" id="write"class='btn btn-primary'>쓰기</button>
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<h3><a href="getBoardList.do">글 목록 가기</a></h3>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function (e){

		//쓰기 버튼을 클릭했을 경우
		$('#write').click(function(){

			//sessionStorage에 들어간 값이 하나도 없으면
			if(sessionStorage.length == 0) {
				//초기값을 0으로하는 'number' storage 만들기
				var count = 0;
				sessionStorage.setItem("number", count);
			}

			//작성한 게시물 정보들을 가져와 배열 'array'에 넣어준다.
			var title = $('input[name=title]').val();
			var writer = $('input[name=writer]').val();
			var content = document.getElementById('content').value;
			var today = getToday(); 
			var array = [title, writer, content, today];
			//'number' storage의 값을 가져와서 그 값을 이름으로 하는 storage 안에 배열 'array' 넣어주기
			sessionStorage.setItem(sessionStorage.getItem("number"), array);

			var count1 = sessionStorage.getItem("number");
			count1++;
			sessionStorage.setItem("number", count1);
			
			$('#frm').submit();
			
		});
	});

	//게시물을 등록하는 시간을 계산
	function getToday() {
		
		var date = new Date();	
		return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2) + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();	
		
	}
	
</script>
</html>