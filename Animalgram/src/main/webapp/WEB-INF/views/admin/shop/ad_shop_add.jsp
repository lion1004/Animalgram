<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/navbar.jsp"%>   

<!DOCTYPE html >

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>병원등록창</title>

    <script type="text/javascript">
    /* 한글만 입력 유효성 */
    var korExp=/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]$/;
    /* 전화번호  입력 유효성 */
    var telExp = /^\d{1,3}-\d{3,4}-\d{4}$/;
    /* 운영시간  유효성 */
	var timeExp =/^\d{1,2}:\d{1,2}~\d{1,2}:\d{1,2}$/;
    
	//유효성 체크 function
    function check() {
		//편의를위해 치환.
    	var f = document.join;
    	
		
        if (f.shtype.value == "") {//매장타입 null값체크
           alert("매장타입을 입력하세요.");
            f.shtype.focus();
        } else if(!korExp.test(f.shtype.value)){//매장타입 한글체크
        	alert("매장타입엔 한글만 입력가능합니다.(2~15자리수)");
        	f.shtype.focus();
        }else if(f.shname.value==""){//매장이름 null값체크
			alert("매장이름을 입력하세요.")        	
        	
        	f.shname.focus();
        }else if(!korExp.test(f.shname.value)){//매장 타입 한글체크
        	alert("매장이름엔 한글만 입력가능합니다.(2~10자리수)");
        	f.shtype.focus();
        }else if(f.shaddr.value==""){//주소 null체크
			alert("주소를 입력하세요.");        	
           f.shaddr.focus();
        	
        }else if(!korExp.test(f.shaddr.value)){ //주소 한글 체크
        	
        	alert("주소에는 한글만 입력가능합니다.");
        	
           f.shaddr.focus();
        	
        }else if(f.shtel.value==""){	//전화번호 null값체크
			alert("전화번호를 입력하세요.")        	
        	alert("ex)010-1234-1234")
           f.shtel.focus();
       
        }else if(!telExp.test(f.shtel.value)){//주소 양식및 숫자체크
        	
			alert("양식에 맞게 전화번호를 입력하세요.")
			alert("ex)02-1234-1234 , 010-1234-1234")
			
           f.shtel.focus();
        }else if(f.shtime.value==""){//운영시간 null값체크
			alert("운영시간을  입력하세요.")        	
           f.shtime.focus();
        	
        }else if(!timeExp.test(f.shtime.value)){//운영시간 양식및 숫자체크
        	
			alert("운영시간을 양식에 맞게 입력하세요.");
        	alert("ex) ex)09:00~22:00");
        	
           f.shtime.focus();
        }else if(f.shsite.value==""){//좌표값 null체크및 양식및 예시
			alert("위치정보를 ','포함하여 입력하세요.")  
			alert("ex)35.899437,128.638331")
           f.shsite.focus();
        	
        	
        }else if(f.shparking.value==""){//주차정보null값체크
           alert("주차정보를 입력하세요.");
           
           f.shparking.focus();
        } else if (!korExp.test(f.shparking.value)) {//주차정보양식 및 한글체크
           alert("주차정보에 한글만 입력하세요.");
           f.shparking.focus();

        } else
        	
           f.submit(); //다됬을시 sumit으로 올려버림.
     }
    
    
    
    </script>

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">ShopAdd(제휴매장 추가창) </h3>
                    </div>
                    <div class="panel-body">
                        <form name=join method="POST" action="addshop">
                            <fieldset>
                                <table>
                                    <tr>
	                                   <td align="center">매장타입:</td><td><input class="form-control" placeholder="ex)애견미용,동물병원" name="shtype" type="text" size="20"></td>
                                     </tr>
                                	<tr> 
                                		<td align="center">제휴매장 이름: </td><td> <input class="form-control" placeholder="ex)제휴매장 상호명" name="shname" type="text" size="20" autofocus></td>
                                	</tr>	
                                     <tr>
                                     	<td align="center">주소:</td><td><input class="form-control" placeholder="ex)서울 구로구 구로동" name="shaddr" type="text" size="20"></td>
                                     </tr>
                                     <tr>
                                     	<td align="center">전화번호:</td><td><input class="form-control" placeholder="ex)010-6808-1234 '-'포함 " name="shtel" type="text" size="20"></td>
                                     </tr>
                                     <tr>
                                     	<td align="center">운영시간:</td><td><input class="form-control" placeholder="ex)07:00~21:00 '~'포함 " name="shtime" type="text" size="20"></td>
                                     </tr>
                                     <tr>
                                     	<td align="center">위치정보:</td><td><input class="form-control" placeholder="ex)35.899437, 128.638331" name="shsite" type="text" size="20"></td>
                                     	<td>
           						<b><a href="https://www.google.co.kr/maps/@37.529703,126.963843,14z" target="_blank">※좌표등록시, <br>※클릭하여 좌표 값보기.','포함</a></b>
           						</td>
                                     </tr>
                                     <tr>
                                     	<td align="center">주차유무:</td><td><input class="form-control" placeholder="ex)주차가능,주차공간협소" name="shparking" type="text" size="20"></td>
                                     </tr>
                                </table>
                               
                                
                               
                                <!-- Change this to a button or input when using this as a form -->
                                <!-- <input type="button" id="btn_user_join" style="cursor: pointer;" value="가입" onclick="validCheck()"/> -->
                                <button type="button" class="btn btn-lg btn-success btn-block" onclick="check()">추가</button><br>
                                <a href="ad_list" class="btn btn-danger btn-default pull-right" data-dismiss="modal">나가기
																<span class="glyphicon glyphicon-remove"></span></a>
															
                              <font color=red>※ 빈칸 없이 입력하세요.</font>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   


  
</body>


