<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
a {
	text-decoration: none;
	color: black;
}

.list {
	width: 45%;
	float: left;
}

.roomImgDiv {
	width: 300px;
	float: left;
}

.roomInfo {
	width: 350px;
	float: left;
}

.roomImg {
	width: 80%;
}

	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>

<script>
	var contextPath = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f012acd2f49a5cb81161a8efd9617aec&libraries=services"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>



</head>
<body>
	<h3>
		<a href="${pageContext.request.contextPath}">HOME</a>
		${pm}
	</h3>
	<div>
		<input type="button" value="갓물주" id="godSearch" class="btnType"/> 
		<input type="button" value="요금순" id="priceSearch" class="btnType"/> 
		<input type="button" value="인기순" id="popuSearch" class="btnType"/>
	</div>
	<br />
	<!-- 목록 -->

	<div class="list">
		<form action="/room/list" method="GET" id="roomList">
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="room" items="${list}" begin="0" end="4">
					<a href="${pageContext.request.contextPath}/room/detail?r_no=${room.r_no}" >
						<div class="listToChange">
							<div class="roomImgDiv">
								<img class="roomImg" src="${pageContext.request.contextPath}/room/displayFile?fileName=${room.r_i_fullName}" />
							</div>
							<div class="roomInfo">
								<h2 class="scrolling" data-rno="${room.r_no}">${room.r_no}</h2>
								<h2>${room.r_name}
									<br />${room.r_addr_main}</h2>
								<div><f:formatNumber value="${room.c_star}" maxFractionDigits="1"/>(${room.commentNum})</div>
								<div>인원 ${room.r_guests}명 ㆍ 침실 ${room.r_bed}개 ㆍ 침대
									${room.r_bedroom}개 ㆍ 욕실 ${room.r_bath}개</div>
								<div>
									<c:if test="${room.a_heating == 1}">
									난방 
								</c:if>
									<c:if test="${room.a_heating == 0}">
									</c:if>
	
									<c:if test="${room.a_parking == 1}">
									주차공간 
								</c:if>
									<c:if test="${room.a_parking == 0}">
	
									</c:if>
									<c:if test="${room.a_wifi == 1}">
									wifi
								</c:if>
									<c:if test="${room.a_wifi == 0}">
									</c:if>
								</div>
								<h3>\ ${room.r_price}</h3>
							</div>
						</div>
					</a>
					<c:set var="addr" value="${room.r_addr_main}" scope="page"></c:set>
					<c:set var="price" value="${room.r_price}" scope="page"></c:set>
					<c:set var="name" value="${room.r_name}" scope="page"></c:set>
					<c:set var="r_no" value="${room.r_no}" scope="page"></c:set>
					<c:set var="rimg" value="${room.r_i_fullName}" scope="page"></c:set>
				</c:forEach>
				<c:forEach var="room" items="${list}" begin="0" end="4">
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div>등록된 숙소가 없습니다.</div>
			</c:otherwise>
		</c:choose>
		</form>
		</div>
	<div id="map"
		style="width: 45%; height: 100%; position: fixed; right: 0; bottom: 0"></div>
	
			<!-- 페이징 블럭 -->
	
	<%-- <c:if test="${pageMaker.prev}">
		<a href="list${pageMaker.roomSearch(pageMaker.startPage-1)}">&laquo;</a>
	</c:if>
	<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		<a href="list${pageMaker.roomSearch(i)}">${i}</a>
	</c:forEach>
	<c:if test="${pageMaker.next}">
		<a href="list${pageMaker.roomSearch(pageMaker.endPage+1)}">&raquo;</a>
	</c:if> --%>

	<script>
	$(function(){
		var addr = '${addr}';
		var price = '${price}';
		var name = '${name}';
		var r_no = '${r_no}';
		var rimg = '${rimg}';
		console.log(rimg);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.207403, 129.070246), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// array 에 obj(title, 좌표) 넣음 
		var array = new Array;

		function makeObj(obj, len) {
			array.push(obj);
			// obj : title, latlng(x,y)

			if (array.length == len) {
				getpositons(array);
			}
		}

		function getpositons(positions) {
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "${pageContext.request.contextPath}/resources/img/pin%20(2).png";
			
			
			for (var i = 0; i < positions.length; i++) {
				
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(39, 50);

				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng, // 마커를 표시할 위치
					title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage,
					rimg : positions[i].rimg,
					r_no : positions[i].r_no,
					price : positions[i].price
				// 마커 이미지
				});
				
				// 커스텀 오버레이에 표시할 컨텐츠 입니다
				// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
				// 별도의 이벤트 메소드를 제공하지 않습니다 
				var content = '<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title">' + positions[i].title +
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img src="${pageContext.request.contextPath}/room/displayFile?fileName='+positions[i].rimg+'" width="73" height="70">' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis">\\'+ positions[i].price +'</div>' + 
				            '                <div><a href="${pageContext.request.contextPath}/room/detail?r_no=' + positions[i].r_no + '" target="_blank" class="link">상세보기</a></div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +    
				            '</div>';

				 
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: marker.getPosition()       
				});

				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    overlay.setMap(map);
				    console.log('click');
				});

				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay() {
				    overlay.setMap(null);     
				}
				
				// 이동
				if(i==0){
					function panTo(){
						var moveLatLng = new kakao.maps.LatLng(positions[i].latlng.Ha, positions[i].latlng.Ga);   
						map.panTo(moveLatLng);
					}
					panTo();
				}
				
			}
		}

		$.getJSON(contextPath + "/room/getPositions", function(data){ //주소로 좌표검색, obj에 title, 좌표 넣음
			$(data).each(
					function() {
						//주소로 좌표를 검색합니다
						var title = this.r_name;
						var price = this.r_price;
						var rimg = this.r_i_fullName;
						var r_no = this.r_no;
						
						geocoder.addressSearch(this.r_addr_main, function(
								result, status) {
							// 정상적으로 검색이 완료됐으면	
							if (status === kakao.maps.services.Status.OK) {
								/* console.log(result); */
								// result[0].x & result[0].y 가 좌표 값.
								var obj = {
									title : title,
									price : price,
									rimg : rimg,
									r_no : r_no,
									latlng : new kakao.maps.LatLng(result[0].y,
											result[0].x)
								};
								makeObj(obj, data.length);
							}
						});
					});
			
		});
	});
	
	
	
	</script>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(".btnType").click(function(){
			var searchType = $(this).val();
			console.log(searchType);
			location.href="list${pageMaker.roomSearch(1)}"+searchType;
		})

	</script>
	
	
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
	<script>
	var contextPath = "${pageContext.request.contextPath}";
	
		$(window).scroll(function(){
			if($(window).scrollTop() >= $(document).height() - $(window).height()){
				// 서버에 ajax로 게시물 데이터 요청..?
				// 
				
				
				// 이전 스크롤 좌표
				var lastScrollTop = 0;
				// 스크롤 이벤트 최초 발생
				$(window).scroll(function(){
					
					// 현재스크롤 좌표
					var currentScrollTop = $(window).scrollTop();
					// 다운 스크롤
					if(currentScrollTop - lastScrollTop > 0 ){
						// 현재 스크롤 좌표를 이전 스크롤 좌표로 할당
						lastScrllTop = currentScrollTop;
					}
					// 업스크롤
					else{
						// 현재 스크롤 좌표를 이전 스크롤 좌표를 할당
						lastScrollTop = currentScrollTop;
					}
				});
				
				//현재 페이지에 뿌려진 게시글의 마지막 rno 값을 읽어오는것(다음 방 리스트를 가져오기 위해 필요한 데이터)
				var lastrno = $(".scrolling:last").attr("data-rno");
				
				/* $(data).each(function(){
					this;
				}); */
				
				$.ajax({
					type:'post',
					url : 'listScroll',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'json',
					data : JSON.stringify({
						r_no : lastrno
					}),
					success : function(data){
						var str = "";
						if(data != ""){
							$(data).each(
								function(){
									console.log(this);
									str += 	   "<div class='listToChange'>"
										+ 	   "	<div class='roomImgDiv'>"
										+	   "	<img class='roomImg' src="+contextPath+"/room/displayFile?fileName="+this.r_i_fullName+" />"
										+	   "</div>"
										+	   "<div class='roomInfo'>"
										+	   "<h2 class='scrolling' data-rno="+this.r_no+">"+this.r_no+"</h2>"
										+	   "<h2>"+this.r_name
										+	   "<br/>"+this.r_addr_main+"</h2>"
										+	   "<div>"+this.c_star.toFixed(2)+"("+this.commentNum+")"+"</div>"
										+	   "	<div>인원 "+this.r_guests
									str +="명 ㆍ 침실 "+this.r_bed+"개 ㆍ 침대"+this.r_bedroom+"개 ㆍ 욕실"+this.r_bath+"개</div>"
										+	   "	<div>";
										if(this.a_heating == 1){
									str += 		"난방 ";
										}else{
									str += "";
										}
										if(this.a_parking == 1){
									str += 		"주차공간 ";
										}else{
									str += "";
										}
										if(this.a_wifi == 1){
									str += 		"wifi ";
										}else{
									str += "";
										}
										+	   "	</div>"
										+	   "<h3>\ "+ this.r_price+"</h3>"
										+	   "</div>"
										+	   "</div>";
							});
							/* $(".listToChange").empty(); */
							/* $(".scrollLocation").after(str); */
							$(".list").append(str);
							
						}else{
							alert("리스트의 마지막까지 불러왔습니다.");	
						}
					}
				});
				
				var position = $(".listToChange:first").offset();
				$('html, body').stop().animate({scrollTop : position.top}, 600, 'easeInQuint');
				
				
			}
			
		});
		
	</script> --%>

	<script src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
	
	<script>
		
	</script>

</body>
</html>