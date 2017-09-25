<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<%@ include file="/WEB-INF/views/common/config.jsp" %>

<!DOCTYPE html>
<html lang="${accessibility}">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title>${sessionSiteName }</title>
	<link rel="stylesheet" href="/css/${lang}/font/font.css" />
	<link rel="stylesheet" href="/images/${lang}/icon/glyph/glyphicon.css" />
	<link rel="stylesheet" href="/externlib/${lang}/normalize/normalize.min.css" />
	<link rel="stylesheet" href="/externlib/${lang}/jquery-ui/jquery-ui.css" />
	<link rel="stylesheet" href="/css/${lang}/style.css" />
</head>

<body>
	<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
	<%@ include file="/WEB-INF/views/layouts/menu.jsp" %>
	
	<div class="site-body">
		<div class="container">
			<div class="site-content">
				<%@ include file="/WEB-INF/views/layouts/sub_menu.jsp" %>
				<div class="page-area">
					<%@ include file="/WEB-INF/views/layouts/page_header.jsp" %>
					
					<div class="page-content">
						<div class="content-desc u-pull-right"><span class="icon-glyph glyph-emark-dot color-warning"></span>체크표시는 필수입력 항목입니다.</div>
						<div class="tabs">
							<ul>
								<li><a href="#user_info_tab">기본정보</a></li>
								<li><a href="#user_device_tab">디바이스</a></li>
							</ul>
							<div id="user_info_tab">
								<form:form id="userInfo" modelAttribute="userInfo" method="post" onsubmit="return false;">
								<table class="input-table scope-row">
									<col class="col-label" />
									<col class="col-input" />
									<tr>
										<th class="col-label" scope="row">
											<form:label path="user_id">아이디</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:hidden path="duplication_value"/>
											<form:input path="user_id" cssClass="m" />
					  						<input type="button" id="user_duplication_buttion" value="중복확인" />
					  						<span class="table-desc" style="padding-left: 5px;">최소길이 ${policy.user_id_min_length}</span>
											<form:errors path="user_id" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="user_group_name">사용자 그룹</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:hidden path="user_group_id" />
				 							<form:input path="user_group_name" cssClass="m" readonly="true" />
											<input type="button" id="user_group_buttion" value="그룹선택" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="user_name">이름</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:input path="user_name" class="m" />
					  						<form:errors path="user_name" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="password">비밀번호</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:password path="password" class="m" />
											<span class="table-desc">영문 대문자 ${policy.password_eng_upper_count}, 소문자 ${policy.password_eng_lower_count},
												 숫자 ${policy.password_number_count}, 특수문자 ${policy.password_special_char_count} 자 이상 필수.
												 ${policy.password_min_length} ~ ${policy.password_max_length}자</span>
											<form:errors path="password" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="password_confirm">비밀번호 확인</form:label>
											<span class="icon-glyph glyph-emark-dot color-warning"></span>
										</th>
										<td class="col-input">
											<form:password path="password_confirm" class="m" />
											<form:errors path="password_confirm" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="telephone1">전화번호</form:label>
										</th>
										<td class="col-input">
											<form:input path="telephone1" class="xs" maxlength="3" />
											<span class="delimeter dash">-</span>
											<form:input path="telephone2" class="xs" maxlength="4" />
											<span class="delimeter dash">-</span>
											<form:input path="telephone3" class="xs" maxlength="4" />
											<form:errors path="telephone1" cssClass="error" />
											<form:errors path="telephone2" cssClass="error" />
											<form:errors path="telephone3" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="mobile_phone1">핸드폰 번호</form:label>
										</th>
										<td class="col-input">
											<form:input path="mobile_phone1" class="xs" maxlength="3" />
											<span class="delimeter dash">-</span>
											<form:input path="mobile_phone2" class="xs" maxlength="4" />
											<span class="delimeter dash">-</span>
											<form:input path="mobile_phone3" class="xs" maxlength="4" />
											<form:errors path="mobile_phone1" cssClass="error" />
											<form:errors path="mobile_phone2" cssClass="error" />
											<form:errors path="mobile_phone3" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="email1">이메일</form:label>
										</th>
										<td class="col-input">
											<form:input path="email1" class="s" />
											<span class="delimeter at">@</span>
											<form:input path="email2" class="s" />
											<select id="email3" name="email3" class="select">
				               		 			<option value="0">직접입력</option>
	<c:if test="${!empty emailCommonCodeList }">
		<c:forEach var="commonCode" items="${emailCommonCodeList}" varStatus="status">
				               		 			<option value="${commonCode.code_value }">${commonCode.code_value }</option>
		</c:forEach>
	</c:if>
											</select>
											<form:errors path="email1" cssClass="error" />
											<form:errors path="email2" cssClass="error" />
											<form:errors path="email" cssClass="error" />
										</td>
									</tr>
									<tr>
										<th class="col-label" scope="row">
											<form:label path="messanger">메신저</form:label>
										</th>
										<td class="col-input">
											<form:input path="messanger" class="m" />
											<form:errors path="messanger" cssClass="error" />
										</td>
									</tr>
								</table>
								
								<div class="button-group">
									<div id="insertUserLink" class="center-buttons">
										<input type="submit" value="저장" onclick="insertUser();" />
										<a href="/user/list-user.do" class="button">목록</a>
									</div>
								</div>
								</form:form>
							</div>
										
							<div id="user_device_tab">
								<form:form id="userDevice" modelAttribute="userDevice" method="post" onsubmit="return false;">
								<table class="input-table scope-col">
									<col class="col-number" />
									<col class="col-name" />
									<col class="col-type-select" />
									<col class="col-ip" />
									<col class="col-toggle-radio" />
									<col class="col-functions" />
									<thead>
										<tr>
											<th class="col-number" scope="col">우선순위</th>
											<th class="col-name" scope="col">
												<span>사용기기명</span>
												<span class="icon-glyph glyph-emark-dot color-warning"></span>
											</th>
											<th class="col-type-select" scope="col">
												<span>타입</span>
												<span class="icon-glyph glyph-emark-dot color-warning"></span>
											</th>
											<th class="col-ip" scope="col">접속 IP</th>
											<th class="col-toggle-radio" scope="col">
												<span>사용여부</span>
												<span class="icon-glyph glyph-emark-dot color-warning"></span>
											</th>
											<th class="col-functions" scope="col">삭제</th>
										</tr>
									</thead>
									
									<tbody>
										<tr id="user_device1">
											<td class="col-number">1</td>
											<td class="col-name"><form:input path="device_name1" cssClass="m" /></td>
											<td class="col-type-select">
												<select id="device_type1" name="device_type1" class="select">
					               		 			<option value="0">PC</option>
													<option value="1">핸드폰</option>
												</select>
											</td>
											<td class="col-ip"><form:input path="device_ip1" class="m"/></td>
											<td class="col-type-select">
												<select id="use_yn1" name="use_yn1" class="select">
					               		 			<option value="Y">사용</option>
													<option value="N">미사용</option>
												</select>
											</td>
											<td class="col-functions">
												<a href="#" onclick="removeUserDevice(1);" class="image-button button-delete">삭제</a>
											</td>
										</tr>
									
										<tr id="user_device2">
											<td class="col-number">2</td>
											<td class="col-name"><form:input path="device_name2" cssClass="m" /></td>
											<td class="col-type-select">
												<select id="device_type2" name="device_type2" class="select">
					               		 			<option value="0">PC</option>
													<option value="1">핸드폰</option>
												</select>
											</td>
											<td class="col-ip"><form:input path="device_ip2" class="m"/></td>
											<td class="col-type-select">
												<select id="use_yn2" name="use_yn2" class="select">
					               		 			<option value="Y">사용</option>
													<option value="N">미사용</option>
												</select>
											</td>
											<td class="col-functions">
												<a href="#" onclick="removeUserDevice(2);" class="image-button button-delete">삭제</a>
											</td>
										</tr>
									
										<tr id="user_device3">
											<td class="col-number">3</td>
											<td class="col-name"><form:input path="device_name3" cssClass="m" /></td>
											<td class="col-type-select">
												<select id="device_type3" name="device_type3" class="select">
					               		 			<option value="0">PC</option>
													<option value="1">핸드폰</option>
												</select>
											</td>
											<td class="col-ip"><form:input path="device_ip3" class="m"/></td>
											<td class="col-type-select">
												<select id="use_yn3" name="use_yn3" class="select">
					               		 			<option value="Y">사용</option>
													<option value="N">미사용</option>
												</select>
											</td>
											<td class="col-functions">
												<a href="#" onclick="removeUserDevice(3);" class="image-button button-delete">삭제</a>
											</td>
										</tr>
										<tr id="user_device4">
											<td class="col-number">4</td>
											<td class="col-name"><form:input path="device_name4" cssClass="m" /></td>
											<td class="col-type-select">
												<select id="device_type4" name="device_type4" class="select">
					               		 			<option value="0">PC</option>
													<option value="1">핸드폰</option>
												</select>
											</td>
											<td class="col-ip"><form:input path="device_ip4" class="m"/></td>
											<td class="col-type-select">
												<select id="use_yn4" name="use_yn4" class="select">
					               		 			<option value="Y">사용</option>
													<option value="N">미사용</option>
												</select>
											</td>
											<td class="col-functions">
												<a href="#" onclick="removeUserDevice(4);" class="image-button button-delete">삭제</a>
											</td>
										</tr>
										<tr id="user_device5">
											<td class="col-number">5</td>
											<td class="col-name"><form:input path="device_name5" cssClass="m" /></td>
											<td class="col-type-select">
												<select id="device_type5" name="device_type5" class="select">
					               		 			<option value="0">PC</option>
													<option value="1">핸드폰</option>
												</select>
											</td>
											<td class="col-ip"><form:input path="device_ip5" class="m"/></td>
											<td class="col-type-select">
												<select id="use_yn5" name="use_yn5" class="select">
					               		 			<option value="Y">사용</option>
													<option value="N">미사용</option>
												</select>
											</td>
											<td class="col-functions">
												<a href="#" onclick="removeUserDevice(5);" class="image-button button-delete">삭제</a>
											</td>
										</tr>
										<tr>
											<td colspan="6" class="col-none">
												<div class="button-group">
													<div class="center-buttons">
														<input type="button" value="추가" onclick="addUserDevice();" style="background-color: #573592 ;"/>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="button-group">
									<div id="insertUserDeviceLink" class="center-buttons">
										<input type="submit" value="저장" onclick="insertUserDevice();" />
										<a href="/user/list-user.do?${listParameters}" class="button">목록</a>
									</div>
								</div>
								</form:form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
	
	<!-- Dialog -->
	<div class="dialog" title="사용자 그룹">
		<div class="dialog-user-group">
