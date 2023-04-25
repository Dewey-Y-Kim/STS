<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.sellerLine{
		text-align:left;	
		height :50px;
	}
	.sellerLine>div>input{
		text-align : center;
		width : 100%;
	}
	.sellerLine>.no{
		width : 4%
	}
	.pagingline {
		margin : auto;
		width :80%;
	}
	.pagingline li{
		margin : 1%;
		float : left;
		width : 10%;
		text-align : center;
		line-height : 20px;
	}
	.
	.inputbox:ep(0){
		width:30%;
	}
	.inputbox:eq(1){
		width:30%;
	}
	.pagingbox ul{
	margin:0 auto;
	float :left;
	clear : both;
	}
	.writeForm{
	display:none;
	}
	.firsteditbox{
		width: 5%;
	}
	.lasteditbox{
		width : 10%;
		float : right;
	}
	.textbox{
	 	width :10%;
	 	text-align : center;
	}
	.d-flex{
	margin : auto;
	}
	.input_tag{
		outline:none;
		border : none;
	}
	.text_tile{
		margin : auto;
		padding-top:2px;
	}
	.commitbox{
		display:none;
	}
	.editbox {
	 width :100%;
	}
</style>
<script>
$(function(){
	$('.writebtn').click(function(){
		console.log('click');
		$('.sellerlist').css('display','none');
		$('.writeForm').css('display','block');
	});
	$('.edit_btn').click(function(){
		$(this).parent().parent().parent().children('div').children('.variable_Param').attr("readonly",false); //수정 가능으로 변경
		// $(this).parent().parent().children('div').next().children('.variable').attr("readonly",false);
		$('.editbox').css('display','block'); //다른 수정 박스 열기
		$(this).parent().parent().parent().children('div').children('.editbox').css("display","none"); // 수정 가능 버튼 숨김
		$('.commitbox').css('display','none'); // 다른 커밋박스 닫기
		$(this).parent().parent().parent().children('div').children('.commitbox').css("display","block"); // 커밋,취소버튼 등장
		// 현재 부족사항 : 수정중 다른 수정버튼을 클릭하면 수정된 상태로 유지... 걍 새로 불러올까.... 생각중...
		console.log();
	});
	$('.cancel_btn').click(function(){
		location.reload();
	});
	$('.submit_btn').click(function(){
		event.preventDefault();
		var data = $(this).parent().parent().parent().parent().serialize();
		//console.log($(this).parent().parent().parent().parent());// form 위치확인
		var url = 'updateSeller';
		$.ajax({
			url : url,
			data : data,
			type : 'post',
			success : function(s){
				console.log(s);
				/* var result = JSON.parse(s);
				console.log("result : "+result.sellercode);
				var id = "#"+result.sellercode+"_";
				$(id+'name').val(result.sellername);
				$(id+'tel').val(result.sellertel);
				$(id+'fax').val(result.sellerfax);
				$(id+'ceo').val(result.sellerceo); */
				alert('수정되었습니다.');
				$("#"+s+"_commitbox").css('display','none');
				$('#'+s+"_editbox").css('display','block');
				$('.variable_Param').attr('readonly',true);
			},error : function(e){
				console.log(e.responceText);
			}
		});
		return false;
	});
	$('#cancelInput').click(function(){
		return false;
		$('#writeFrm input').val(""); // 입력내용 초기화
		$(".writeForm").css('display','none');
		$(".sellerlist").css('display','block');
	});
	$('#submit').click(function(){
		event.preventDefault();
		
		var exp = /^[0-9]{3,4}$/;
		if($('#sellername').val() =="" || $('#sellerceo').val=="" ||$('sellertel').val==""|| $('#sellerfax').val()==""|| $('#sellerno').val()==""){
			alert('등록에 필요한 모든 항목이 채워지지 않았습니다.');
			return false;
		}
		
		if(!exp.test($('#tel2').val())||!exp.test($('#tel3').val()) ||!exp.test($('#fax2').val())||!exp.test($('#fax3').val())){
			alert('전화번호와 팩스번호는 숫자만 입해주세요.');
			return false;
		}
		
		var data = $('#writeFrm').serialize();
		console.log(data);
		var url = 'sellerInsert';
		$.ajax({
			url:url,
			data:data,
			type:'post',
			success:function(result){
				//.load(window.location.href + "#div의 id"
				location.reload();
				$('#writeFrm input').val(""); // 입력내용 초기화
				$(".writeForm").css('display','none');
				$(".sellerlist").css('display','block');
			},
			error:function(e){
				console.log(e.responseText);
				alert('등록에 실패하였습니다.');
			}
		});
	});
	$('.del_btn').click(function(){
		console.log($(this).attr("no"));
		$.ajax({
			url:"sellerDel",
			data:{sellercode:$(this).attr("no")},
			type:'post',
			success:function(r){
				location.reload();
			}, error : function(e){
				console.log(e.responseText)
			}
		})
	});
});
</script>
<main class="main_frm container">
<div class="sellerlist rounded">
		<c:if test="${auth>2}">
			<button class='writebtn'>등록</button><br/>
		</c:if>
	<div class = "d-flex sellerLine">
		<div class="d-flex firsteditbox "><p class="text_tile text-center">번호</p></div>
		<div class="d-flex flex-fill textbox flex-wrap text-center"><span class="text_tile">업체명</span></div>
		<div class="d-flex flex-fill textbox flex-wrap text-center"><span class="text_tile">사업자명</span></div>
		<div class="d-flex flex-fill textbox flex-wrap text-center"><span class="text_tile">전화번호</span></div>
		<div class="d-flex flex-fill textbox flex-wrap text-center"><span class="text_tile">팩스번호</span></div>
		<div class="d-flex flex-fill textbox flex-wrap text-center"><span class="text_tile">사업자번호</span></div>
		<div class="d-flex lasteditbox"><span class="text_tile"> </span></div>
	</div>
	<c:forEach var="seller" items="${sellerlist}">
	<div>
	<form id="form_${seller.sellercode}">
		<div class = "d-flex sellerLine">
			<div class="d-flex firsteditbox"><input type="hidden" name="sellercode" value="${seller.sellercode }" readonly/><span class="text_tile">${seller.sellercode }</span></span> </div>
			<div class="d-flex flex-fill flex-wrap"><input type="text" class="input_tag variable_Param" name="sellername" id="${seller.sellercode}_name" value="${seller.sellername }" readonly/></div>
			<div class="d-flex flex-fill flex-wrap"><input type="text" class="input_tag variable_Param" name="sellerceo" id="${seller.sellercode}_ceo" value="${seller.sellerceo}" readonly/></div>
			<div class="d-flex flex-fill flex-wrap"><input type="text" class="input_tag variable_Param" name="sellertel" id="${seller.sellercode}_tel" value="${seller.sellertel }" readonly/></div>
			<div class="d-flex flex-fill flex-wrap"><input type="text" class="input_tag variable_Param" name="sellerfax" id="${seller.sellercode}_fax" value="${seller.sellerfax }" readonly/></div>
			<div class="d-flex flex-fill flex-wrap"><input type="text" class="input_tag" name="sellerno" value="${seller.sellerno }" readonly/></div>
			<div class="d-flex lasteditbox">
				<div class="editbox d-flex" id="${seller.sellercode}_editbox">
					<div class="d-flex">
						<div class="">
						<input type="button" class="edit_btn" value="수정"/>
						</div>
						<c:if test="${auth==3 || auth==4 }">
							<div class="">
							<input type="button" class="del_btn" no="${seller.sellercode}" value="삭제"/>
							</div>
						</c:if>
					</div>
				</div>
				<div class="commitbox" id="${seller.sellercode}_commitbox">
					<div class="d-flex">
					<div class="">
					<input type='button' class="submit_btn" value='완료'/>
					</div>
					<div class="">
					<input type="button" class='cancel_btn' value="취소"/>
					</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
	</c:forEach>
	<div class='pagingbox'>
		<input id='nowPage' type='hidden' value='${vo.nowPage }'/>
		<ul class='pagingline pagination justify-content-center'>
			<c:if test="${vo.idxPage==1 }">
			<li></li>
			</c:if>
			<c:if test="${vo.idxPage!=1 }">
			<li class="page-item"><a href="sellerlist?nowPage=${vo.idxPage-vo.pagingCnt}">prev</a></li>
			</c:if>
			<!-- 페이지이동 -->
			
			<c:forEach var="page" begin="${vo.idxPage}" end="${vo.idxPage+vo.pagingCnt-1 }">
				<c:if test="${page<=vo.totalPage}">
					<c:if test="${page == vo.nowPage }">
						<li class="page-item">
					</c:if>
					<c:if test="${page != vo.nowPage }">
						<li class="page-item">
					</c:if>
					<a href="sellerlist?nowPage=${page}">${page }</a> </li>
				</c:if>
			</c:forEach>
			<c:if test="${vo.idxPage eq vo.lastIdxPage}">
			</c:if>
			<c:if test="${vo.idxPage ne vo.lastIdxPage}">
			<li class="page-item"><a href="sellerlist?nowPage=${vo.idxPage+vo.pagingCnt }">next</a></li>
			</c:if>
		</ul>
	</div>
