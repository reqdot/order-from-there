<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onunload="closePopup();">
	<div class="wrapper">
		<c:import url="../../include/sidebar.jsp" />
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
					</div>
				</div>
			</nav>
			
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
<!-- 							<ul class="nav nav-pills nav-pills-info"> -->
<!-- 								<li id="day" class="active"><a href="#pill1" data-toggle="tab">일별보기</a></li> -->
<!-- 								<li id="month"><a href="#pill2" data-toggle="tab">월별보기</a></li> -->
<!-- 							</ul> -->
							<br>
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title">${retrieveDayAdjust[0].storeName}의 일일 정산 내역</h4>
									<p class="category">
									<fmt:formatDate value="${retrieveDayAdjust[0].adjustDate}" pattern="yyyy년 MM월 dd일" />
									<i class="material-icons text-black" onclick="javascript:popupOpen();" style="cursor: pointer;">
									date_range</i></p>
								</div>
	                            <div class="card-content table-responsive">
	                                <table id="table" class="table">
	                                    <thead class="text-primary">
	                                    	<th>날짜</th>
	                                    	<th>상품명</th>
	                                    	<th>판매수</th>
											<th>매출액</th>
										</thead>
											
										<tbody id="tbody">
 											<c:forEach var="list" items="${retrieveDayAdjust}"> 
											<tr>
												<td><fmt:formatDate value="${list.adjustDate}" pattern="yyyy-MM-dd" /></td>
												<td>${list.menuName}</td>
												<td>${list.totalNumber}</td>
												<td><fmt:formatNumber value="${list.totalSales}" pattern="#,###" />원</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						
						
						<!-- 상품별 매출 그래프 -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<div class="card"> -->
<!-- 								<div class="card-header card-chart" data-background-color="orange"> -->
<!-- 									<div class="ct-chart" id="emailsSubscriptionChart"></div> -->
<!-- 								</div> -->
<!-- 								<div class="card-content"> -->
<!-- 									<h4 class="title">상품별 매출액</h4> -->
<!-- 								</div> -->
<!-- 								<div class="card-footer"> -->
<!-- 									<div class="stats"> -->
<!-- 										일일 정산 그래프 -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
					</div>
				</div>
			</div>
			<c:import url="../../include/footer.jsp" />
		</div>
	</div>
	
	<script>
	function popupOpen() {
		var popUrl = "${pageContext.request.contextPath}/view/adjust/calendar.html";
	    var popOption = "width=400, height=500, resizable=yes, scrollbars=yes, status=no";
		objPopup = window.open(popUrl, "", popOption);
		objPopup.focus();
	}

	function closePopup() {
		if(objPopup!= null) objPopup.close(); 
	}
	
	
	var table = document.getElementById("table");
	var rowsCount = table.rows.length;
	
	
// 	$(document).ready(function(){

		
//         /* ----------==========     Emails Subscription Chart initialization    ==========---------- */
		
//         var arr1[rowsCount];
//         var arr2[rowsCount];
        	
//         for (var i = 1 ; i <= rowsCount ; i++) {
//         	 arr1[i] = $('#table').rows[i].cells[0].innerHTML
//         	 arr2[i] = $('#table').rows[i].cells[3].innerHTML
        	 
//         }
//         var dataEmailsSubscriptionChart = {
//           labels: arr1,
//           series: [
//             arr2

//           ]
//         };
//         var optionsEmailsSubscriptionChart = {
//             axisX: {
//                 showGrid: false
//             },
//             low: 0,
//             high: 1000,
//             chartPadding: { top: 0, right: 10, bottom: 0, left: 0}
//         };
//         var responsiveOptions = [
//           ['screen and (max-width: 1200px)', {
//             seriesBarDistance: 5,
//             axisX: {
//               labelInterpolationFnc: function (value) {
//                 return value[0];
//               }
//             }
//           }]
//         ];
//         var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart, responsiveOptions);

//         //start animation for the Emails Subscription Chart
//         md.startAnimationForBarChart(emailsSubscriptionChart);

// 	});
	
	</script>
</body>
</html>
