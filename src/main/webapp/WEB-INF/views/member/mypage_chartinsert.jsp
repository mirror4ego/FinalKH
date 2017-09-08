<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  .table1 {

	border: none;
	float: left;
	padding-top: 20px;
	padding-bottom: 50px;
}
.div1:after{content:"";display:block;clear:both;}
</style>
<script language="javascript">
function goSubmit() {
	 var id = document.frm.id.value ;
	 var travel_name=  document.frm.travel_name.value;
      window.opener.name = "mypageMain.do?id="+id; // 부모창의 이름 설정
   document.frm.target = "mypageMain.do?id="+id; // 타켓을 부모창으로 설정
   document.frm.submit();
   opener.parent.location.reload();
   self.close();
} 
  </script>
</head>
<body>
<form name="frm" action="chartInsert.do">
<input type="hidden" name="id" value=${id }>
<pre><input type="hidden" name="travel_name" value=${travel_name }></pre>
<div class="div1">
<table class="table1">
  <tr>
    <td>비행기</td>
  </tr>
    <tr>
    <td>대중교통</td>
  </tr>
    <tr>
    <td>숙소</td>
  </tr>
    <tr>
    <td>투어</td>
  </tr>
    <tr>
    <td>식사</td>
  </tr>
</table>

 <div class="ui input">
<table class="table1" >
<tr>
  <td><input type="text"  name="flight"></td>
</tr>
<tr>
  <td><input type="text"  name="transfer"></td>
</tr>
<tr>
  <td><input type="text"  name="hotel"></td>
</tr>
<tr>  
  <td><input type="text"  name="tour"></td>
</tr>
<tr>
  <td><input type="text"  name="meal"></td>
</tr>
</table>
 </div></div>

 <table>
    <tr>
      <td><input type="submit" value="만들기" onclick="goSubmit()"></td>
     <!--  <td><input type="button" value="뒤로 가기" onclick="location.href='travelWrite.do?id=id&travel_name=travel_name' "> -->
    </tr>
 </table>
</form>
</body>
</html>