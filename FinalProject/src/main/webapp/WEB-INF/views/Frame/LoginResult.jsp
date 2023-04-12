<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
if(${auth}!=null){
	alert(${auth});
	location.href = 'Frm';

}

</script>