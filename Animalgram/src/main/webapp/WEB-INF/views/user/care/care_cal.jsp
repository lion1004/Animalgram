<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base/main.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="/resources/cal/style.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">



<script>
	var lastday = Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	var specialday = Array();
	var specialdayCano = Array();
	var specialdayDetail = Array();
	var specialdayType = Array();
	var now = Date.now();
	var nd = new Date(now);
	var ElementOption,
		cd,
		table;
	var init = (function() {

		"<c:forEach items='${carelist }' var='careVO' varStatus='stat'>"
		var date = '${careVO.cdate}';
		var title = '${careVO.ctitle}';
		var type = '${careVO.ctype}';
		var cano = '${careVO.cno}';
		date = date.trim().substring(date.indexOf('년') + 1, date.indexOf('일')).replace("월 ", "-");
		specialday.push(date);
		specialdayCano.push(cano);
		specialdayDetail.push(title);
		specialdayType.push(type);
		"</c:forEach>"

		var firstFull = nd.getFullYear() + "/" + (nd.getMonth() + 1) + "/1";
		var firstDate = new Date(firstFull);

		return {
			Line : function() {
				return 7 - firstDate.getDay();
			},
			Year : function() {
				return firstDate.getFullYear();
			},
			Month : function() {
				return firstDate.getMonth();
			},
			Day : function() {
				return firstDate.getDay();
			},
			Full : firstFull
		}
	}());

	var nowday = {
		id : "today",
		year : nd.getFullYear(),
		month : nd.getMonth(),
		day : nd.getDate(),
		week : nd.getDay()
	}

	var step = {
		prev : function() {
			return "<button type='button' id='prev'>Prev</button> ";
		},
		next : function() {
			return "<button type='button' id='next'>Next</button>";
		}
	}

	/* 현재 날짜 */
	function CurrentOpen(ln, config) {
		var g = config.year + "/" + (config.month + 1);
		table = "";
		table = "<table class='" + g + "'>";

		var year,
			month,
			date,
			currrent;

		if (ln == null || ln == "") {
			currrent = config.year + " 년 "
				+ (config.month + 1) + " 월 ";

		} else {

			Number.prototype.getString = function(v) {
				return this.toString();
			}
			currrent = ln.replace('/(yyyy|yy|MM|DD|mm|dd)/gi', function(a) {
				switch (a) {
				case "yyyy":
					return config.year;
				case "yy":
					return (config.year % 1000).getString(2);
				case "MM":
					return config.month + 1 > 9 ? (config.month + 1) : "0" + (config.month + 1);
				case "DD":
					return config.day > 9 ? config.day : "0" + config.day;
				case "mm":
					return config.month + 1;
				case "dd":
					return config.day;
				}
				;
			});
		}
		table += "<tr>";
		table += "<td colspan='7' id='current'>";
		table += step.prev() + "<span id='current_text'>" + currrent + "</span>" + step.next();
		table += "</td>";
		table += "</tr>";
	}

	/* 요일 옵션( 한글, 영어 ) */
	function DayOpen(language) {
		var week = Array();

		if (language == 'ko') {
			week = Array('일', '월', '화', '수', '목', '금', '토');
		} else if (language == 'en' || language == null) {
			week = Array('Sun', 'Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat');
		}

		table += "<tr class='day'>";

		for (var j = 0; j < 7; j++) {
			table += "<td>" + week[j] + "</td>";
		}
		table += "</tr>";

	}


	/* 일자 */
	function DateOpen(config) {
		var inputspec = new Array();
		var inputspecCano = new Array();
		var inputspecText = new Array();
		var inputspecType = new Array();
		var root = lastday[config.Month()] - config.Line();
		var loop = Math.round(root / 7);
		var rest = root % 7;

		if (rest == 0) {
			rest = 7;
		}


		loop = 5;


		/* 기념일 */
		function specialFind(day, index) {
			var word = (config.Month() + 1) + "-";
			if (day.indexOf(word) > -1) {
				day = day.split('-');
				inputspec.push(day[1].toString());
				inputspecCano.push(specialdayCano[index]);
				inputspecText.push(specialdayDetail[index]);
				inputspecType.push(specialdayType[index]);
			}
		}

		specialday.forEach(specialFind);

		var input = 0;
		var deinput = 0;

		for (var l = 0; l <= loop; l++) {

			table += "<tr>";

			for (var k = 0; k < 7; k++) {

				table += "<td>";
				if (config.Day() > k && l == 0) {
					table += '';
				} else if (l == loop && rest <= k) {
					table += '';
				} else {

					input += 1;
					if (config.Month() == nowday.month && input == nowday.day) {
						table += "<div id='" + nowday.id + "'>" + input + "</div>";
					} else if (inputspec.indexOf(input.toString()) > -1) {
						var str = "<input type='hidden' value='<hr><h3>훈련내용( ◍•㉦•◍ )♡</h3><hr>" + inputspecText[deinput] +
							"<br><br><hr><h3>훈련대상( ◍•㉦•◍ )♡</h3><hr>" + inputspecType[deinput] +
							"<br><br><a href=\"/care/info?cno=" + inputspecCano[deinput] +
							"\"class=\"btn btn-warning\" >✿훈련 상세정보✿<a/>' class='spt'/>";
						table += "<div id='special'>" + input + str + "</div>";
						deinput++;
					} else if (input <= lastday[config.Month()]) {
						table += "<div>" + input + "</div>";
					}
				}
				table += "</td>";
			}
			table += "</tr>";
		}
	}

	var eventList = {
		handelClick : function(e) {
			var daywrite = document.getElementById('information');
			var spt = e.target.children[0];
			var parent = e.target.id;
			var print = "";
			if (spt == null) {
				var str = "일<br><hr><h3>훈련 정보 없음</h3><hr>";
				spt = "";
				print = e.target.innerHTML + spt + str;
			} else {
				spt = spt.value;
				print = e.target.innerHTML + "일<br>" + spt;
			}
			if (daywrite == null) {
				return false;
			} else {

				daywrite.style.display = "block";
				daywrite.style.color = "#ffffff";
				daywrite.style.fontWeight = "normal"
				daywrite.style.fontSize = "20px";

				if (parent == 'special') {
					daywrite.style.color = "#ffffff";
				} else if (parent == 'today') {
					daywrite.style.fontSize = "20px";
					daywrite.style.fontWeight = "bold";
				}

				daywrite.innerHTML = print;
			}
		},
		handelNPButton : function(e) {
			var id = e.target.id;
			preview(ElementOption, id);
		}
	}



	var DayClick = function(el) {

		var point = document.getElementById(el);
		var td = point.getElementsByTagName('div');
		for (var i = 0; i < td.length; i++) {
			td[i].addEventListener('click', eventList.handelClick, false);
		}
	};

	var NextBt = function() {
		var bt = document.getElementById('next');
		bt.addEventListener('click', eventList.handelNPButton, false);
	}

	var PrevBt = function() {
		var bt = document.getElementById('prev');
		bt.addEventListener('click', eventList.handelNPButton, false);
	}

	function EventLaunch(option) {
		DayClick(option.el);
		NextBt();
		PrevBt();
	}


	/* render */
	function CalendarLaunch(option) {
		try {
			ElementOption = option;
			CurrentOpen(option.format == null ? null : option.format, nowday);
			DayOpen(option.lang == null || option.lang == "" ? null : option.lang);
			DateOpen(init);
			document.getElementById(option.el).innerHTML = table;

			EventLaunch(option);

			console.info("Welcome to NoDe Calendar. \nYou can fix this function so easy. \nEnjoy my calendar function. Thank you!");
		} catch (error) {
			if (document.getElementById(option.el) == null) {
				console.error("Load fail at Element option " +
					"\n You didn't create 'el'(element) in HTML. " +
					"\n Fist check. Create element in HTML " +
					"\n Second check. Write 'CalenderLaunch' instance attribute 'el'");
			} else {
				console.log(error);
			}
		}
	}



	function PreviewCalLaunch(option, fixday, fixdate) {
		CurrentOpen(option.format == null ? null : option.format, fixday);
		DayOpen(option.lang == null || option.lang == "" ? null : option.lang);
		DateOpen(fixdate);
		document.getElementById(option.el).innerHTML = table;

		EventLaunch(option);
	}



	function preview(option, action) {
		var ready = document.getElementsByTagName('table');
		var previewDate = ready[0].className.split('/');
		var previewFull = "";

		if (action == 'next') {
			previewDate[1] = parseInt(previewDate[1]) + 1;

			if (previewDate[1] == 13) {
				previewDate[1] = 1;
				previewDate[0] = parseInt(previewDate[0]) + 1;
			}

			for (var i = 0; i < previewDate.length; i++) {
				if (i == 2) {
					previewFull += previewDate[i];
				} else {
					previewFull += previewDate[i] + "/";
				}
			}

		} else if (action == 'prev') {
			previewDate[1] = parseInt(previewDate[1]) - 1;

			if (previewDate[1] == 0) {
				previewDate[1] = 12;
				previewDate[0] = parseInt(previewDate[0]) - 1;
			}

			for (var i = 0; i < previewDate.length; i++) {
				if (i == 2) {
					previewFull += previewDate[i];
				} else {
					previewFull += previewDate[i] + "/";
				}
			}
		}

		cd = new Date(previewFull);

		var fixday = {
			id : "today",
			year : cd.getFullYear(),
			month : cd.getMonth(),
			day : cd.getDate(),
			week : cd.getDay()
		};
		var fixdate = {
			Line : function() {
				return 7 - cd.getDay();
			},
			Year : function() {
				return cd.getFullYear();
			},
			Month : function() {
				return cd.getMonth();
			},
			Day : function() {
				return cd.getDay();
			},
			Full : previewFull
		}

		PreviewCalLaunch(option, fixday, fixdate);

	}
	;