<c:if test="${!empty userGroupList }">
			<ul>
	<c:set var="groupDepthValue" value="0" />
	<c:forEach var="userGroup" items="${userGroupList }" varStatus="status">
		<c:if test="${groupDepthValue eq '0' && userGroup.depth eq 1 }">
				<li>
					<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
					<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>
		<c:if test="${groupDepthValue eq '1' && userGroup.depth eq 1 }">
				</li>
				<li>
					<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
					<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>
		<c:if test="${groupDepthValue eq '1' && userGroup.depth eq 2 }">
					<ul>
						<li>
							<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
							<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>
		<c:if test="${groupDepthValue eq '2' && userGroup.depth eq 1 }">
						</li>
					</ul>
				</li>
				<li>
					<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
					<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>
		<c:if test="${groupDepthValue eq '2' && userGroup.depth eq 2 }">
						</li>
						<li>
							<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
							<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>
		<c:if test="${groupDepthValue eq '2' && userGroup.depth eq 3 }">
							<ul style="padding-left: 30px;">
								<li>
									<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
									<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>
		<c:if test="${groupDepthValue eq '3' && userGroup.depth eq 1 }">
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
					<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>		
		<c:if test="${groupDepthValue eq '3' && userGroup.depth eq 2 }">
								</li>
							</ul>
						</li>
						<li>
							<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
							<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>			
		<c:if test="${groupDepthValue eq '3' && userGroup.depth eq 3 }">
								</li>
								<li>
									<input type="radio" id="radio_group_${userGroup.user_group_id }" name="radio_group" value="${userGroup.user_group_id }_${userGroup.group_name }" />
									<label for="radio_group_${userGroup.user_group_id }">${userGroup.group_name }</label>
		</c:if>	
		<c:if test="${userGroup.depth eq '3' && status.last }">
								</li>
							</ul>
						</li>
					</ul>
				</li>
		</c:if>
		<c:if test="${userGroup.depth eq '2' && status.last }">
						</li>
					</ul>
				</li>
		</c:if>
		<c:if test="${userGroup.depth eq '1' && status.last }">
				</li>
		</c:if>
		<c:set var="groupDepthValue" value="${userGroup.depth }" />			
	</c:forEach>
			</ul>
