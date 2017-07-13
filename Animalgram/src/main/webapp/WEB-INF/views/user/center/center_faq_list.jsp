<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script type="text/javascript">
$(function(){

 // 모든 패널이 펼쳐져있는 상태이기 때문에 dd의 첫번재를 제외한곳은 안보이게 설정합니다.
 $("dd:not(:first)").css("display","none");

 //dl 의 dt 를 클릭했을때
 $("dl dt").click(function(){

  // 만약 클릭한 태그 다음에 있는 dd 태그의 속성이 none 이면
  if($("+dd",this).css("display")=="none"){

   // dd 태그에 대해서 슬라이드업을 합니다. 즉 패널이 닫히는겁니다.
   $("dd").slideUp("slow");

   // 이어서 이접한 dd 에 슬라이드 다운을 합니다.
   $("+dd",this).slideDown("slow");
  }
 });
});
</script>

<style>
.faq_table {border-top: 2px solid #212121; }
.faq_table img{ margin:0 3px 0 0; float:left;}
.faq_table dl dt {color:#bcbcbc; font-weight:bold; line-height:12px; padding:10px 15px; border-bottom: 1px solid #212121; cursor:pointer}
.faq_table dl dd {color:#949494;  background: write;  border-bottom: 1px solid #212121; padding:10px 20px; line-height:18px;}
</style>


<div class="faq_table" title="홈스테이 qna">

	<dl>
		<dt>
			<img src="/resources/image/icon_faq.png" />Q. 아침식사를 차려주지 않는다
		</dt>
		<dd>
			<img src="/resources/image/icon_faq2.png" /> A. 대부분 아침은 간단한 시리얼, 과일,
			빵과 우유 정도이고 스스로 챙겨먹게 되어 있습니다. <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자신의
			스케줄에 맞게 간단하게 챙겨 먹고 가시면 됩니다.
		</dd>
		<dt>
			<img src="/resources/image/icon_faq.png" />Q. 먹고 싶지 않는 음식을 권한다
		</dt>
		<dd>
			<img src="/resources/image/icon_faq2.png" /> A. 다양한 음식문화도 경험할수 있는것이
			홈스테이기 때문에 다른나라의 음식문화를 접해 보시는 것도 좋으나<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;만약
			학생 개인의 기호나 알러지 등으로 인해 먹지 못할 경우, 정중하게 거절을 하시면 된답니다.
		</dd>
		<dt>
			<img src="/resources/image/icon_faq.png" />Q. 식사 후 모두 돕는데 나는 어디까지 도와야
			할지?
		</dt>
		<dd>
			<img src="/resources/image/icon_faq2.png" /> A. 홈스테이를 하는 가장 큰 목적은 외국의
			문화와 더불어 영어를 사용할수 있다는 것이 큰 장점입니다. <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어디까지
			도와야 할지 잘 모를 경우, 영어로 질문하면서 그 집의 문화와 맞춰 가시면 된답니다.
		</dd>
		<dt>
			<img src="/resources/image/icon_faq.png" />Q. 식사시간을 지키기가 어렵다
		</dt>
		<dd>
			<img src="/resources/image/icon_faq2.png" /> A. 외국의 식사는 우리와 달리 1인분씩
			요리를 하는 경우가 많습니다. <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;따라서
			만약 식사 시간을 지키기 어려울때는 미리 홈스테이 가정에 연락을 하여 오늘 저녁 식사를 하지 않는 것에 <br>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대해
			노티스를 주거나 혹은 늦게라도 귀가를 하여 식사를 할 예정이다 등등 미리 알려주시면 좋답니다.
		</dd>
		<dt>
			<img src="/resources/image/icon_faq.png" />Q. 밤 늦게 TV를 보고 싶다
		</dt>
		<dd>
			<img src="/resources/image/icon_faq2.png" /> A. 대부분 외국의 홈스테이는 일찍 자고
			일찍 일어나는 분위가가 많습니다.<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;따라서
			그 가정의 룰을 따라주시는것이 가장 좋으나 만약 늦게 시청해야 할 TV 가 있다면 사전에 조율을 하심 됩니다.
		</dd>
	</dl>
</div>