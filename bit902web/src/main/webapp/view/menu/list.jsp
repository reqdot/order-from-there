<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">

	<div>
		<c:import url="../../include/sidebar.jsp" />
	</div>
	<div class="main-panel">
		<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
					<a class="navbar-brand" href="#">메뉴관리</a>
					</div>
				</div>
		</nav>
		<div class="content">
	    	<div class="container-fluid">
	         	<div class="row">
	             	<div class="col-md-15">
	                 	<div class="card">
	                   		<div class="card-header" data-background-color="purple">
	                         	<h4 class="title">메뉴등록하기</h4>
								<p class="category">상점의 메뉴를 등록해주세요</p>
	                         </div>
	                       	  <div class="card-content">	                            
								<form class="form-horizontal" action="javascript:writeform()" id="wForm" runat="server" enctype="multipart/form-data" method="post">
								<div  class="row" id="menu"  >
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">메뉴명</label>
													<input type="text" class="form-control" name="menuName" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">내용</label>
													<input type="text" class="form-control" name="content" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">가격</label>
													<input type="text" class="form-control" name="price" >
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">사이즈</label>
													<input type="text" class="form-control" name="size">
												</div>
	                                        </div>
	                                        <div class="col-md-3">
												<div >
													<label class="control-label">메뉴이미지</label>
													<input type="file" name="attachFile" id="imgInp">
												</div>
	                                        </div>
	                               			<div><img id="blah"  style="width:300px;height:150px; border:dotted 1px purple"/></div>
	                               		
	                               
	                               </div>
<!-- 	                               <a href="javascript:writeform();" class="btn btn-primary pull-right">등록하기</a> -->
	                               <button type="submit" class="btn btn-primary pull-right">등록하기</button>    
								   </form>
								</div>
	                    	 </div>
	          			 </div>
	       			 </div>
	      		 </div>
<!----------------------------------------리스트 UI----------------------------------------------------------------------->
	  				  <div class="col-md-12">
	                     <div class="card card-plain">
	                         <div class="card-header" data-background-color="purple">
	                              <h4 class="title">메뉴 수정,삭제하기</h4>
	                              <p class="category">상점의 메뉴를 확인하세요</p>
	                          </div>
	                            <div class="card-content table-responsive">
	                                <table class="table table-hover">
	                                    <thead class="text-primary">
	                                        <th>메뉴사진</th>
	                                    	<th>메뉴명</th>
	                                    	<th>사이즈</th>
	                                    	<th>가격</th>
	                                    	<th>설명</th>
	                                    </thead>
	                                    <tbody id="list">
<!-- 	                                        <tr style="height:150px;width:100%"> -->
<!-- 	                                        	<td>1abbb</td> -->
<!-- 	                                        	<td>Dakota Rice</td> -->
<!-- 	                                        	<td>$36,738</td> -->
<!-- 	                                        	<td>Niger</td> -->
<!-- 	                                        	<td>Oud-Turnhout123123</td> -->
<!-- 	                                        	<td style="widht:10px"><button>수정</button><button>삭제</button></td> -->
<!-- 	                                        </tr> -->
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	  	 			 </div>
				</div>
			</div>
<script>
makeMenu();
//메뉴리스트 공통항목
function makeMenu(){
	
	var sellerNo = ${seller.sellerNo};
	alert('판매자번호:' + sellerNo);
	$.ajax({
		type:"POST",
		url : "/bit902web/menu/list.do",
		dataType: "JSON"
	})
	.done(function (result){
		console.log("zzzzz");
		var html = "";
		
// 		var menus = result.getkey(menu);
		var menus = result.menu;
		
		for(var i=0; i < menus.length; i++){
	
		html+=                      "<tr style='height:150px;width:100%''>"
// 		html+= 						"<img src=" + tf.filePath + "style='height: 200px; width: 200px;'>";
// 		html+=                       	"<td><img src='${pageContext.request.contextPath}/upload${donation.filePath}/${donation.systemName}' width='100px' height='100px'></img></td>"
		html+=                       	"<td>"+menus[i].name+"</td>"
		html+=                       	"<td>"+menus[i].size+"</td>"
		html+=                       	"<td>"+menus[i].price+"</td>"
		html+=                       	"<td>"+menus[i].content+"</td>"
		html+=                       	"<td style='widht:10px'><button>수정</button><button>삭제</button></td>"
		html+=                       "</tr>"
	
			
		}
		if (result.length == 0) {
			html += '게시글이 없습니다';
		}
		$("#list").html(html);
	});
	
}
//메뉴 작성폼
function writeform(){
	var fd = new FormData();
	//서버에 전송할 대상값들을 넣어주면됨(파일이 여러개라면 파일이름을 쪼개야함)
	//서브밋하기위한 폼데이터 설정
	fd.append("menuName", $("[name=menuName]").val());
	fd.append("content", $("[name=content]").val());
	fd.append("price", $("[name=price]").val());
	fd.append("size", $("[name=size]").val());
// 	fd.append("userNo", localStorage.getItem("userNo"));
	fd.append("attachFile",$("[name=attachFile]")[0].files[0]);

// 	var files =  $("[name=attachFile]")[0].files;
// 	for(var i = 0; i < files.length; i++){
// 		fd.append("attachFile"+i, files[i]);
// 		}
	
	
	$.ajax({
		url: "/bit902web/menu/write.do",
		data: fd, 
		type: "POST",
		processData: false,  //기본방식 쓰지마요
		contentType: false
	})
		.done(function (result){
			alert("글 등록이 완료되었습니다.");
			makeMenu();
		})
		.fail(function(jqXhr, testStatus, errorText){
			alert("에러발생1 :" + errorText);
});
	
	}

//이미지미리보기
$(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}

//리스트페이지부름
function menuList() {
	$("#test3").load("/bit902web/view/menu/menuwriteform.jsp");
}

</script>
</body>
</html>