</div>
<div class='writeForm'>
	<form id='writeFrm'>
		<div>업체명 : <input type = "text" id="sellername" name="sellername" value="test"/></div>
        <div>사업자명 : <input type = "text" id="sellerceo" name="sellerceo" value="testname"/></div>
        <div>전화번호 : <select name="tel1">
        		<option value="02">02</option>
        		<option value="031">031</option>
        		<option value="032">032</option>
        		<option value="033">033</option>
        		<option value="041">041</option>
        		<option value="042">042</option>
        		<option value="043">043</option>
        		<option value="044">044</option>
        		<option value="051">051</option>
        		<option value="052">052</option>
        		<option value="053">053</option>
        		<option value="054">054</option>
        		<option value="055">055</option>
        		<option value="061">061</option>
        		<option value="062">062</option>
        		<option value="063">063</option>
        		<option value="064">064</option>
        		<option value="010">010</option>
        	</select>
        	<input type = "text" id="tel2" name="tel2" value="1234" minlength='3' maxlength="4"/>
        	<input type = "text" id="tel3" name="tel3" value="1234" minlength='4' maxlength="4"/>
        </div>
        <div>팩스번호 : <select name="fax1">
        		<option value="02">02</option>
        		<option value="031">031</option>
        		<option value="032">032</option>
        		<option value="033">033</option>
        		<option value="041">041</option>
        		<option value="042">042</option>
        		<option value="043">043</option>
        		<option value="044">044</option>
        		<option value="051">051</option>
        		<option value="052">052</option>
        		<option value="053">053</option>
        		<option value="054">054</option>
        		<option value="055">055</option>
        		<option value="061">061</option>
        		<option value="062">062</option>
        		<option value="063">063</option>
        		<option value="064">064</option>
        	</select>
        	<input type = "text" id="fax2" name="fax2" value="1234" minlength='3' maxlength="4"/>
        	<input type = "text" id="fax3" name="fax3" value="1234" minlength='4' maxlength="4"/></div>
        <div>사업자번호 : <input type= "text" id="sellerno" name="sellerno" value="123-12-13413"/></div>
        <button id='submit'>저장하기</button><button id="cancelInput">등록취소</button>
</form>
</div>

</main>
<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
<c:if test="${auth==4}">
	<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
</c:if>
