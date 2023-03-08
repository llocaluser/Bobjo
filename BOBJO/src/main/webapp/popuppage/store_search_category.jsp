<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_location</title>

<script type="text/javascript">
	function setValues() {
		let text = opener.document.getElementsByName("srch_category")[0].value;
		let checkBox = document.getElementsByName("srch_category");
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

	<input type="checkbox" name="srch_category" value="'한식'">한식
	<input type="checkbox" name="srch_category" value="'일식'">일식
	<input type="checkbox" name="srch_category" value="'중식'">중식
	<input type="checkbox" name="srch_category" value="'양식'">양식
	<input type="checkbox" name="srch_category" value="'분식'">분식

	
	<hr>
	
    <input type="button" value="선택 완료" onclick="setParentText(); window.close();">

    <script>
        function setParentText(){
        	let elements = document.getElementsByName("srch_category");
        	let arr = new Array();
        	for(let i=0; i<elements.length; i++) {
        		if(elements[i].checked) {
        			arr.push(elements[i].value);
        		}
        	}
        	opener.document.getElementsByName("srch_category")[0].value = arr.join(",");
        }
    </script>
    
</body>
</html>