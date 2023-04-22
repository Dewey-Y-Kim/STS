<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="left_menu btn-group-vertical">
<button id='schedule' class="side-btn btn btn-outline-primary">출고예정</button>
<button id='Optometry' class="side-btn btn btn-outline-primary">검안입력</button>
<button id='Selldata' class="side-btn btn btn-outline-primary">매출등록</button>
<button id='Lens' class="side-btn btn btn-outline-primary">렌즈주문</button>
<button id='CampSell' class="side-btn btn btn-outline-primary">매장별<br/>매출</button>
<button id='management' class="side-btn btn btn-outline-primary">매장관리</button>
</nav>

<aside class="right_menu btn-group-vertical">
	<button id='campSellgraph' class="side-btn btn btn-outline-primary">매장별 <br/>매출현황</button>
	<button id='inventory' class="side-btn btn btn-outline-primary">현재재고</button>
    
    <button id='brokenlens' class="side-btn btn btn-outline-danger">파기등록</button>
    <button id='brokenlist' class="side-btn btn btn-outline-warning">파기현황</button>
	<button id='repond' class="side-btn btn btn-outline-danger">반품등록</button>
	<button id='repondlist' class="side-btn btn btn-outline-warning">반품현황</button>
</aside>
