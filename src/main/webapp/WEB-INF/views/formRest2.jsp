<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form Rest - @PathVariable 사용 예제</title>

   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

   <script type="text/javascript">   
      $(document).ready(function() {
         
         // [전송2 버튼 click 이벤트 핸들러]
         $("#btnLogin1").on('click', function(e){
        	 var name = $('#name').val();
        	 var grade = $('#grade').val();
        	 
        	 // 화면에서 입력한 값으로 자바스크립트 객체 생성
        	 var scriptObj = new Object();
        	 scriptObj.name = name;
        	 scriptObj.grade = grade;
        	 
        	 // 자바스크립트 객체를 json 형태의 문자열로 변환
        	 // ({"키" : "값", "키1" : "값1"})
        	 	var jsonMember = JSON.stringify(scriptObj);
        	 	console.log(jsonMember);
        	 	
        	 	// @RequestBody 테스트용 ajax 호출
        	 	$.ajax ({
        	 		url : "${pageContext.request.contextPath}/restAction1.do/"
        	 		+name+"/"+grade,type:"post",dataType:"text",contentType:"application/json",
        	 		/*data : jsonMember,*/
        	 		success : function(data) {
        	 			console.log("success");
        	 			console.log(data);
        	 			
        	 			$('#resultDiv').html(data);
        	 			
                  }, // success
                   error : function(xhr, status) {
                	  console.log("failure");
                      console.log(xhr+" : "+status);
                  } 
             }); // $.ajax
          });   //버튼 click 이벤트 핸들러 끝
      	/*
      	 [버튼2 click 이벤트 핸들러]
      	*/
      	 $("#btnLogin2").on('click', function(e){
        	 var name = $('#name').val();
        	 var grade = $('#grade').val();
                 
        	// 화면에서 입력한 값으로 자바스크립트 객체 생성
        	 var scriptObj = new Object();
        	 scriptObj.name = name;
        	 scriptObj.grade = grade;
        	 
        	 // 자바스크립트 객체를 json 형태의 문자열로 변환
        	 // ({"키" : "값", "키1" : "값1"})
        	 	var jsonMember = JSON.stringify(scriptObj);
        	 	$.ajax ({
        	 		url : "${pageContext.request.contextPath}/restAction2.do",
        	 		type:"post",dataType:"text",contentType:"application/json",
        	 		data : jsonMember,
        	 		success : function(data) {
        	 			console.log("success");

        	 				var jsonInfo = JSON.parse(data);
        	 				// Json 문자열 -> 자바스크립트 객체로 변환
        	 				console.log(jsonInfo);
        	 				
        	 				//html 생성
        	                   var table = "<table border='1'><tr><td>이름</td><td>학년</td></tr>";
        	                     table += '<tr>';
        	                     table += '<td>' + jsonInfo.name + '</td>';   
        	                     table += '<td>' + jsonInfo.grade + '</td>';   
        	                     table += "</tr>";
        	                     table += "</table>";
        	                        
        	                        $('#resultDiv').html(table);
        	 		 }, // success
                     error : function(xhr, status) {
                    	 console.log("failure");
                        console.log(xhr+" : "+status); // 에러 코드
                    } 
               }); // $.ajax
            });   //버튼2 click 이벤트 핸들러 끝
         
      }); // ready
   </script>
</head>
<body>

   <form name="formm" id="formm"  
        method="post" 
        action="${pageContext.request.contextPath}/restAction1.do">
        
     <input type="text" name="name" id="name" value="${name}" /><br>
     <input type="text" name="grade" id="grade" /><br>
      <input type="button" id="btn1" value="전송1" />
      <input type="button" id="btn2" value="전송2" />
   </form>
   <div id="resultDiv"></div>
</body>
</html>