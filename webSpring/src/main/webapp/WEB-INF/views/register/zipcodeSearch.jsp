<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header, footer{
		display: none;
	}
	#zipcodeList>li:hover{
	cursor : pointer;
	bacground :#ddd;
	}
</style>
<script>
	$(function(){
		$(document).on('click','#zipcodeList>li',function(){
			var address = $(this).text();
			var zip = address.substring(0,5);
			var addr= address.substring(6);
			
			//opener.document.getElementById("zipcode").val(zip);
			opener.document.getElementById("zipcode").value=zip;
			opener.document.getElementById("addr").value=addr;
			self.close();//window.close();'
		});	
	});
</script>
<div class="container">
	<div>
		도로명 입력후 우편번호를 검색하세요<br/>
		(예: 백옥대로 1길)<br/>
		<form>
			도로명 : <input type="text" name="doroname" id="doroname"/>
			<input action="zipcodeSearch" id="zipSearchFrom" method="get" type="submit" value="우편번호 검색"/>
			
		</form>
	</div>
	<hr/>
	<div>
		<ul id="zipcodeList">
			<c:if test="${zipList != null}">
				<c:forEach var="zipDTO" items="${zipList}">
					<li> ${zipDTO.zipcode }${zipDTO.sido}${zipDTO.doroname},${zipDTO.dong }<c:if test="${zipDTO.buildname!=null}">,${zipDTO.buildname},</c:if>${zipDTO.dong}${zipDTO.bungi1}<c:if test="zipDTO.bungi2>0">-${bungi2 }</c:if></li>
				</c:forEach>
			</c:if> <!-- 검색주소 있을때. -->
			<c:if test="${zipList==null}">
				<li>
					검색한 주소가 없습니다.
				</li>
			</c:if> <!-- 검색주소 없을때. -->
			
		</ul>		
	</div>
</div>