<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_location</title>

<script type="text/javascript">
	function setValues() {
		let text = opener.document.getElementsByName("srch_location")[0].value;
		let checkBox = document.getElementsByName("srch_location");
		for(let i=0; i<checkBox.length; i++) {
		   	if(text.includes(checkBox[i].value)) {
			   	console.log(checkBox[i]);
			   	checkBox[i].checked = true;
		   	}
		}
	}
</script>

</head>
<body onload="setValues();">

	<form name="frm">
	<input type="checkbox" name="srch_location" value="'강남구'">강남구
	<input type="checkbox" name="srch_location" value="'강동구'">강동구
	<input type="checkbox" name="srch_location" value="'강서구'">강서구
	<input type="checkbox" name="srch_location" value="'관악구'">관악구
	<input type="checkbox" name="srch_location" value="'광진구'">광진구
	<input type="checkbox" name="srch_location" value="'구로구'">구로구
	<input type="checkbox" name="srch_location" value="'금천구'">금천구
	<input type="checkbox" name="srch_location" value="'노원구'">노원구
	<input type="checkbox" name="srch_location" value="'도봉구'">도봉구
	<input type="checkbox" name="srch_location" value="'동대문구'">동대문구
	<input type="checkbox" name="srch_location" value="'동작구'">동작구
	<input type="checkbox" name="srch_location" value="'마포구'">마포구
	<input type="checkbox" name="srch_location" value="'서대문구'">서대문구
	<input type="checkbox" name="srch_location" value="'서초구'">서초구
	<input type="checkbox" name="srch_location" value="'성동구'">성동구
	<input type="checkbox" name="srch_location" value="'성북구'">성북구
	<input type="checkbox" name="srch_location" value="'송파구'">송파구
	<input type="checkbox" name="srch_location" value="'양천구'">양천구
	<input type="checkbox" name="srch_location" value="'영등포구'">영등포구
	<input type="checkbox" name="srch_location" value="'용산구'">용산구
	<input type="checkbox" name="srch_location" value="'은평구'">은평구
	<input type="checkbox" name="srch_location" value="'종로구'">종로구
	<input type="checkbox" name="srch_location" value="'중구'">중구
	<input type="checkbox" name="srch_location" value="'중랑구'">중랑구
	
	<hr>
	
    <input type="button" value="선택 완료" onclick="setParentText(); window.close();">
    
	</form>
    <script>
        function setParentText(){
        	let elements = document.getElementsByName("srch_location");
        	let arr = new Array();
        	for(let i=0; i<elements.length; i++) {
        		if(elements[i].checked) {
        			arr.push(elements[i].value);
        		}
        	}
        	opener.document.getElementsByName("srch_location")[0].value = arr.join(",");
        }
    </script>
    
</body>
</html>