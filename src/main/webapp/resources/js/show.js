/**
 * 
 */
$(function(){
	// 자기 소개 수정 창 감추기
	$(".show_my_introduce_mod").hide();
	// 프로필 수정 창 감추기
	$(".mod_my_img").hide();
	
	//호스트 이미지 가져오기
	$.getJSON(contextPath+"/getMyImg/"+u_no, function(data){
		console.log(data);
		var fileInfo = getFileInfo(data[0]);
		var html = "<img src='"+fileInfo.imgSrc+"' alt='프로필 사진' class='FilledImg roundingProfileImg' />";
		$(".show_my_img").html(html);
	});
	// 파일 들어갔을 때 미리보기 띄우기
	$("#updateMyProfile").on("change", previewImg);
});


//자기소개 편집 창 열기
$(".show_my_introduce_mod_open").on("click", function(){
	$(".show_my_introduce_mod").show('slow');
	$(".show_my_introduce").hide('slow');
	$(".show_my_introduce_mod_open").hide('slow');
});

//자기 소개 취소버튼
$(".show_my_introduce_mod_cancel").on("click",function(){
	$(".show_my_introduce_mod").hide('slow');
	$(".show_my_introduce").show('slow');
	$(".show_my_introduce_mod_open").show('slow');
});

//자기소개 편집 요청
$(".show_my_introduce_mod_submit").on("click",function(){
	var u_introduce = $(".show_my_introduce_mod textarea").val();
	
	$.post(contextPath+"/user/mod", {
		u_no: u_no,
		u_introduce: u_introduce
	}, function(data){
		console.log(data);
		location.reload();
	});
});

// 프로필 수정 창 열기
$(".mod_my_img_open").on("click",function(){
	$(".mod_my_img").show("slow");
});
// 프로필 수정 취소
$(".mod_my_img_cancel").on("click",function(){
	$(".mod_my_img").hide("slow");
});



// 프로필 수정 요청
$(".mod_my_img_submit").on("click",function(){
	var formData = new FormData();
	var inputFile = $("input[name='updateMyProfile']");
	var files = inputFile[0].files;
	
	/*console.log(files);*/
	// 파일이 있을 경우만
	if(files.length > 0){
		for(var i=0;i<files.length;i++){
			console.log(i+"번째");
			formData.append("file", files[i]);
		}
		
		$.ajax({
			type: "POST",
			url: contextPath+"/user/updateProfile/"+login_u_no,
			processData: false,
			contentType: false,
			data: formData,
			success: function(data){
//				console.log(data);
				var fileInfo = getFileInfo(data[0]);
				var html = "<img src='"+fileInfo.imgSrc+"' alt='프로필 사진' class='FilledImg roundingProfileImg' />";
				$(".show_my_img").html(html);
				$(".mod_my_img").hide();
				
				
			}
		});
	}else {
		alert("변경할 이미지를 업로드하지 않으셨습니다.");
		return;
	}
	
	
	
	
});

// 파일 업로드시 미리보기 띄우기
function previewImg(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지 확장자만 가능합니다!");
			return;
		}
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$(".show_my_img img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