</script>
<div id="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="background: #ff8080; margin-top: 50px">
				<h1 class="page-header" style="color: #ffffff">
					반려동물 행동화 훈련 신청 <small style="color: #222222">・゜゜・**・゜|*╹ω╹*|゜・**・゜゜・*</small>
				</h1>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img class="img-responsive img-rounded"
					src="/resources/image/group/catdog.jpg" alt="">
			</div>
			<!-- /.col-md-8 -->
			<div class="col-md-6">
				<h1>(⋈◍＞◡＜◍)。✧♡</h1>
				<h3>천덕꾸러기 반려동물。</h3>
				<p>확실한 전문가가 함께 합니다。</p>
				<p>･ﾟﾟ･*:.｡..｡.:*ﾟ:*:✼✿(ღ✪ｖ✪)｡ﾟ:*:✼.｡✿.｡</p>
				<a class="btn btn-warning btn-lg" href="#pro">✿전문가 보기 ✿</a>
			</div>
			<!-- /.col-md-4 -->
		</div>
	</div>
	<hr>
	<div class="container">
		<h3>훈련 일정을 선택하고 신청해주세요. ヾ(｡>﹏<｡)ﾉﾞ✧*。</h3>
	</div>
	<hr>
	<br>
	<div class="container">
		<div class="form-group">
			<div id="app">
				<script>
					var app = new CalendarLaunch({
						el : "app"
					});
				</script>
			</div>
			<div id="information"></div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<hr>
			<div id="pro" class="col-lg-12"
				style="background: #ff8080; color: #ffffff;">
				<h2 class="page-header">전문가 소개 (。ﾟωﾟ) ﾊｯ!</h2>
			</div>
		</div>
	</div>
	<br> <br>
	<div class="container">
		<div class="row">
			<c:forEach items='${memlist }' var='memberVO' varStatus='stat'>
				<c:set var="mmno" value="${memberVO.mno}" />
				<c:forEach items='${prolist }' var='professionalVO' varStatus='stat'>
					<c:set var="pmno" value="${professionalVO.mno}" />
					<c:if test="${mmno  == pmno}">
						<div class="col-lg-4 col-sm-4 text-center">
							<div class="thumbnail">
								<img class="img-circle img-responsive img-center"
									src="${professionalVO.pimage}" alt="">
								<div class="caption">
									<h3>
										${memberVO.mname } <small>${professionalVO.ptype }</small>
									</h3>
									<p align="left">경력 : ${professionalVO.pcareer }년</p>
									<p align="left">연락처 : ${memberVO.mtel }</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
	<hr>
	<br>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<p>Copyright &copy; AnimalGram Corp. Make by 홍일점</p>
				</div>
			</div>
			<!-- /.row -->
		</div>
	</footer>
	<br>
</div>
