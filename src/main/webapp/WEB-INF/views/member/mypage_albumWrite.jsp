<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
/* function moveClose() {
  opener.location.href="albumWrite.do";
  self.close();
} */

function goSubmit() {
	 var id = document.frm1.id.value ;
	 var travel_name=  document.frm1.travel_name.value; 
    window.opener.name = "album.do?id="+id+"&travel_name="+travel_name; // 부모창의 이름 설정
    document.frm1.target = "album.do?id="+id+"&travel_name="+travel_name; // 타켓을 부모창으로 설정
    document.frm1.submit();
    self.close();
}
</script>
<title>Insert title here</title>
</head>
<body>
 
 <form action="albumInsert.do" name="frm1" method="post" enctype="multipart/form-data"> 
      
     <table>
     
        <tr>
          <td>이름: </td>
          <td><input type="text" name="albumname"/></td>
        </tr>
        <tr>
          <td>파일: </td>
          <td><input type="file" name="uploadfile"></td>
        </tr>
        <tr>
        <td>
          <c:forEach var="id" items="${id}">
				<input type="hidden" value="${id}" name="id" readonly/>
		</c:forEach>
		<c:forEach var="travel_name" items="${travel_name}">
				<input type="hidden" value="${travel_name}" name="travel_name"  readonly/>
		</c:forEach>
        </td>
        </tr>
        <tr>
          <td><input type="submit" value="등록" onclick="goSubmit()"> </td>
          <td><input type="reset" value="취소"></td>
          <td><input type="button" value="목록" onclick="goSubmit()"></td>
        </tr>
 
     </table>
     
   </form>
 
  
</body>
</html>