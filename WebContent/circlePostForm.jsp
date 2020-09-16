<!-- 작성자: 김나예 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 소모임 정보 등록</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
            .navbar {
                background: #ff6d00 !important;
            }
        </style>
    </head>

    <body>
        <header>
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>

        <main class="mt-5 pt-5">
            <div class="container wow fadeIn">
                <h2 class="font-weight-bold dark-grey-text pb-2 mb-4">소모임 정보를 입력해주세요.</h2>
                <hr class=""/>

                <form action="postinsert.circle" method="POST" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputTitle" >소모임 제목</label>
                            <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요." name="title"/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pictures">사진</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="pictures" name="pictures" aria-describedby="inputFile" onchange="imgChecker(this);" accept=".jpg, .png, .jpeg" required />
                                <label class="custom-file-label" for="pictures">사진 선택</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="memnumber">인원수<small>(최대15명)</small></label>
                            <select id="memnumber" class="form-control" name="mem_number">
                                <option value="" selected disabled>선택</option>
                                <option value="15">15명</option>
                                <option value="14">14명</option>
                                <option value="13">13명</option>
                                <option value="12">12명</option>
                                <option value="11">11명</option>
                                <option value="10">10명</option>
                                <option value="9">9명</option>
                                <option value="8">8명</option>
                                <option value="7">7명</option>
                                <option value="6">6명</option>
                                <option value="5">5명</option>
                                <option value="4">4명</option>
                                <option value="3">3명</option>
                                <option value="2">2명</option>
                                <option value="1">1명</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputRegion">지역구</label>
                            <select id="inputRegion" class="form-control" name="region">
                                <option selected disabled value="">선택</option>
                                <option>강남구</option>
                                <option>강동구</option>
                                <option>강북구</option>
                                <option>강서구</option>
                                <option>관악구</option>
                                <option>광진구</option>
                                <option>구로구</option>
                                <option>금천구</option>
                                <option>노원구</option>
                                <option>도봉구</option>
                                <option>동대문구</option>
                                <option>동작구</option>
                                <option>마포구</option>
                                <option>서대문구</option>
                                <option>서초구</option>
                                <option>성동구</option>
                                <option>성북구</option>
                                <option>송파구</option>
                                <option>양천구</option>
                                <option>영등포구</option>
                                <option>용산구</option>
                                <option>은평구</option>
                                <option>종로구</option>
                                <option>중구</option>
                                <option>중랑구</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="gender">성별</label><br/>
                            <input type="radio" name="gender" value="male"/> 남
                            <input class="ml-2" type="radio" name="gender" value="female"/> 여
                            <input class="ml-2" type="radio" name="gender" value="none" checked/> 무관
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="circle_date">모집날짜</label>
                            <input type="date" class="form-control" name="event_date" id="event_date"/>
                            <small id="eventdateHelp" class="form-text text-danger"></small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="circle_deadline">모집마감일</label>
                            <input type="date" class="form-control" name="end_date" id="end_date"/>
                            <small id="enddateHelp" class="form-text text-danger"></small>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_postcode">우편번호</label>
                            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="zipcode" readonly/>
                        </div>
                        <div class="form-group col-md-6" style="padding-top: 32px">
                            <label for="findAddress"></label>
                            <input type="button" class="btn btn-primary mt-0" id="findAddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_roadAddress">도로명주소</label>
                            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="address" readonly/>
                        </div>
                        <span id="guide" style="color:#999;display:none"></span>
                        <div class="form-group col-md-6">
                            <label for="sample4_detailAddress">상세주소</label>
                            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="address_detail"/>
                        </div>
                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;"/>
                        <input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display: none;"/>
                    </div>

                    <div class="form-group">
                        <label for="description">소모임 관련 설명</label>
                        <textarea class="form-control" id="description" rows="7" name="description"></textarea>
                    </div>

                    <div class="form-row float-right">
                        <button type="submit" class="btn btn-lg btn-primary" onclick="return validation();">등록</button>
                        <button type="button" class="btn btn-lg btn-danger" href="view.circle">취소</button>
                    </div>

                    <div class="clearfix mb-4"></div>
                </form>

            </div>

        </main>

        <!-- Footer import -->
        <%@ include file="footer.jsp" %>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>

        <!-- kakao 우편번호 서비스 http://postcode.map.daum.net/guide -->
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if(data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
            }
        </script>

        <!-- 게시물 올릴때 사진 크기, 확장자제한 -->
        <script>
        	function imgChecker(inputFile){
        		 //용량 체크
        		var maxSize = 5 * 1024 * 1024;
        		if (inputFile.files && inputFile.files[0].size > maxSize) {
                    alert("첨부할 이미지 파일은 5MB 이하여야 합니다.");
                    inputFile.value = null;
                }
                //이미지 파일 체크 jpg, png, jpeg만 받음
                var fileExtension = /(.*?)\.(jpg|png|jpeg)$/;
                if (!inputFile.value.match(fileExtension)) {
                    alert("JPG, PNG, JPEG 파일만 업로드 가능");
                    inputFile.value = null;
                }
        	}
        </script>

		<!-- 이벤트 날짜 설정시에 오늘날짜 이후로 선택가능하도록 -->
		<script>
			$(document).ready(function(){
				$("#event_date").blur(function(){
					var select_date = $("#event_date").val();
					var today = getToday();
					//alert("선택날짜 : "+select_date+" / 오늘날짜 : "+today);

					if(select_date<today){
						//alert("asdfadf");
						$("#eventdateHelp").html("<p>오늘 날짜 이후로 설정해주세요.</p>");
						$("#event_date").val('');
					}else{
						$("#eventdateHelp").html('');
					}

				});

			});
			function getToday(){
				var date = new Date();
				return date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
			}
		</script>

		<!-- 마감날짜 선택시 모임날짜보다 이전까지만 받도록 -->
		<script>
			$(document).ready(function(){
				$("#end_date").blur(function(){
					var select_date = $("#end_date").val();
					var event_date = $("#event_date").val();
					var today = getToday();

					if(event_date<select_date){
						$("#enddateHelp").html("<p>마감일은 소모임날짜 이전으로 등록가능합니다.</p>");
						$("#end_date").val('');
					}else if(select_date<today){
						$("#enddateHelp").html("<p>오늘 날짜 이후로 설정해주세요.</p>");
						$("#end_date").val('');
					}else{
						$("#enddateHelp").html('');
					}

				});

			});
			function getToday(){
				var date = new Date();
				return date.getFullYear()+"-"+("0"+(date.getMonth()+1)).slice(-2)+"-"+("0"+date.getDate()).slice(-2);
			}
		</script>

		<!-- 입력값 유효성 검사 -->
		<script>
			function validation(){
				var inputTitle = document.getElementById("inputTitle");
				var pictures = document.getElementById("pictures");
				var mem_number = document.getElementById("memnumber");
				var inputRegion = document.getElementById("inputRegion");
				var event_date = document.getElementById("event_date");
				var end_date = document.getElementById("end_date");
				var sample4_postcode = document.getElementById("sample4_postcode");
				var sample4_roadAddress = document.getElementById("sample4_roadAddress");
				var sample4_detailAddress = document.getElementById("sample4_detailAddress");
				var description = document.getElementById("description");

				if(inputTitle.value==""){
					alert("소모임 제목을 입력하세요.");
					inputTitle.focus();
					return false;
				}
				if(pictures.value==""){
					alert("사진을 등록해주세요.");
					pictures.focus();
					return false;
				}
				if(memnumber.value==""){
					alert("인원수를 선택해주세요.");
					memnumber.focus();
					return false;
				}
				if(inputRegion.value==""){
					alert("지역구를 선택해주세요.");
					inputRegion.focus();
					return false;
				}
				if(event_date.value==""){
					alert("소모임 날짜를 확인해주세요.");
					event_date.focus();
					return false;
				}
				if(end_date.value==""){
					alert("모집마감 날짜를 확인해주세요.");
					end_date.focus();
					return false;
				}
				if(sample4_postcode.value==""){
					alert("주소를 확인해주세요.");
					sample4_postcode.focus();
					return false;
				}
				if(sample4_roadAddress.value==""){
					alert("주소를 확인해주세요.");
					sample4_roadAddress.focus();
					return false;
				}
				if(sample4_detailAddress.value==""){
					alert("주소를 확인해주세요.");
					sample4_detailAddress.focus();
					return false;
				}
				if(description.value==""){
					alert("소모임 설명을 작성해주세요.");
					description.focus();
					return false;
				}
			}
		</script>
    </body>
</html>