</c:if>
		</div>
			
		<div class="button-group">
			<input type="submit" id="button_groupSelect" name="button_groupSelect" value="선택" />
		</div>
	</div>

<script src="/externlib/${lang}/jquery/jquery.js"></script>
<script src="/externlib/${lang}/jquery-ui/jquery-ui.js"></script>		
<script type="text/javascript" src="/js/${lang}/common.js"></script>
<script type="text/javascript" src="/js/${lang}/message.js"></script>
<script type="text/javascript">
	// 0은 비표시, 1은 표시
	var userDeviceArray = new Array("0", "0", "0", "0", "0", "0");
	var userDeviceCount = 0;
	$(document).ready(function() {
		$( ".tabs" ).tabs();
		initJqueryCalendar();
		initUserDevice();
	});
	
	// 그룹 선택
	$( "#user_group_buttion" ).on( "click", function() {
		dialog.dialog( "open" );
	});
	var dialog = $( ".dialog" ).dialog({
		autoOpen: false,
		height: 600,
		width: 600,
		modal: true,
		resizable: false
	});
	
	// 디바이스 초기화
	function initUserDevice() {
		for(var i = 1; i<6; i++) {
			$("#user_device" + i).css("display", "none");
		}
	}
	
	// 아이디 중복 확인
	$( "#user_duplication_buttion" ).on( "click", function() {
		var userId = $("#user_id").val();
		if (userId == "") {
			alert(JS_MESSAGE["user.id.empty"]);
			$("#user_id").focus();
			return false;
		}
		var info = "user_id=" + userId;
		$.ajax({
			url: "/user/ajax-user-id-duplication-check.do",
			type: "POST",
			data: info,
			cache: false,
			async:false,
			dataType: "json",
			success: function(msg){
				if(msg.result == "success") {
					if(msg.duplication_value != "0") {
						alert(JS_MESSAGE["user.id.duplication"]);
						$("#user_id").focus();
						return false;
					} else {
						alert(JS_MESSAGE["user.id.enable"]);
						$("#duplication_value").val(msg.duplication_value);
					}
				} else {
					alert(JS_MESSAGE[msg.result]);
				}
			},
			error: function() {
				alert(JS_MESSAGE["ajax.error.message"]);
			}
		});
	});
	
	// 그룹 선택
	$( "#button_groupSelect" ).on( "click", function() {
		var radioObj = $(":radio[name=radio_group]:checked").val();
		if (!radioObj) {
			alert('그룹이 선택되지 않았습니다.');
	        return false;
	    } else {
	    	var splitValues = radioObj.split("_");
	    	var userGroupName = "";
	    	for(var i = 1; i < splitValues.length; i++) {
	    		userGroupName = userGroupName + splitValues[i];
	    		if(i != splitValues.length - 1) {
	    			userGroupName = userGroupName + "_";
	    		}
			}	    	
	    	$("#user_group_id").val(splitValues[0]);
			$("#user_group_name").val(userGroupName);
			dialog.dialog( "close" );
	    }
	});
	
	// 사용자 정보 저장
	var insertUserFlag = true;
	function insertUser() {
		if (checkUser() == false) {
			return false;
		}
		if(insertUserFlag) {
			insertUserFlag = false;
			var info = $("#userInfo").serialize();
			$.ajax({
				url: "/user/ajax-insert-user-info.do",
				type: "POST",
				data: info,
				cache: false,
				async:false,
				dataType: "json",
				success: function(msg){
					if(msg.result == "success") {
						alert(JS_MESSAGE["user.insert"]);
						$("#duplication_value").val("");
						$("#insertUserLink").empty();
						$("#reloadMobilePhone").html(msg.maskingMobilePhone);
						$("#reloadEmail").html(msg.maskingEmail);
						$("#reloadMessanger").html(msg.messanger);
					} else {
						if(msg.result == "user.password.exception.char") {
							alert(JS_MESSAGE["user.password.exception.char.message1"] + "${passwordExceptionChar}" + JS_MESSAGE["user.password.exception.char.message2"]);
						} else {
							alert(JS_MESSAGE[msg.result]);							
						}
					}
					insertUserFlag = true;
				},
				error:function(request,status,error){
			        //alert(JS_MESSAGE["ajax.error.message"]);
			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        insertUserFlag = true;
				}
			});
		} else {
			alert(JS_MESSAGE["button.dobule.click"]);
			return;
		}
	}
	
	function checkUser() {
		if ($("#user_id").val() == "") {
			alert(JS_MESSAGE["user.id.empty"]);
			$("#user_id").focus();
			return false;
		}
		if($("#user_id").val().length < parseInt("${policy.user_id_min_length}")) {
			alert("사용자 아이디 최소 길이는 ${policy.user_id_min_length} 입니다.");
			$("#user_id").focus();
			return;
		}
		if ($("#user_group_id").val() == "") {
			alert(JS_MESSAGE["user.group.id.empty"]);
			$("#user_group_id").focus();
			return false;
		}
		if ($("#user_name").val() == "") {
			alert(JS_MESSAGE["user.name.empty"]);
			$("#user_name").focus();
			return false;
		}
		var password = $("#password").val();
		if (password == "") {
			alert(JS_MESSAGE["password.empty"]);
			$("#password").focus();
			return false;
		}
		var password_confirm = $("#password_confirm").val();
		if (password_confirm == "") {
			alert(JS_MESSAGE["password.correct.empty"]);
			$("#password_confirm").focus();
			return false;
		}
		if(password != password_confirm) {
			alert("비밀번호가 비밀번호 확인 이랑 일치하지 않습니다.");
			$("#password").focus();
			return false;
		}
		var telephone_regExp1 = /^\d{2,3}$/;
		var telephone1 = $("#telephone1").val();
		if (telephone1 != null && telephone1 != "" && !telephone_regExp1.test(telephone1)) {
			alert("전화번호 형식에 맞게 입력해 주십시오.");
			$("#telephone1").focus();
			return false;
		}
		var telephone_regExp2 = /^\d{3,4}$/;
		var telephone2 = $("#telephone2").val();
		if (telephone2 != null && telephone2 != "" && !telephone_regExp2.test(telephone2)) {
			alert("전화번호 형식에 맞게 입력해 주십시오.");
			$("#telephone2").focus();
			return false;
		}
		var telephone_regExp3 = /^\d{4,4}$/;
		var telephone3 = $("#telephone3").val();
		if (telephone3 != null && telephone3 != "" && !telephone_regExp3.test(telephone3)) {
			alert("전화번호 형식에 맞게 입력해 주십시오.");
			$("#telephone3").focus();
			return false;
		}
		var mobilephone_regExp1 = /^\d{3,3}$/;
		var mobile_phone1 = $("#mobile_phone1").val();
		if (mobile_phone1 != null && mobile_phone1 != "" && !mobilephone_regExp1.test(mobile_phone1)) {
			alert("핸드폰 번호 형식에맞게 입력해 주십시오.");
			$("#mobile_phone1").focus();
			return false;
		}
		var mobilephone_regExp2 = /^\d{3,4}$/;
		var mobile_phone2 = $("#mobile_phone2").val();
		if (mobile_phone2 != null && mobile_phone2 != "" && !mobilephone_regExp2.test(mobile_phone2)) {
			alert("핸드폰 번호 형식에맞게 입력해 주십시오.");
			$("#mobile_phone2").focus();
			return false;
		}
		var mobilephone_regExp3 = /^\d{4,4}$/;
		var mobile_phone3 = $("#mobile_phone3").val();
		if (mobile_phone3 != null && mobile_phone3 != "" && !mobilephone_regExp3.test(mobile_phone3)) {
			alert("핸드폰 번호 형식에맞게 입력해 주십시오.");
			$("#mobile_phone3").focus();
			return false;
		}
		var email_regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if ($("#email1").val() != null && $("#email1").val() != "" && $("#email2").val() != null && $("#email2").val() != "") {
			if (!email_regExp.test($("#email1").val() + "@" + $("#email2").val())) {
				alert("이메일 형식에 맞게 입력해 주십시오.");
				return false;
			}
		}
		if($("#duplication_value").val() == null || $("#duplication_value").val() == "") {
			alert("아이디 중복확인을 해주십시오.");
			return false;
		} else if($("#duplication_value").val() == "1") {
			alert("사용중인 아이디 입니다. 다른 아이디를 선택해 주십시오.");
			return false;
		}
	}
	
	// 사용자 디바이스 정보 저장
	var insertUserDeviceFlag = true;
	function insertUserDevice() {
		if (checkUserDevice() == false) {
			return false;
		}
		if(insertUserDeviceFlag) {
			insertUserDeviceFlag = false;
			var info = $("#userDevice").serialize() + "&user_id=" + $("#user_id").val();		
			$.ajax({
				url: "/user/ajax-insert-user-device.do",
				type: "POST",
				data: info,
				cache: false,
				async:false,
				dataType: "json",
				success: function(msg){
					if(msg.result == "success") {
						alert(JS_MESSAGE["insert"]);
						$("#insertUserDeviceLink").empty();
					} else {
						alert(JS_MESSAGE[msg.result]);
					}
					insertUserDeviceFlag = true;
				},
				error:function(request,status,error){
			        alert(JS_MESSAGE["ajax.error.message"]);
			        insertUserDeviceFlag = true;
				}
			});
		} else {
			alert(JS_MESSAGE["button.dobule.click"]);
			return;
		}
	}
	
	function checkUserDevice() {
		if ($("#user_id").val() == "") {
			alert("사용자 기본 정보 등록 후 이용 가능 합니다.");
			return false;
		}
		for(var i=1; i<userDeviceCount + 1; i++) {
			if(document.getElementById("user_device" + i).style.display == "") {
				if($("#device_name" + i).val() == null || $("#device_name" + i).val() == "") {
					alert("사용 기기명을 입력해 주십시오.");
					$("#device_name" + i).focus();
					return false;
				}
			}
		}
		
		for(var i=1; i<userDeviceCount + 1; i++) {
			if(!isIP($("#device_ip" + i).val())) {
				alert("IP 형식에 맞게 입력해 주십시오.");
				$("#device_ip" + i).focus();
				return false;
			}
		}
	}
	
	// 사용자 디바이스 추가
	function addUserDevice() {
		if(userDeviceArray[0] == "0") {
			$("#user_device1").css("display", "");
			userDeviceArray[0] = "1";
			userDeviceCount++;
		} else if(userDeviceArray[1] == "0") {
			$("#user_device2").css("display", "");
			userDeviceArray[1] = "1";
			userDeviceCount++;
		} else if(userDeviceArray[2] == "0") {
			$("#user_device3").css("display", "");
			userDeviceArray[2] = "1";
			userDeviceCount++;
		} else if(userDeviceArray[3] == "0") {
			$("#user_device4").css("display", "");
			userDeviceArray[3] = "1";
			userDeviceCount++;
		} else if(userDeviceArray[4] == "0") {
			$("#user_device5").css("display", "");
			userDeviceArray[4] = "1";
			userDeviceCount++;
		} else if(userDeviceArray[5] == "0") {
			userDeviceArray[5] = "1";
		}
		
		if(userDeviceArray[0] == "1" && userDeviceArray[1] == "1" && userDeviceArray[2] == "1"
				&& userDeviceArray[3] == "1" && userDeviceArray[4] == "1" && userDeviceArray[5] == "1") {
			alert("사용자 디바이스 등록은 최대 5개 까지 가능합니다.");
		}
		userDeviceArray[5] = "0"
	}
	
	// 사용자 디바이스 삭제
	function removeUserDevice(idx) {
		var loopCount = userDeviceCount + 1;
		for(var i = idx; i < loopCount; i++) {
			if(i == loopCount - 1) {
				// 마지막의 경우 삭제하고 종료
				userDeviceArray[i-1] = "0";
				$("#device_name" + i).val("");
				$("#device_ip" + i).val("");
				document.getElementById("device_type" + i).selectedIndex = 0;
				document.getElementById("use_yn" + i).selectedIndex = 0;
				$("#user_device" + i).css("display", "none");
				userDeviceCount--;
				return;
			}
			
			$("#device_name" + i).val( $("#device_name" + (i + 1)).val() );
			$("#device_ip" + i).val( $("#device_ip" + (i + 1)).val() );
			document.getElementById("device_type" + i).selectedIndex = document.getElementById("device_type" + (i+1)).selectedIndex;
			document.getElementById("use_yn" + i).selectedIndex = document.getElementById("use_yn" + (i+1)).selectedIndex;
		}
	}
	
	$( "#email3" ).selectmenu({
		change: function( event, ui ) {
			if($("#email3").val() != 0) {
				$("#email2").val($("#email3").val());
			} else {
				$("#email2").val("");
			}
		}
	});
</script>
</body>
</html>