<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<script type="text/javascript">
	var sel_file;

	$(document).ready(
			function() {

				$('#forms_employment').val('${resume.forms_employment}');

				$('#desired_work_place').val('${resume.desired_work_place}');

				$('#plus_School').click(function() {
					$('#list_menu li').eq(0).css('display', 'none');
					$('#list_menu li').eq(1).css('display', 'block');
					create_School();
					$('#form_School').css('display', 'block');
				});

				$('#minus_School').click(
						function() {
							$('#list_menu li').eq(1).css('display', 'none');
							$('#list_menu li').eq(0).css('display', 'block');
							$('#form_School').children('div#div_School')
									.children('div.new').remove();
							$('#form_School').css('display', 'none');
						});

				$('#plus_Career').click(function() {
					$('#list_menu li').eq(2).css('display', 'none');
					$('#list_menu li').eq(3).css('display', 'block');
					create_Career();
					$('#form_Career').css('display', 'block');
				});

				$('#minus_Career').click(
						function() {
							$('#list_menu li').eq(3).css('display', 'none');
							$('#list_menu li').eq(2).css('display', 'block');
							$('#form_Career').children('div#div_Career')
									.children('div.new').remove();
							$('#form_Career').css('display', 'none');
						});

				$('#plus_Activities').click(function() {
					$('#list_menu li').eq(4).css('display', 'none');
					$('#list_menu li').eq(5).css('display', 'block');
					create_Activities();
					$('#form_Activities').css('display', 'block');
				});

				$('#minus_Activities').click(
						function() {
							$('#list_menu li').eq(5).css('display', 'none');
							$('#list_menu li').eq(4).css('display', 'block');
							$('#form_Activities')
									.children('div#div_Activities').children(
											'div.new').remove();
							$('#form_Activities').css('display', 'none');
						});

				$('#plus_Education').click(function() {
					$('#list_menu li').eq(6).css('display', 'none');
					$('#list_menu li').eq(7).css('display', 'block');
					create_Education();
					$('#form_Education').css('display', 'block');
				});

				$('#minus_Education').click(
						function() {
							$('#list_menu li').eq(7).css('display', 'none');
							$('#list_menu li').eq(6).css('display', 'block');
							$('#form_Education').children('div#div_Education')
									.children('div.new').remove();
							$('#form_Education').css('display', 'none');
						});

				$('#plus_Certificate').click(function() {
					$('#list_menu li').eq(8).css('display', 'none');
					$('#list_menu li').eq(9).css('display', 'block');
					create_Certificate();
					$('#form_Certificate').css('display', 'block');
				});

				$('#minus_Certificate').click(
						function() {
							$('#list_menu li').eq(9).css('display', 'none');
							$('#list_menu li').eq(8).css('display', 'block');
							$('#form_Certificate').children(
									'div#div_Certificate').children('div.new')
									.remove();
							$('#form_Certificate').css('display', 'none');
						});

				$('#plus_Award').click(function() {
					$('#list_menu li').eq(10).css('display', 'none');
					$('#list_menu li').eq(11).css('display', 'block');
					create_Award();
					$('#form_Award').css('display', 'block');
				});

				$('#minus_Award').click(
						function() {
							$('#list_menu li').eq(11).css('display', 'none');
							$('#list_menu li').eq(10).css('display', 'block');
							$('#form_Award').children('div#div_Award')
									.children('div.new').remove();
							$('#form_Award').css('display', 'none');
						});

				$('#plus_Overseas_Experience').click(function() {
					$('#list_menu li').eq(12).css('display', 'none');
					$('#list_menu li').eq(13).css('display', 'block');
					create_Overseas_Experience();
					$('#form_Overseas_Experience').css('display', 'block');
				});

				$('#minus_Overseas_Experience').click(
						function() {
							$('#list_menu li').eq(13).css('display', 'none');
							$('#list_menu li').eq(12).css('display', 'block');
							$('#div_Overseas_Experience').html("");
							$('#form_Overseas_Experience').children(
									'div#div_Overseas_Experience').children(
									'div.new').remove();
							$('#form_Overseas_Experience').css('display',
									'none');
						});

				$('#plus_Language').click(function() {
					$('#list_menu li').eq(14).css('display', 'none');
					$('#list_menu li').eq(15).css('display', 'block');
					create_Language();
					$('#form_Language').css('display', 'block');
				});

				$('#minus_Language').click(
						function() {
							$('#list_menu li').eq(15).css('display', 'none');
							$('#list_menu li').eq(14).css('display', 'block');
							$('#form_Language').children('div#div_Language')
									.children('div.new').remove();
							$('#form_Language').css('display', 'none');
						});

				$('#plus_Preferential').click(function() {
					$('#list_menu li').eq(16).css('display', 'none');
					$('#list_menu li').eq(17).css('display', 'block');
					create_Preferential();
					$('#form_Preferential').css('display', 'block');
				});

				$('#minus_Preferential').click(
						function() {
							$('#list_menu li').eq(17).css('display', 'none');
							$('#list_menu li').eq(16).css('display', 'block');
							$('#form_Preferential').children(
									'div#div_Preferential').children('div.new')
									.remove();
							$('#form_Preferential').css('display', 'none');
						});

				$('#myImg').click(function() {
					$("input[name='imgfile']").click();

				});

				$("input[name='imgfile']").on("change", handleImgFileSelect);

			});

	var formData = new FormData();
	var resume_title;
	var upfile;
	var info = new FormData();

	function submit() {
		upfile = $("input[name='imgfile']")[0].files[0];

		resume();
	}

	function resume() {

		var resume_no = $('.resume_title').find("input[name='resume_no']").val();
		var member_no = $('.resume_title').find("input[name='member_no']").val();
		resume_title = $('.resume_title').find("input[name='resume_title']").val();
		var resume_name = $('#user_info').find("input[name='resume_name']").val();
		var resume_birth = $('#user_info').find("input[name='resume_birth']").val();
		var resume_gender = $('#user_info').find("select[name='resume_gender']").val();
		var resume_email = $('#user_info').find("input[name='resume_email']").val();
		var resume_phone = $('#user_info').find("input[name='resume_phone']").val();
		var resume_cellphone = $('#user_info').find("input[name='resume_cellphone']").val();
		var resume_addr = $('#user_info').find("input[name='resume_addr']").val();

		var forms_employment = $('.Preferential').find("select[name='forms_employment']").val();
		var desired_work_place = $('.Preferential').find("select[name='desired_work_place']").val();
		var salary = $('.Preferential').find("input[name='salary']").val();
		var filename;
		
		if (member_no == "") {
			member_no = 0;
		}
		if(typeof upfile === "undefined"){
			filename = "";
		} else {
			filename = upfile.name;
		}
		
		formData.append("filename", filename);
		formData.append("upfile", upfile);
		formData.append("resume_no", resume_no);
		formData.append("member_no", member_no);
		formData.append("resume_title", resume_title);
		formData.append("resume_name", resume_name);
		formData.append("resume_birth", resume_birth);
		formData.append("resume_gender", resume_gender);
		formData.append("resume_email", resume_email);
		formData.append("resume_phone", resume_phone);
		formData.append("resume_cellphone", resume_cellphone);
		formData.append("resume_addr", resume_addr);
		formData.append("forms_employment", forms_employment);
		formData.append("desired_work_place", desired_work_place);
		formData.append("salary", salary);

		school();
		career();
		activities();
		education();
		certificate();
		award();
		overseas_Experience();
		language();
		preferential();

		$.ajax({
			url : "/mypage/resume/update",
			type : "POST",
			enctype : "multipart/form-data",
			contentType : false,
			processData : false,
			cache : false,
			data : formData,
			success : function(data) {
				location.href = "/mypage/resume/list";
			},
			error : function() {
				alert("error");
			}
		});
	}

	function school() {
		var countSchool = $("#form_School .add").size();
		
		if(countSchool != "0") {
			var school_numbers = new Array();
			var school_classification = new Array();
			var school_name = new Array();
			var graduation_date = new Array();
			var graduation_status = new Array();
			var ged_status = new Array();
			var academic_degree = new Array();
			var admission_date = new Array();
			var transfer_status = new Array();
			var major_name = new Array();
			var credit = new Array();
			var total_score = new Array();
			var sub_major_status = new Array();
			var sub_major_name = new Array();
			var graduation_thesis_content = new Array();
			
			for(var i=0; i<countSchool; i++) {
				var val_ged_status = $("#div_School").children("div.add").eq(i).find("input[name='ged_status']").prop("checked");
				var val_school_name = $("#div_School").children("div.add").eq(i).find("input[name='school_name']").val();
				var val_graduation_date = $("#div_School").children("div.add").eq(i).find("input[name='graduation_date']").val();
				var val_academic_degree = $("#div_School").children("div.add").eq(i).find("select[name='academic_degree']").val();
				var val_admission_date = $("#div_School").children("div.add").eq(i).find("input[name='admission_date']").val();
				var val_transfer_status= $("#div_School").children("div.add").eq(i).find("input[name='transfer_status']").prop("checked");
				var val_major_name = $("#div_School").children("div.add").eq(i).find("input[name='major_name']").val();
				var val_credit = $("#div_School").children("div.add").eq(i).find("input[name='credit']").val();
				var val_total_score = $("#div_School").children("div.add").eq(i).find("select[name='total_score']").val();
				var val_sub_major_status = $("#div_School").children("div.add").eq(i).find("select[name='sub_major_status']").val();
				var val_sub_major_name = $("#div_School").children("div.add").eq(i).find("input[name='sub_major_name']").val();
				var val_graduation_thesis_content = $("#div_School").children("div.add").eq(i).find("textarea[name='graduation_thesis_content']").val();
				
				school_numbers.push(i+1);
				school_classification.push($("#div_School").children("div.add").eq(i).find("select[name='school_classification']").val());
				if(typeof val_school_name == "undefined"|| val_school_name == null || val_school_name == ""){
					school_name.push("0");
				}else{
					school_name.push($("#div_School").children("div.add").eq(i).find("input[name='school_name']").val());
				}
// 				school_name.push($("#div_School").children("div.add").eq(i).find("input[name='school_name']").val());
				if(typeof val_graduation_date == "undefined"|| val_graduation_date == null || val_graduation_date == ""){
					graduation_date.push("0");
				}else{
					graduation_date.push($("#div_School").children("div.add").eq(i).find("input[name='graduation_date']").val());
				}
// 				graduation_date.push($("#div_School").children("div.add").eq(i).find("input[name='graduation_date']").val());
				graduation_status.push($("#div_School").children("div.add").eq(i).find("select[name='graduation_status']").val());
				if(typeof val_ged_status == "undefined"|| val_ged_status == null || val_ged_status == ""){
					ged_status.push("false");
				}else{
					ged_status.push($("#div_School").children("div.add").eq(i).find("input[name='ged_status']").prop("checked"));
				}
// 				ged_status.push($("#div_School").children("div.add").eq(i).find("input[name='ged_status']").prop("checked"));
				if(typeof val_academic_degree == "undefined"|| val_academic_degree == null || val_academic_degree == ""){
					academic_degree.push("0");
				}else{
					academic_degree.push($("#div_School").children("div.add").eq(i).find("select[name='academic_degree']").val());
				}
// 				academic_degree.push($("#div_School").children("div.add").eq(i).find("select[name='academic_degree']").val());
				if(typeof val_admission_date == "undefined"|| val_admission_date == null || val_admission_date == ""){
					admission_date.push("0");
				}else{
					admission_date.push($("#div_School").children("div.add").eq(i).find("input[name='admission_date']").val());
				}
// 				admission_date.push($("#div_School").children("div.add").eq(i).find("input[name='admission_date']").val());
				if(typeof val_transfer_status == "undefined"|| val_transfer_status == null || val_transfer_status == ""){
					transfer_status.push("false");
				}else{
					transfer_status.push($("#div_School").children("div.add").eq(i).find("input[name='transfer_status']").prop("checked"));
				}
// 				transfer_status.push($("#div_School").children("div.add").eq(i).find("input[name='transfer_status']").prop("checked"));
				
				if(typeof val_major_name == "undefined"|| val_major_name == null || val_major_name == ""){
					major_name.push("0");
				}else{
					major_name.push($("#div_School").children("div.add").eq(i).find("input[name='major_name']").val());
				}
// 				major_name.push($("#div_School").children("div.add").eq(i).find("input[name='major_name']").val());
				
				if(typeof val_credit == "undefined"|| val_credit == null || val_credit == ""){
					credit.push("0");
				}else{
					credit.push($("#div_School").children("div.add").eq(i).find("input[name='credit']").val());
				}
// 				credit.push($("#div_School").children("div.add").eq(i).find("input[name='credit']").val());
				
				if(typeof val_total_score == "undefined"|| val_total_score == null || val_total_score == ""){
					total_score.push("0");
				}else{
					total_score.push($("#div_School").children("div.add").eq(i).find("select[name='total_score']").val());
				}
// 				total_score.push($("#div_School").children("div.add").eq(i).find("select[name='total_score']").val());
				
				if(typeof val_sub_major_status == "undefined"|| val_sub_major_status == null || val_sub_major_status == ""){
					sub_major_status.push("0");
				}else{
					sub_major_status.push($("#div_School").children("div.add").eq(i).find("select[name='sub_major_status']").val());
				}
// 				sub_major_status.push($("#div_School").children("div.add").eq(i).find("select[name='sub_major_status']").val());
				
				if(typeof val_sub_major_name == "undefined"|| val_sub_major_name == null || val_sub_major_name == ""){
					sub_major_name.push("0");
				}else{
					sub_major_name.push($("#div_School").children("div.add").eq(i).find("input[name='sub_major_name']").val());
				}
// 				sub_major_name.push($("#div_School").children("div.add").eq(i).find("input[name='sub_major_name']").val());
				
				if(typeof val_graduation_thesis_content == "undefined"|| val_graduation_thesis_content == null || val_graduation_thesis_content == ""){
					graduation_thesis_content.push("0");
				}else{
					graduation_thesis_content.push($("#div_School").children("div.add").eq(i).find("textarea[name='graduation_thesis_content']").val());
				}
// 				graduation_thesis_content.push($("#div_School").children("div.add").eq(i).find("textarea[name='graduation_thesis_content']").val());
				
			}
			formData.append("school_numbers",school_numbers );
			formData.append("school_classification",school_classification);
			formData.append("school_name",school_name);
			formData.append("graduation_date",graduation_date);
			formData.append("graduation_status",graduation_status);
			formData.append("ged_status",ged_status);
			formData.append("academic_degree",academic_degree);
			formData.append("admission_date",admission_date);
			formData.append("transfer_status",transfer_status);
			formData.append("major_name",major_name);
			formData.append("credit",credit);
			formData.append("total_score",total_score);
			formData.append("sub_major_status",sub_major_status);
			formData.append("sub_major_name",sub_major_name);
			formData.append("graduation_thesis_content",graduation_thesis_content);
			
		}
	}
	
	function career() {
		var countCareer = $("#form_Career .add").size();
		
		if(countCareer != "0") {
			var career_numbers = new Array();
			var company_name = new Array();
			var department_name = new Array();
			var hire_date = new Array();
			var retirement_date = new Array();
			var served_status = new Array();
			var position = new Array();
			var job_work = new Array();
			var career_salary = new Array();
			var assigned_task = new Array();
			
			
			for(var i=0; i<countCareer; i++) {
				var val_company_name = $("#div_Career").children("div.add").eq(i).find("input[name='company_name']").val();
				var val_department_name = $("#div_Career").children("div.add").eq(i).find("input[name='department_name']").val();
				var val_hire_date = $("#div_Career").children("div.add").eq(i).find("input[name='hire_date']").val();
				var val_retirement_date = $("#div_Career").children("div.add").eq(i).find("input[name='retirement_date']").val();
				var val_served_status = $("#div_Career").children("div.add").eq(i).find("input[name='served_status']").prop("checked");
				var val_position = $("#div_Career").children("div.add").eq(i).find("input[name='position']").val();
				var val_job_work = $("#div_Career").children("div.add").eq(i).find("input[name='job_work']").val();
				var val_career_salary = $("#div_Career").children("div.add").eq(i).find("input[name='salary']").val();
				var val_assigned_task = $("#div_Career").children("div.add").eq(i).find("textarea[name='assigned_task']").val();
				
				career_numbers.push(i+1);
				if(typeof val_department_name == "undefined"|| val_department_name == null || val_department_name == ""){
					company_name.push("0");
				}else{
					company_name.push($("#div_Career").children("div.add").eq(i).find("input[name='company_name']").val());
				}
// 				company_name.push($("#div_Career").children("div.add").eq(i).find("input[name='company_name']").val());

				if(typeof val_company_name == "undefined"|| val_company_name == null || val_company_name == ""){
					department_name.push("0");
				}else{
					department_name.push($("#div_Career").children("div.add").eq(i).find("input[name='department_name']").val());
				}
// 				department_name.push($("#div_Career").children("div.add").eq(i).find("input[name='department_name']").val());
				
				if(typeof val_hire_date == "undefined"|| val_hire_date == null || val_hire_date == ""){
					hire_date.push("0");
				}else{
					hire_date.push($("#div_Career").children("div.add").eq(i).find("input[name='hire_date']").val());
				}
// 				hire_date.push($("#div_Career").children("div.add").eq(i).find("input[name='hire_date']").val());
				
				if(typeof val_retirement_date == "undefined"|| val_retirement_date == null || val_retirement_date == ""){
					retirement_date.push("0");
				}else{
					retirement_date.push($("#div_Career").children("div.add").eq(i).find("input[name='retirement_date']").val());
				}
// 				retirement_date.push($("#div_Career").children("div.add").eq(i).find("input[name='retirement_date']").val());
				
				if(typeof val_served_status == "undefined"|| val_served_status == null || val_served_status == ""){
					served_status.push("false");
				}else{
					served_status.push($("#div_Career").children("div.add").eq(i).find("input[name='served_status']").prop("checked"));
				}
// 				served_status.push($("#div_Career").children("div.add").eq(i).find("input[name='served_status']").prop("checked"));
				
				if(typeof val_position == "undefined"|| val_position == null || val_position == ""){
					position.push("0");
				}else{
					position.push($("#div_Career").children("div.add").eq(i).find("input[name='position']").val());
				}
// 				position.push($("#div_Career").children("div.add").eq(i).find("input[name='position']").val());
				
				if(typeof val_job_work == "undefined"|| val_job_work == null || val_job_work == ""){
					job_work.push("0");
				}else{
					job_work.push($("#div_Career").children("div.add").eq(i).find("input[name='job_work']").val());
				}
// 				job_work.push($("#div_Career").children("div.add").eq(i).find("input[name='job_work']").val());
				
				if(typeof val_career_salary == "undefined"|| val_career_salary == null || val_career_salary == ""){
					career_salary.push("0");
				}else{
					career_salary.push($("#div_Career").children("div.add").eq(i).find("input[name='salary']").val());
				}
// 				career_salary.push($("#div_Career").children("div.add").eq(i).find("input[name='salary']").val());

				if(typeof val_assigned_task == "undefined"|| val_assigned_task == null || val_assigned_task == ""){
					assigned_task.push("0");
				}else{
					assigned_task.push($("#div_Career").children("div.add").eq(i).find("textarea[name='assigned_task']").val());	
				}
// 				assigned_task.push($("#div_Career").children("div.add").eq(i).find("textarea[name='assigned_task']").val());	
			}
			
			formData.append("career_numbers",career_numbers );
			formData.append("company_name",company_name );
			formData.append("department_name",department_name );
			formData.append("hire_date",hire_date );
			formData.append("retirement_date",retirement_date );
			formData.append("served_status",served_status );
			formData.append("position",position );
			formData.append("job_work",job_work );
			formData.append("career_salary",career_salary );
			formData.append("assigned_task",assigned_task );
		}
		
	}
	
	function activities() {
		var countActivities = $("#form_Activities .add").size();
		
		if(countActivities  != "0") {
			var activities_numbers = new Array();
			var activity_classification = new Array();
			var institution_name = new Array();
			var activity_start_date = new Array();
			var activity_end_date = new Array();
			var activity_content = new Array();
			
			for(var i=0; i<countActivities; i++) {
				var val_institution_name = $("#div_Activities").children("div.add").eq(i).find("input[name='institution_name']").val();
				var val_start_date = $("#div_Activities").children("div.add").eq(i).find("input[name='start_date']").val();
				var val_end_date = $("#div_Activities").children("div.add").eq(i).find("input[name='end_date']").val();
				var val_activity_content = $("#div_Activities").children("div.add").eq(i).find("textarea[name='activity_content']").val();
				
				activities_numbers.push(i+1);
				activity_classification.push($("#div_Activities").children("div.add").eq(i).find("select[name='activity_classification']").val());
				
				if(typeof val_institution_name == "undefined"|| val_institution_name == null || val_institution_name == ""){
					institution_name.push("0");
				}else{
					institution_name.push($("#div_Activities").children("div.add").eq(i).find("input[name='institution_name']").val());
				}
// 				institution_name.push($("#div_Activities").children("div.add").eq(i).find("input[name='institution_name']").val());

				if(typeof val_start_date == "undefined"|| val_start_date == null || val_start_date == ""){
					activity_start_date.push("0");
				}else{
					activity_start_date.push($("#div_Activities").children("div.add").eq(i).find("input[name='start_date']").val());
				}
// 				activity_start_date.push($("#div_Activities").children("div.add").eq(i).find("input[name='start_date']").val());

				if(typeof val_end_date == "undefined"|| val_end_date == null || val_end_date == ""){
					activity_end_date.push("0");
				}else{
					activity_end_date.push($("#div_Activities").children("div.add").eq(i).find("input[name='end_date']").val());
				}
// 				activity_end_date.push($("#div_Activities").children("div.add").eq(i).find("input[name='end_date']").val());

				if(typeof val_activity_content == "undefined"|| val_activity_content == null || val_activity_content == ""){
					activity_content.push("0");
				}else{
					activity_content.push($("#div_Activities").children("div.add").eq(i).find("textarea[name='activity_content']").val());
				}
				activity_content.push($("#div_Activities").children("div.add").eq(i).find("textarea[name='activity_content']").val());
			}
			
			formData.append("activities_numbers",activities_numbers );
			formData.append("activity_classification",activity_classification );
			formData.append("institution_name",institution_name );
			formData.append("activity_start_date",activity_start_date );
			formData.append("activity_end_date",activity_end_date );
			formData.append("activity_content",activity_content );
		}
	}
	
	function education() {
		var countEducation = $("#form_Education .add").size();
		
		if(countEducation != "0") {
			var education_numbers = new Array();
			var training_title = new Array();
			var educational_facilities = new Array();
			var education_start_date = new Array();
			var education_end_date = new Array();
			var training_content = new Array();
			
			for(var i=0; i<countEducation; i++) {
				var val_training_title = $("#div_Education").children("div.add").eq(i).find("input[name='training_title']").val();
				var val_educational_facilities = $("#div_Education").children("div.add").eq(i).find("input[name='educational_facilities']").val();
				var val_start_date = $("#div_Education").children("div.add").eq(i).find("input[name='start_date']").val();
				var val_end_date = $("#div_Education").children("div.add").eq(i).find("input[name='end_date']").val();
				var val_training_content = $("#div_Education").children("div.add").eq(i).find("textarea[name='training_content']").val();
				
				education_numbers.push(i+1);
				if(typeof val_training_title == "undefined"|| val_training_title == null || val_training_title == ""){
					training_title.push("0");
				}else{
					training_title.push($("#div_Education").children("div.add").eq(i).find("input[name='training_title']").val());
				}
// 				training_title.push($("#div_Education").children("div.add").eq(i).find("input[name='training_title']").val());

				if(typeof val_educational_facilities == "undefined"|| val_educational_facilities == null || val_educational_facilities == ""){
					educational_facilities.push("0");
				}else{
					educational_facilities.push($("#div_Education").children("div.add").eq(i).find("input[name='educational_facilities']").val());
				}
// 				educational_facilities.push($("#div_Education").children("div.add").eq(i).find("input[name='educational_facilities']").val());
				
				if(typeof val_start_date == "undefined"|| val_start_date == null || val_start_date == ""){
					education_start_date.push("0");
				}else{
					education_start_date.push($("#div_Education").children("div.add").eq(i).find("input[name='start_date']").val());
				}
// 				education_start_date.push($("#div_Education").children("div.add").eq(i).find("input[name='start_date']").val());
				
				if(typeof val_end_date == "undefined"|| val_end_date == null || val_end_date == ""){
					education_end_date.push("0");
				}else{
					education_end_date.push($("#div_Education").children("div.add").eq(i).find("input[name='end_date']").val());
				}
// 				education_end_date.push($("#div_Education").children("div.add").eq(i).find("input[name='end_date']").val());
				
				if(typeof val_training_content == "undefined"|| val_training_content == null || val_training_content == ""){
					training_content.push("0");
				}else{
					training_content.push($("#div_Education").children("div.add").eq(i).find("textarea[name='training_content']").val());
				}
// 				training_content.push($("#div_Education").children("div.add").eq(i).find("textarea[name='training_content']").val());
	
			}
			
			formData.append("education_numbers",education_numbers );
			formData.append("training_title",training_title );
			formData.append("educational_facilities",educational_facilities );
			formData.append("education_start_date",education_start_date );
			formData.append("education_end_date",education_end_date );
			formData.append("training_content",training_content );
		}
	}
	
	function certificate() {
		var countCertificate = $("#form_Certificate .add").size();
		
		if(countCertificate  != "0") {
			var certificate_numbers = new Array();
			var certificate_name = new Array();
			var place_issue = new Array();
			var certificate_acquisition_date = new Array();
			
			for(var i=0; i<countCertificate; i++) {
				var val_certificate_name = $("#div_Certificate").children("div.add").eq(i).find("input[name='certificate_name']").val();
				var val_place_issue = $("#div_Certificate").children("div.add").eq(i).find("input[name='place_issue']").val();
				var val_acquisition_date = $("#div_Certificate").children("div.add").eq(i).find("input[name='acquisition_date']").val();
				
				certificate_numbers.push(i+1);
				
				if(typeof val_certificate_name == "undefined"|| val_certificate_name == null || val_certificate_name == ""){
					certificate_name.push("0");
				}else{
					certificate_name.push($("#div_Certificate").children("div.add").eq(i).find("input[name='certificate_name']").val());
				}
// 				certificate_name.push($("#div_Certificate").children("div.add").eq(i).find("input[name='certificate_name']").val());

				if(typeof val_place_issue == "undefined"|| val_place_issue == null || val_place_issue == ""){
					place_issue.push("0");
				}else{
					place_issue.push($("#div_Certificate").children("div.add").eq(i).find("input[name='place_issue']").val());
				}
// 				place_issue.push($("#div_Certificate").children("div.add").eq(i).find("input[name='place_issue']").val());
				
				if(typeof val_acquisition_date == "undefined"|| val_acquisition_date == null || val_acquisition_date == ""){
					certificate_acquisition_date.push("0");
				}else{
					certificate_acquisition_date.push($("#div_Certificate").children("div.add").eq(i).find("input[name='acquisition_date']").val());
				}
// 				certificate_acquisition_date.push($("#div_Certificate").children("div.add").eq(i).find("input[name='acquisition_date']").val());
			}
			
			formData.append("certificate_numbers",certificate_numbers );
			formData.append("certificate_name",certificate_name );
			formData.append("place_issue",place_issue );
			formData.append("certificate_acquisition_date",certificate_acquisition_date );
		}
	}
	
	function award() {
		var countAward = $("#form_Award .add").size();
		
		if(countAward   != "0") {
			var award_numbers = new Array();
			var award_name = new Array();
			var award_service = new Array();
			var award_date = new Array();
			var award_content = new Array();
			
			for(var i=0; i<countAward ; i++) {
				var val = $("#div_Award").children("div.add").eq(i).find("input[name='award_name']").val();
				var val2 = $("#div_Award").children("div.add").eq(i).find("input[name='award_service']").val();
				var val3 = $("#div_Award").children("div.add").eq(i).find("input[name='award_date']").val();
				var val4 = $("#div_Award").children("div.add").eq(i).find("textarea[name='award_content']").val();
				award_numbers.push(i+1);
				if(typeof val == "undefined"|| val == null || val == ""){
					award_name.push("0");
				}else{
					award_name.push($("#div_Award").children("div.add").eq(i).find("input[name='award_name']").val());
				}
// 				award_name.push($("#div_Award").children("div.add").eq(i).find("input[name='award_name']").val());
				if(typeof val2 == "undefined"|| val2 == null || val2 == ""){
					award_service.push("0");
				}else{
					award_service.push($("#div_Award").children("div.add").eq(i).find("input[name='award_service']").val());
				}
				
// 				award_service.push($("#div_Award").children("div.add").eq(i).find("input[name='award_service']").val());
				if(typeof val3 == "undefined"|| val3 == null || val3 == ""){
					award_date.push("0");
				}else{
					award_date.push($("#div_Award").children("div.add").eq(i).find("input[name='award_date']").val());
				}
// 				award_date.push($("#div_Award").children("div.add").eq(i).find("input[name='award_date']").val());
				if(typeof val4 == "undefined"|| val4 == null || val4 == ""){
					award_content.push("0");
				}else{
					award_content.push($("#div_Award").children("div.add").eq(i).find("textarea[name='award_content']").val());
				}
// 				award_content.push($("#div_Award").children("div.add").eq(i).find("textarea[name='award_content']").val());
				
			}
			
			formData.append("award_numbers",award_numbers );
			formData.append("award_name",award_name );
			formData.append("award_service",award_service );
			formData.append("award_date",award_date );
			formData.append("award_content",award_content );
		}
	}
	
	function overseas_Experience() {
		var countOverseas_Experience = $("#form_Overseas_Experience .add").size();
		
		if(countOverseas_Experience != "0") {
			var overseas_Experience_numbers = new Array();
			var country_name = new Array();
			var overseas_Experience_start_date = new Array();
			var overseas_Experience_end_date = new Array();
			var overseas_experience_content = new Array();
			
			for(var i=0; i<countOverseas_Experience; i++) {
				var val_country_name = $("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='country_name']").val();
				var val_start_date = $("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='start_date']").val();
				var val_end_date = $("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='end_date']").val();
				var val_overseas_experience_content = $("#div_Overseas_Experience").children("div.add").eq(i).find("textarea[name='overseas_experience_content']").val();
				
				overseas_Experience_numbers.push(i+1);
				
				if(typeof val_country_name == "undefined"|| val_country_name == null || val_country_name == ""){
					country_name.push("0");
				}else{
					country_name.push($("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='country_name']").val());
				}
// 				country_name.push($("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='country_name']").val());

				if(typeof val_start_date == "undefined"|| val_start_date == null || val_start_date == ""){
					overseas_Experience_start_date.push("0");
				}else{
					overseas_Experience_start_date.push($("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='start_date']").val());
				}
// 				overseas_Experience_start_date.push($("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='start_date']").val());
				
				if(typeof val_end_date == "undefined"|| val_end_date == null || val_end_date == ""){
					overseas_Experience_end_date.push("0");
				}else{
					overseas_Experience_end_date.push($("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='end_date']").val());
				}
// 				overseas_Experience_end_date.push($("#div_Overseas_Experience").children("div.add").eq(i).find("input[name='end_date']").val());
				
				if(typeof val_overseas_experience_content == "undefined"|| val_overseas_experience_content == null || val_overseas_experience_content == ""){
					overseas_experience_content.push("0");
				}else{
					overseas_experience_content.push($("#div_Overseas_Experience").children("div.add").eq(i).find("textarea[name='overseas_experience_content']").val());
				}
// 				overseas_experience_content.push($("#div_Overseas_Experience").children("div.add").eq(i).find("textarea[name='overseas_experience_content']").val());
				
			}
			
			formData.append("overseas_Experience_numbers",overseas_Experience_numbers );
			formData.append("country_name",country_name );
			formData.append("overseas_Experience_start_date",overseas_Experience_start_date );
			formData.append("overseas_Experience_end_date",overseas_Experience_end_date );
			formData.append("overseas_experience_content",overseas_experience_content );
		}
	}
	
	function language() {
		var countLanguage = $("#form_Language .add").size();
		
		if(countLanguage   != "0") {
			var language_numbers = new Array();
			var language_classification = new Array();
			var language_name = new Array();
			var language_score = new Array();
			var conversational_ability = new Array();
			var language_acquisition_date = new Array();
			
			for(var i=0; i<countLanguage ; i++) {
				var val_language_name = $("#div_Language").children("div.add").eq(i).find("select[name='language_name']").val();
				var val_language_score = $("#div_Language").children("div.add").eq(i).find("input[name='language_score']").val();
				var val_acquisition_date = $("#div_Language").children("div.add").eq(i).find("input[name='acquisition_date']").val();
				
				language_numbers.push(i+1);
				language_classification.push($("#div_Language").children("div.add").eq(i).find("select[name='language_classification']").val());
				
				if(typeof val_language_name == "undefined"|| val_language_name == null || val_language_name == ""){
					language_name.push("0");
				}else{
					language_name.push($("#div_Language").children("div.add").eq(i).find("select[name='language_name']").val());
				}
// 				language_name.push($("#div_Language").children("div.add").eq(i).find("select[name='language_name']").val());
				
				if(typeof val_language_score == "undefined"|| val_language_score == null || val_language_score == ""){
					language_score.push("0");
				}else{
					language_score.push($("#div_Language").children("div.add").eq(i).find("input[name='language_score']").val());
				}
// 				language_score.push($("#div_Language").children("div.add").eq(i).find("input[name='language_score']").val());
				conversational_ability.push($("#div_Language").children("div.add").eq(i).find("select[name='conversational_ability']").val());
				
				if(typeof val_acquisition_date == "undefined"|| val_acquisition_date == null || val_acquisition_date == ""){
					language_acquisition_date.push("0");
				}else{
					language_acquisition_date.push($("#div_Language").children("div.add").eq(i).find("input[name='acquisition_date']").val());
				}
// 				language_acquisition_date.push($("#div_Language").children("div.add").eq(i).find("input[name='acquisition_date']").val());
		
			}
			
			formData.append("language_numbers",language_numbers );
			formData.append("language_classification",language_classification );
			formData.append("language_name",language_name );
			formData.append("language_score",language_score );
			formData.append("conversational_ability",conversational_ability );
			formData.append("language_acquisition_date",language_acquisition_date );
		}
	}

	function preferential() {
		var countPreferential = $("#form_Preferential .add").size();

		if (countPreferential != "0") {
			var Preferential = new Array();

			for (var i = 0; i < countPreferential; i++) {

				Preferential.push($("#div_Preferential").children("div.add")
						.eq(i).find("input[name='veterans']").prop("checked"));
				Preferential.push($("#div_Preferential").children("div.add")
						.eq(i).find("input[name='protect']").prop("checked"));
				Preferential.push($("#div_Preferential").children("div.add")
						.eq(i).find("input[name='funding']").prop("checked"));
				Preferential.push($("#div_Preferential").children("div.add")
						.eq(i).find("select[name='disorder']").val());
				Preferential.push($("#div_Preferential").children("div.add")
						.eq(i).find("select[name='military']").val());
			}
			formData.append("Preferential", Preferential);

		}

	}

	function moreSub() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.sub").css(
				"display", "block");
		$(target).parents("div.sub_footer").find("div.not_sub_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.more_sub_btn").css(
				"display", "none");
	}

	function notSub() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.sub").css(
				"display", "none");
		$(target).parents("div.sub_footer").find("div.more_sub_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.not_sub_btn").css(
				"display", "none");
	}

	function moreGrad() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.grad").css(
				"display", "block");
		$(target).parents("div.sub_footer").find("div.not_grad_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.more_grad_btn").css(
				"display", "none");
	}

	function notGrad() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.grad").css(
				"display", "none");
		$(target).parents("div.sub_footer").find("div.more_grad_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.not_grad_btn").css(
				"display", "none");
	}

	function moreSalary() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.info_career")
				.children("div.salary").css("display", "block");
		$(target).parents("div.sub_footer").find("div.not_salary_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.more_salary_btn").css(
				"display", "none");
	}
	function notSalary() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.info_career")
				.children("div.salary").css("display", "none");
		$(target).parents("div.sub_footer").find("div.more_salary_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.not_salary_btn").css(
				"display", "none");
	}
	function moreTask() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.assigned_task")
				.css("display", "block");
		$(target).parents("div.sub_footer").find("div.not_task_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.more_task_btn").css(
				"display", "none");
	}
	function notTask() {
		var target = event.target;
		$(target).parents("div.sub_footer").siblings("div.row.assigned_task")
				.css("display", "none");
		$(target).parents("div.sub_footer").find("div.more_task_btn").css(
				"display", "block")
		$(target).parents("div.sub_footer").find("div.not_task_btn").css(
				"display", "none");
	}

	function disorderChange() {
		var target = event.target;
		if ($("#checkbox_disorder").is(":checked")) {
			$(target).closest("div.new").find("div.row.disability_grade").css(
					"display", "block")
		} else {
			$(target).closest("div.new").children("div.row.disability_grade")
					.css("display", "none");
		}

	}

	function militaryChange() {
		var target = event.target;
		if ($("#checkbox_military").is(":checked")) {
			$(target).closest("div.new").children("div.row.military_status")
					.css("display", "block");
		} else {
			$(target).closest("div.new").children("div.row.military_status")
					.css("display", "none");
		}

	}

	var thisEle;
	var before;
	var today = new Date();
	var mm = today.getMonth() + 1;
	var yyyy = today.getFullYear();
	if (mm < 10) {
		mm = '0' + mm
	}

	function focusDate() {
		thisEle = event.target;
		before = thisEle.getAttribute("placeholder");
		var after = yyyy + '.' + mm;

		thisEle.setAttribute("placeholder", after);

	}

	function blurDate() {
		thisEle.setAttribute("placeholder", before);
	}
	
	function focusBirth() {
		thisEle = event.target;
		before = thisEle.getAttribute("placeholder");
		var after = "0000.00.00";
		
			thisEle.setAttribute("placeholder", after);
		
	}
	
	function blurBirth() {
		thisEle.setAttribute("placeholder", before);
	}

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_files = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#myImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	function focusSalary() {
		thisEle = event.target;
		before = thisEle.getAttribute("placeholder");
		var after = "만원 이상( , 제외 입력)"

		thisEle.setAttribute("placeholder", after);

	}

	function blurSalary() {
		thisEle.setAttribute("placeholder", before);
	}

	function create_School() {
		$('#div_School')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<select class='selecter_full' name='school_classification' onchange='dynamic_change();'>"
								+ "<option value='0' selected='selected'>학교구분</option>"
								+ "<option value='고등학교'>고등학교</option>"
								+ "<option value='대학'>대학(2,3년)</option>"
								+ "<option value='대학교'>대학교(4년)</option>"
								+ "<option value='대학원'>대학원</option>"
								+ "</select>"
								+ "</div>"
								+ "<div class='info_form school'>"
								+ "<input type='text' name='school_name' placeholder='학교이름'>"
								+ "</div>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}

	function create_Career() {
		$('#div_Career')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form school' style='width: 276px; margin: 0;'>"
								+ "<input type='text' name='company_name' placeholder='회사명'>"
								+ "</div>"
								+ "<div class='info_form school' style='width: 276px;'>"
								+ "<input type='text' name='department_name' placeholder='부서명'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='hire_date' placeholder='입사년월'>"
								+ "</div>"
								+ "<div class='info_form normal'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='retirement_date' placeholder='퇴사년월'>"
								+ "</div>"
								+ "<div class='checkbox'>"
								+ "<p>"
								+ "<input class='input_checkbox' type='checkbox'"+
								"name='served_status'><label"+
								"style='padding-left: 5px;'>재직중</label>"
								+ "</p>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row info_career'>"
								+ "<div class='info_form school' style='width: 276px; margin: 0;'>"
								+ "<input type='text' name='position' placeholder='직급/직책'>"
								+ "</div>"
								+ "<div class='info_form school' style='width: 276px;'>"
								+ "<input type='text' name='job_work' placeholder='직무'>"
								+ "</div>"
								+ "<div class='info_form normal salary' style='display: none;'>"
								+ "<input type='text' name='salary' placeholder='연봉'>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row assigned_task' style='height: 85; display: none;'>"
								+ "<textarea class='textarea_content' name='assigned_task' rows='4'"+
						"cols='118' placeholder='담당업무'></textarea>"
								+ "</div>"
								+ "<div class='sub_footer'>"
								+ "<div class='more_salary_btn'>"
								+ "<button type='button'"
								+ "class='btn btn-default button' onclick='moreSalary();'>"
								+ "<span>연봉 + </span>"
								+ "</button>"
								+ "</div>"
								+ "<div class='not_salary_btn' style='display: none;'>"
								+ "<button type='button'"
								+ "class='btn btn-default button' onclick='notSalary();'>"
								+ "<span>연봉 - </span>"
								+ "</button>"
								+ "</div>"
								+ "<div class='more_task_btn'>"
								+ "<button type='button'"
								+ "class='btn btn-default button' onclick='moreTask();'>"
								+ "<span>담당업무 + </span>"
								+ "</button>"
								+ "</div>"
								+ "<div class='not_task_btn' style='display: none;'>"
								+ "<button type='button'"
								+ "class='btn btn-default button' onclick='notTask();'>"
								+ "<span>담당업무 - </span>"
								+ "</button>"
								+ "</div>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}

	function create_Activities() {
		$('#div_Activities')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<select class='selecter_full' name='activity_classification'>"
								+ "<option value='0' selected='selected'>활동구분</option>"
								+ "<option value='인턴'>인턴</option>"
								+ "<option value='아르바이트'>아르바이트</option>"
								+ "<option value='동아리'>동아리</option>"
								+ "<option value='자원봉사'>자원봉사</option>"
								+ "<option value='사회활동'>사회활동</option>"
								+ "<option value='교내활동'>교내활동</option>"
								+ "</select>"
								+ "</div>"
								+ "<div class='info_form school' style='width: 510px;'>"
								+ "<input type='text' name='institution_name' placeholder='회사/기관/단체명'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='start_date' placeholder='시작년월'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='end_date' placeholder='종료년월'>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row' style='height: 85;'>"
								+ "<textarea class='textarea_content' name='activity_content' rows='4' cols='118' placeholder='활동내용'></textarea>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}

	function create_Education() {
		$('#div_Education')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form school' style='width: 276px;'>"
								+ "<input type='text' name='training_title' placeholder='교육명'>"
								+ "</div>"
								+ "<div class='info_form school' style='width: 276px;'>"
								+ "<input type='text' name='educational_facilities' placeholder='교육기관'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='start_date' placeholder='시작년월'>"
								+ "</div>"
								+ "<div class='info_form normal'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='end_date' placeholder='종료년월'>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row' style='height: 85;'>"
								+ "<textarea class='textarea_content' name='training_content' rows='4' cols='118' placeholder='교육내용'></textarea>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}

	function create_Certificate() {
		$('#div_Certificate')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form school' style='width: 400px;'>"
								+ "<input type='text' name='certificate_name' placeholder='자격증 명'>"
								+ "</div>"
								+ "<div class='info_form school' style='width: 276px;'>"
								+ "<input type='text' name='place_issue' placeholder='발행처'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='acquisition_date' placeholder='취득년월'>"
								+ "</div>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}

	function create_Award() {
		$('#div_Award')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form school' style='width: 400px;'>"
								+ "<input type='text' name='award_name' placeholder='수상명'>"
								+ "</div>"
								+ "<div class='info_form school' style='width: 276px;'>"
								+ "<input type='text' name='award_service' placeholder='수여기관'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='award_date' placeholder='수상년도'>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row' style='height: 85;'>"
								+ "<textarea class='textarea_content' name='award_content' rows='4' cols='118' placeholder='수여내용'></textarea>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}
	function create_Overseas_Experience() {
		$('#div_Overseas_Experience')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form school' style='width: 400px;'>"
								+ "<input type='text' name='country_name' placeholder='국가명'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='start_date' placeholder='시작년월'>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='end_date' placeholder='종료년월'>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row' style='height: 85;'>"
								+ "<textarea class='textarea_content' placeholder='내용' name='overseas_experience_content'></textarea>"
								+

								"</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}

	function create_Language() {
		$('#div_Language')
				.append(
						"<div class='new add'>"
								+ "<div class='row'>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<select class='selecter_full' name='language_classification' onchange='dynamic_change();'>"
								+ "<option value='구분' selected='selected'>구분</option>"
								+ "<option value='회화능력'>회화능력</option>"
								+ "<option value='공인시험'>공인시험</option>"
								+ "</select>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0; width: 200px;'>"
								+ "<select class='selecter_full' name='language_name'>"
								+ "<option value='0' selected='selected'>외국어명</option>"
								+ "<option value='영어'>영어</option>"
								+ "<option value='일본어'>일본어</option>"
								+ "<option value='중국어'>중국어</option>"
								+ "<option value='독일어'>독일어</option>"
								+ "<option value='프랑스어'>프랑스어</option>"
								+ "<option value='스페인어'>스페인어</option>"
								+ "<option value='러시아어'>러시아어</option>"
								+ "<option value='이탈리아어'>이탈리아어</option>"
								+ "<option value='아랍어'>아랍어</option>"
								+ "<option value='태국어'>태국어</option>"
								+ "<option value='마인어'>마인어</option>"
								+ "<option value='그리스어'>그리스어</option>"
								+ "<option value='포르투칼어'>포르투칼어</option>"
								+ "<option value='베트남어'>베트남어</option>"
								+ "<option value='네덜란드어'>네덜란드어</option>"
								+ "<option value='힌디어'>힌디어</option>"
								+ "<option value='노르웨이어'>노르웨이어</option>"
								+ "<option value='유고어'>유고어</option>"
								+ "<option value='히브리어'>히브리어</option>"
								+ "<option value='이란(페르시아어)'>이란(페르시아어)</option>"
								+ "<option value='터키어'>터키어</option>"
								+ "<option value='체코어'>체코어</option>"
								+ "<option value='루마니아어'>루마니아어</option>"
								+ "<option value='몽골어'>몽골어</option>"
								+ "<option value='스웨덴어'>스웨덴어</option>"
								+ "<option value='헝가리어'>헝가리어</option>"
								+ "<option value='폴란드어'>폴란드어</option>"
								+ "<option value='미얀마어'>미얀마어</option>"
								+ "<option value='슬로바이카어'>슬로바이카어</option>"
								+ "<option value='세르비아어'>세르비아어</option>"
								+ "<option value='한국어'>한국어</option>"
								+ "<option value='직접입력'>직접입력</option>"
								+ "</select>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0; width: 140px;'>"
								+ "<select class='selecter_full' name='conversation_ability'>"
								+ "<option value='0' selected='selected'>회화능력</option>"
								+ "<option value='일상회화가능'>일상회화 가능</option>"
								+ "<option value='비즈니스회화가능'>비즈니스 회화가능</option>"
								+ "<option value='원어민수준'>원어민 수준</option>"
								+ "</select>"
								+ "</div>"
								+ "</div>"
								+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
								+ "</div>");
	}
	function create_Preferential() {
		$('#div_Preferential')
				.append(
						"<div class='new add'>"
								+ "<div class='row' style='margin-bottom: 20px;'>"
								+ "<div class='prefer_checkbox'>"
								+ "<div class='checkbox'>"
								+ "<p><input class='input_checkbox' type='checkbox' name='veterans'>"
								+ "<label style='padding-left: 5px;'>보훈대상</label></p>"
								+ "</div>"
								+ "</div>"
								+ "<div class='prefer_checkbox'>"
								+ "<div class='checkbox'>"
								+ "<p><input class='input_checkbox' type='checkbox' name='protect'>"
								+ "<label style='padding-left: 5px;'>취업보호 대상</label></p>"
								+ "</div>"
								+ "</div>"
								+ "<div class='prefer_checkbox'>"
								+ "<div class='checkbox'>"
								+ "<p><input class='input_checkbox' type='checkbox' name='funding'>"
								+ "<label style='padding-left: 5px;'>고용지원금 대상</label></p>"
								+ "</div>"
								+ "</div>"
								+ "<div class='prefer_checkbox'>"
								+ "<div class='checkbox'>"
								+ "<p><input class='input_checkbox' type='checkbox' "
								+ "id='checkbox_disorder' onchange='disorderChange();'><label style='padding-left: 5px;'>장애</label></p>"
								+ "</div>"
								+ "</div>"
								+ "<div class='prefer_checkbox'>"
								+ "<div class='checkbox'>"
								+ "<p><input class='input_checkbox' type='checkbox' "
								+ "id='checkbox_military' onchange='militaryChange();'><label style='padding-left: 5px;'>병역</label></p>"
								+ "</div>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row disability_grade'>"
								+ "<div style='width: 50px; height: 50px; float: left; padding-top: 15px;'>"
								+ "<p>장애</p>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<select class='selecter_full' name='disorder' id='disability_grade'>"
								+ "<option value='0' selected='selected'>장애등급</option>"
								+ "<option value='1급'>1급</option>"
								+ "<option value='2급'>2급</option>"
								+ "<option value='3급'>3급</option>"
								+ "<option value='4급'>4급</option>"
								+ "<option value='5급'>5급</option>"
								+ "<option value='6급'>6급</option>"
								+ "</select>"
								+ "</div>"
								+ "</div>"
								+ "<div class='row military_status'>"
								+ "<div style='width: 50px; height: 50px; float: left; padding-top: 15px;'>"
								+ "<p>병역</p>"
								+ "</div>"
								+ "<div class='info_form normal' style='margin: 0;'>"
								+ "<select class='selecter_full' name='military' id='military_status'>"
								+ "<option value='0' selected='selected'>병역</option>"
								+ "<option value='군필'>군필</option>"
								+ "<option value='미필'>미필</option>"
								+ "<option value='면제'>면제</option>"
								+ "<option value='해당없음'>해당없음</option>"
								+ "</select>" + "</div>" + "</div>" + "</div>");
	}

	function delete_btn() {
		var thisEle = event.target;
		thisEle.closest("div.new").remove();

	}

	function dynamic_change() {

		var thisEle = event.target;
		var target = thisEle.closest("div.new");
		var value = $('option:selected', thisEle).attr('value');
		var defaultHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='school_classification' onchange='dynamic_change();'>"
				+ "<option value='0' selected='selected'>학교구분</option>"
				+ "<option value='고등학교'>고등학교</option>"
				+ "<option value='대학'>대학(2,3년)</option>"
				+ "<option value='대학교'>대학교(4년)</option>"
				+ "<option value='대학원'>대학원</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='school_name' placeholder='학교이름'>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>";

		var highHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='school_classification' onchange='dynamic_change();'>"
				+ "<option value='0'>학교구분</option>"
				+ "<option value='고등학교' selected='selected'>고등학교</option>"
				+ "<option value='대학'>대학(2,3년)</option>"
				+ "<option value='대학교'>대학교(4년)</option>"
				+ "<option value='대학원'>대학원</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='school_name' placeholder='학교이름'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='graduation_date' placeholder='졸업년도'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='graduation_status'>"
				+ "<option value='0' selected='selected'>졸업상태</option>"
				+ "<option value='졸업'>졸업</option>"
				+ "<option value='졸업예정'>졸업예정</option>"
				+ "<option value='재학중'>재학중</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='checkbox'>"
				+ "<p><input class='input_checkbox' type='checkbox' name='ged_status'><label style='padding-left: 5px;'>대입검정고시</label></p>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>"
				+ "</div>";

		var collegeHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='school_classification' onchange='dynamic_change();'>"
				+ "<option value='0'>학교구분</option>"
				+ "<option value='고등학교'>고등학교</option>"
				+ "<option value='대학' selected='selected'>대학(2,3년)</option>"
				+ "<option value='대학교'>대학교(4년)</option>"
				+ "<option value='대학원'>대학원</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='school_name' placeholder='학교이름'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='admission_date' placeholder='입학년월'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='graduation_date' placeholder='졸업년월'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='graduation_status'>"
				+ "<option value='0' selected='selected'>졸업상태</option>"
				+ "<option value='졸업'>졸업</option>"
				+ "<option value='졸업예정'>졸업예정</option>"
				+ "<option value='재학중'>재학중</option>"
				+ "<option value='중퇴'>중퇴</option>"
				+ "<option value='수료'>수료</option>"
				+ "<option value='휴학'>휴학</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='checkbox'>"
				+ "<p><input class='input_checkbox' type='checkbox' name='transfer_status'><label	style='padding-left: 5px;'>편입</label></p>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row'>"
				+ "<div class='info_form school' style='width: 412px;'>"
				+ "<input type='text' name='major_name' placeholder='전공명'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input type='text' name='credit' placeholder='학점'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='total_score'>"
				+ "<option value='0' selected='selected'>총점</option>"
				+ "<option value='4.5'>4.5</option>"
				+ "<option value='4.3'>4.3</option>"
				+ "<option value='4.0'>4.0</option>"
				+ "<option value='100'>100</option>"
				+ "</select>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row sub' style='display: none;'>"
				+ "<div class='sub_major'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='sub_major_status'>"
				+ "<option value='0' selected='selected'>전공선택</option>"
				+ "<option value='부전공'>부전공</option>"
				+ "<option value='복수전공'>복수전공</option>"
				+ "<option value='이중전공'>이중전공</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='sub_major_name' placeholder='전공명'>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row grad' style='height: 85; display: none;'>"
				+ "<textarea class='textarea_content' name='graduation_thesis_content' rows='4' cols='118' placeholder='졸업 논문/작품'></textarea>"
				+ "</div>"
				+ "<div class='sub_footer'>"
				+ "<div class='more_sub_btn'>"
				+ "<button type='button' class='btn btn-default button' onclick='moreSub();'>"
				+ "<span>다른전공 + </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='not_sub_btn' style='display: none;'>"
				+ "<button type='button' class='btn btn-default button' onclick='notSub();'>"
				+ "<span>다른전공 - </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='more_grad_btn'>"
				+ "<button type='button' class='btn btn-default button' onclick='moreGrad();'>"
				+ "<span>졸업 논문/ 작품 + </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='not_grad_btn' style='display: none;'>"
				+ "<button type='button' class='btn btn-default button' onclick='notGrad();'>"
				+ "<span>졸업 논문/ 작품 - </span>"
				+ "</button>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()' ></button>";

		var universityHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='school_classification' onchange='dynamic_change();'>"
				+ "<option value='0'>학교구분</option>"
				+ "<option value='고등학교'>고등학교</option>"
				+ "<option value='대학'>대학(2,3년)</option>"
				+ "<option value='대학교' selected='selected'>대학교(4년)</option>"
				+ "<option value='대학원'>대학원</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='school_name' placeholder='학교이름'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='admission_date' placeholder='입학년월'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='graduation_date' placeholder='졸업년월'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='graduation_status'>"
				+ "<option value='0' selected='selected'>졸업상태</option>"
				+ "<option value='졸업'>졸업</option>"
				+ "<option value='졸업예정'>졸업예정</option>"
				+ "<option value='재학중'>재학중</option>"
				+ "<option value='중퇴'>중퇴</option>"
				+ "<option value='수료'>수료</option>"
				+ "<option value='휴학'>휴학</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='checkbox'>"
				+ "<p><input class='input_checkbox' type='checkbox' name='transfer_status'><label	style='padding-left: 5px;'>편입</label></p>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row'>"
				+ "<div class='info_form school' style='width: 412px;'>"
				+ "<input type='text' name='major_name' placeholder='전공명'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input type='text' name='credit' placeholder='학점'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='total_score'>"
				+ "<option value='0' selected='selected'>총점</option>"
				+ "<option value='4.5'>4.5</option>"
				+ "<option value='4.3'>4.3</option>"
				+ "<option value='4.0'>4.0</option>"
				+ "<option value='100'>100</option>"
				+ "</select>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row sub' style='display: none;'>"
				+ "<div class='sub_major'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='sub_major_status'>"
				+ "<option value='0' selected='selected'>전공선택</option>"
				+ "<option value='부전공'>부전공</option>"
				+ "<option value='복수전공'>복수전공</option>"
				+ "<option value='이중전공'>이중전공</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='sub_major_name' placeholder='전공명'>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row grad' style='height: 85; display: none;'>"
				+ "<textarea class='textarea_content' name='graduation_thesis_content' rows='4' cols='118' placeholder='졸업 논문/작품'></textarea>"
				+ "</div>"
				+ "<div class='sub_footer'>"
				+ "<div class='more_sub_btn'>"
				+ "<button type='button' class='btn btn-default button' onclick='moreSub();'>"
				+ "<span>다른전공 + </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='not_sub_btn' style='display: none;'>"
				+ "<button type='button' class='btn btn-default button' onclick='notSub();'>"
				+ "<span>다른전공 - </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='more_grad_btn'>"
				+ "<button type='button' class='btn btn-default button' onclick='moreGrad();'>"
				+ "<span>졸업 논문/ 작품 + </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='not_grad_btn' style='display: none;'>"
				+ "<button type='button' class='btn btn-default button' onclick='notGrad();'>"
				+ "<span>졸업 논문/ 작품 - </span>"
				+ "</button>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()' ></button>";

		var graduateHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='school_classification' onchange='dynamic_change();'>"
				+ "<option value='0'>학교구분</option>"
				+ "<option value='고등학교'>고등학교</option>"
				+ "<option value='대학'>대학(2,3년)</option>"
				+ "<option value='대학교'>대학교(4년)</option>"
				+ "<option value='대학원' selected='selected'>대학원</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school' style='width: 219px; margin: 0;'>"
				+ "<input type='text' name='school_name' placeholder='학교이름'>"
				+ "</div>"
				+ "<div class='info_form normal' style='width: 80px;'>"
				+ "<select class='selecter_full' name='academic_degree'>"
				+ "<option value='0' selected='selected'>학위</option>"
				+ "<option value='석사'>석사</option>"
				+ "<option value='박사'>박사</option>"
				+ "<option value='석박사'>석박사</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='admission_date' placeholder='입학년월'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='graduation_date' placeholder='졸업년월'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='graduation_status'>"
				+ "<option value='0' selected='selected'>졸업상태</option>"
				+ "<option value='졸업'>졸업</option>"
				+ "<option value='졸업예정'>졸업예정</option>"
				+ "<option value='재학중'>재학중</option>"
				+ "<option value='중퇴'>중퇴</option>"
				+ "<option value='수료'>수료</option>"
				+ "<option value='휴학'>휴학</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='checkbox'>"
				+ "<p><input class='input_checkbox' type='checkbox' name='transfer_status'><label	style='padding-left: 5px;'>편입</label></p>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row'>"
				+ "<div class='info_form school' style='width: 412px;'>"
				+ "<input type='text' name='major_name' placeholder='전공명'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input type='text' name='credit' placeholder='학점'>"
				+ "</div>"
				+ "<div class='info_form normal'>"
				+ "<select class='selecter_full' name='total_score'>"
				+ "<option value='0' selected='selected'>총점</option>"
				+ "<option value='4.5'>4.5</option>"
				+ "<option value='4.3'>4.3</option>"
				+ "<option value='4.0'>4.0</option>"
				+ "<option value='100'>100</option>"
				+ "</select>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row sub' style='display: none;'>"
				+ "<div class='sub_major'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='sub_major_status'>"
				+ "<option value='0' selected='selected'>전공선택</option>"
				+ "<option value='부전공'>부전공</option>"
				+ "<option value='복수전공'>복수전공</option>"
				+ "<option value='이중전공'>이중전공</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form school'>"
				+ "<input type='text' name='sub_major_name' placeholder='전공명'>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "<div class='row grad' style='height: 85; display: none;'>"
				+ "<textarea class='textarea_content' name='graduation_thesis_content' rows='4' cols='118' placeholder='졸업 논문/작품'></textarea>"
				+ "</div>"
				+ "<div class='sub_footer'>"
				+ "<div class='more_sub_btn'>"
				+ "<button type='button' class='btn btn-default button' onclick='moreSub();'>"
				+ "<span>다른전공 + </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='not_sub_btn' style='display: none;'>"
				+ "<button type='button' class='btn btn-default button' onclick='notSub();'>"
				+ "<span>다른전공 - </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='more_grad_btn'>"
				+ "<button type='button' class='btn btn-default button' onclick='moreGrad();'>"
				+ "<span>졸업 논문/ 작품 + </span>"
				+ "</button>"
				+ "</div>"
				+ "<div class='not_grad_btn' style='display: none;'>"
				+ "<button type='button' class='btn btn-default button' onclick='notGrad();'>"
				+ "<span>졸업 논문/ 작품 - </span>"
				+ "</button>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()' ></button>";

		var languageHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='language_classification' onchange='dynamic_change();'>"
				+ "<option value='구분' selected='selected'>구분</option>"
				+ "<option value='회화능력'>회화능력</option>"
				+ "<option value='공인시험'>공인시험</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0; width: 200px;'>"
				+ "<select class='selecter_full' name='language_name'>"
				+ "<option value='0' selected='selected'>외국어명</option>"
				+ "<option value='영어'>영어</option>"
				+ "<option value='일본어'>일본어</option>"
				+ "<option value='중국어'>중국어</option>"
				+ "<option value='독일어'>독일어</option>"
				+ "<option value='프랑스어'>프랑스어</option>"
				+ "<option value='스페인어'>스페인어</option>"
				+ "<option value='러시아어'>러시아어</option>"
				+ "<option value='이탈리아어'>이탈리아어</option>"
				+ "<option value='아랍어'>아랍어</option>"
				+ "<option value='태국어'>태국어</option>"
				+ "<option value='마인어'>마인어</option>"
				+ "<option value='그리스어'>그리스어</option>"
				+ "<option value='포르투칼어'>포르투칼어</option>"
				+ "<option value='베트남어'>베트남어</option>"
				+ "<option value='네덜란드어'>네덜란드어</option>"
				+ "<option value='힌디어'>힌디어</option>"
				+ "<option value='노르웨이어'>노르웨이어</option>"
				+ "<option value='유고어'>유고어</option>"
				+ "<option value='히브리어'>히브리어</option>"
				+ "<option value='이란(페르시아어)'>이란(페르시아어)</option>"
				+ "<option value='터키어'>터키어</option>"
				+ "<option value='체코어'>체코어</option>"
				+ "<option value='루마니아어'>루마니아어</option>"
				+ "<option value='몽골어'>몽골어</option>"
				+ "<option value='스웨덴어'>스웨덴어</option>"
				+ "<option value='헝가리어'>헝가리어</option>"
				+ "<option value='폴란드어'>폴란드어</option>"
				+ "<option value='미얀마어'>미얀마어</option>"
				+ "<option value='슬로바이카어'>슬로바이카어</option>"
				+ "<option value='세르비아어'>세르비아어</option>"
				+ "<option value='한국어'>한국어</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0; width: 140px;'>"
				+ "<select class='selecter_full' name='conversation_ability'>"
				+ "<option value='구분' selected='selected'>회화능력</option>"
				+ "<option value='일상회화가능'>일상회화 가능</option>"
				+ "<option value='비즈니스회화가능'>비즈니스 회화가능</option>"
				+ "<option value='원어민수준'>원어민 수준</option>"
				+ "</select>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>";

		var conversationHTML = "<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='language_classification' onchange='dynamic_change();'>"
				+ "<option value='구분'>구분</option>"
				+ "<option value='회화능력' selected='selected'>회화능력</option>"
				+ "<option value='공인시험'>공인시험</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0; width: 200px;'>"
				+ "<select class='selecter_full' name='language_name'>"
				+ "<option value='0' selected='selected'>외국어명</option>"
				+ "<option value='영어'>영어</option>"
				+ "<option value='일본어'>일본어</option>"
				+ "<option value='중국어'>중국어</option>"
				+ "<option value='독일어'>독일어</option>"
				+ "<option value='프랑스어'>프랑스어</option>"
				+ "<option value='스페인어'>스페인어</option>"
				+ "<option value='러시아어'>러시아어</option>"
				+ "<option value='이탈리아어'>이탈리아어</option>"
				+ "<option value='아랍어'>아랍어</option>"
				+ "<option value='태국어'>태국어</option>"
				+ "<option value='마인어'>마인어</option>"
				+ "<option value='그리스어'>그리스어</option>"
				+ "<option value='포르투칼어'>포르투칼어</option>"
				+ "<option value='베트남어'>베트남어</option>"
				+ "<option value='네덜란드어'>네덜란드어</option>"
				+ "<option value='힌디어'>힌디어</option>"
				+ "<option value='노르웨이어'>노르웨이어</option>"
				+ "<option value='유고어'>유고어</option>"
				+ "<option value='히브리어'>히브리어</option>"
				+ "<option value='이란(페르시아어)'>이란(페르시아어)</option>"
				+ "<option value='터키어'>터키어</option>"
				+ "<option value='체코어'>체코어</option>"
				+ "<option value='루마니아어'>루마니아어</option>"
				+ "<option value='몽골어'>몽골어</option>"
				+ "<option value='스웨덴어'>스웨덴어</option>"
				+ "<option value='헝가리어'>헝가리어</option>"
				+ "<option value='폴란드어'>폴란드어</option>"
				+ "<option value='미얀마어'>미얀마어</option>"
				+ "<option value='슬로바이카어'>슬로바이카어</option>"
				+ "<option value='세르비아어'>세르비아어</option>"
				+ "<option value='한국어'>한국어</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0; width: 140px;'>"
				+ "<select class='selecter_full' name='conversational_ability'>"
				+ "<option value='구분' selected='selected'>회화능력</option>"
				+ "<option value='일상회화가능'>일상회화 가능</option>"
				+ "<option value='비즈니스회화가능'>비즈니스 회화가능</option>"
				+ "<option value='원어민수준'>원어민 수준</option>"
				+ "</select>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>";

		var certifiedHTML =

		"<div class='row'>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<select class='selecter_full' name='language_classification' onchange='dynamic_change();'>"
				+ "<option value='구분'>구분</option>"
				+ "<option value='회화능력'>회화능력</option>"
				+ "<option value='공인시험' selected='selected'>공인시험</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0; width: 200px;'>"
				+ "<select class='selecter_full' name='language_name'>"
				+ "<option value='0' selected='selected'>외국어명</option>"
				+ "<option value='영어'>영어</option>"
				+ "<option value='일본어'>일본어</option>"
				+ "<option value='중국어'>중국어</option>"
				+ "<option value='독일어'>독일어</option>"
				+ "<option value='프랑스어'>프랑스어</option>"
				+ "<option value='스페인어'>스페인어</option>"
				+ "<option value='러시아어'>러시아어</option>"
				+ "<option value='이탈리아어'>이탈리아어</option>"
				+ "<option value='아랍어'>아랍어</option>"
				+ "<option value='태국어'>태국어</option>"
				+ "<option value='마인어'>마인어</option>"
				+ "<option value='그리스어'>그리스어</option>"
				+ "<option value='포르투칼어'>포르투칼어</option>"
				+ "<option value='베트남어'>베트남어</option>"
				+ "<option value='네덜란드어'>네덜란드어</option>"
				+ "<option value='힌디어'>힌디어</option>"
				+ "<option value='노르웨이어'>노르웨이어</option>"
				+ "<option value='유고어'>유고어</option>"
				+ "<option value='히브리어'>히브리어</option>"
				+ "<option value='이란(페르시아어)'>이란(페르시아어)</option>"
				+ "<option value='터키어'>터키어</option>"
				+ "<option value='체코어'>체코어</option>"
				+ "<option value='루마니아어'>루마니아어</option>"
				+ "<option value='몽골어'>몽골어</option>"
				+ "<option value='스웨덴어'>스웨덴어</option>"
				+ "<option value='헝가리어'>헝가리어</option>"
				+ "<option value='폴란드어'>폴란드어</option>"
				+ "<option value='미얀마어'>미얀마어</option>"
				+ "<option value='슬로바이카어'>슬로바이카어</option>"
				+ "<option value='세르비아어'>세르비아어</option>"
				+ "<option value='한국어'>한국어</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input type='text' name='language_score' placeholder='급수/점수'>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0; width: 140px;'>"
				+ "<select class='selecter_full' name='conversational_ability'>"
				+ "<option value='0' selected='selected'>선택</option>"
				+ "<option value='점'>점</option>"
				+ "<option value='급'>급</option>"
				+ "<option value='취득'>취득</option>"
				+ "</select>"
				+ "</div>"
				+ "<div class='info_form normal' style='margin: 0;'>"
				+ "<input class='date' onblur='blurDate()' onfocus='focusDate();' type='text' name='acquisition_date' placeholder='취득년월'>"
				+ "</div>"
				+ "</div>"
				+ "<button type='button' class='delete_btn' onclick='delete_btn()'></button>";

		if (value == "0") {
			target.innerHTML = defaultHTML;
		} else if (value == "고등학교") {
			target.innerHTML = highHTML;
		} else if (value == "대학") {
			target.innerHTML = collegeHTML;
		} else if (value == "대학교") {
			target.innerHTML = universityHTML;
		} else if (value == "대학원") {
			target.innerHTML = graduateHTML;
		} else if (value == "구분") {
			target.innerHTML = languageHTML;
		} else if (value == "회화능력") {
			target.innerHTML = conversationHTML;
		} else if (value == "공인시험") {
			target.innerHTML = certifiedHTML;
		}
	}

$(window).load(function() {

	if(${checkSchool} == true) {
		var count = 0;
		<c:forEach items="${school}" var="i">
			$("#div_School").children("div.add").eq(count).find("select[name='graduation_status']").val('${i.graduation_status}');
			$("#div_School").children("div.add").eq(count).find("select[name='academic_degree']").val('${i.academic_degree}');
			$("#div_School").children("div.add").eq(count).find("select[name='total_score']").val('${i.total_score}');
			
			if(${i.ged_status eq 'true'}) {
				$("#div_School").children("div.add").eq(count).find("input[name='ged_status']").prop('checked', true);
			} 
			if(${i.transfer_status eq 'true'}) {
				$("#div_School").children("div.add").eq(count).find("input[name='transfer_status']").prop('checked', true);
			} 
			count++;
		</c:forEach> 
	}
	if(${checkCareer} == true) {
		var count = 0;
		<c:forEach items="${career}" var="i">
			if(${i.served_status eq 'true'}) {
				$("#div_Career").children("div.add").eq(count).find("input[name='served_status']").prop('checked', true);
			} 
			count++;
		</c:forEach> 
	}
	
	if(${checkActivities} == true) {
		var count = 0;
		<c:forEach items="${activities}" var="i">
			$("#div_Activities").children("div.add").eq(count).find("select[name='activity_classification']").val('${i.activity_classification}');
			count++;
		</c:forEach> 
	}
	
	if(${checkLanguage} == true) {
		var count = 0;
		<c:forEach items="${language}" var="i">
			$("#div_Language").children("div.add").eq(count).find("select[name='language_classification']").val('${i.language_classification}');
			$("#div_Language").children("div.add").eq(count).find("select[name='language_name']").val('${i.language_name}');
			$("#div_Language").children("div.add").eq(count).find("select[name='conversational_ability']").val('${i.conversational_ability}');
			count++;
		</c:forEach> 
	}
	
	if(${checkPreferential} == true) {
		
		if(${preferential.veterans eq 'true'}) {
			$("#div_Preferential").children("div.add").find("input[name='veterans']").prop('checked', true);
		} 
		if(${preferential.protect eq 'true'}) {
			$("#div_Preferential").children("div.add").find("input[name='protect']").prop('checked', true);
		} 
		if(${preferential.funding eq 'true'}) {
			$("#div_Preferential").children("div.add").find("input[name='funding']").prop('checked', true);
		} 
		if(${preferential.disorder ne '0'}) {
			$("#div_Preferential").children("div.add").find("input[name='disability_grade']").prop('checked', true);
			$("#div_Preferential").children("div.add").find("select[name='disorder']").val('${preferential.disorder}');
		}
		if(${preferential.military ne '0'}) {
			$("#div_Preferential").children("div.add").find("input[name='military_status']").prop('checked', true);
			$("#div_Preferential").children("div.add").find("select[name='military']").val('${preferential.military}');
		} 

	}
	
});
</script>
<style type="text/css">
.button {
	float: left;
	margin-right: 3px;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.container {
	margin: 0 auto;
	padding: 0;
	width: 1200px;
	zoom: 1;
	display: flex;
	position: relative;
}

aside {
	width: 205px;
	position: fixed;
	top: 85px;
	z-index: 99;
	float: right;
}

section {
	margin-left: 210px;
	width: 960px;
	padding: 0 10px;
}

.more_menu {
	width: 205px;
	padding: 0 14px;
	border: 1px solid #A4A4A4;
	background-color: white;
}

.resume_title {
	width: 940px;
	height: 50px;
	border: 1px solid #A4A4A4;
	margin-bottom: 30px;
}

.resume_title input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 20px;
	border: none;
	margin-bottom: 70px;
	float: left;
}

.listhead {
	height: 48px;
	padding-top: 16px;
	font-size: 14px;
	color: black;
	text-align: left;
	margin: 0;
	font-weight: 900;
}

.list_menu {
	border-top: 1px solid #eee;
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	margin-top: 0;
	list-style: none;
	padding-left: 0;
	padding-top: 15px;
	padding-bottom: 20px;
	margin-bottom: 0;
}

.menu_img {
	width: 22px;
	height: 22px;
	margin-right: 12px;
}

.img_button {
	background: url( "/resources/images/plus.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.img_button_down {
	background: url( "/resources/images/down.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.img_button_plus {
	background: url( "/resources/images/plus.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.img_button_minus {
	background: url( "/resources/images/minus.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.div_menu_li {
	width: 140px;
	float: left;
	cursor: pointer;
}

.info {
	width: 940px;
	padding: 20px 20px 10px;
	border: 1px solid #A4A4A4;
	margin-bottom: 30px;
	float: left;
	background-color: white;
}

.info_form {
	border: 1px solid #A4A4A4;
}

.name {
	width: 160px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.name input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.photo {
	width: 200px;
	height: 250px;
	float: left;;
}

.photo img {
	width: 100%;
	height: 100%;
}

.normal {
	width: 113px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.selecter {
	width: 100%;
	height: 30px;
	padding-left: 10px;
	border: 0;
}

.email {
	width: 100%;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.email input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.addr {
	width: 100%;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.addr input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.row {
	width: 100%;
	margin: 0;
	height: 50px;
	margin-bottom: 10px;
	float: left;
}

.selecter_full {
	width: 100%;
	height: 100%;
	padding-left: 10px;
	border: 0;
}

.school {
	width: 300px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.new {
	width: 940px;
	padding: 20px 20px 10px;
	border: 1px solid #A4A4A4;
	border-top: none;
	float: left;
	background-color: white;
	position: relative;
}

.more {
	width: 110px;
	padding: 20px 20px 10px;
	border: 1px solid #A4A4A4;
	border-top: none;
	float: left;
	background-color: white;
	position: relative;
	background-color: #FAFAFA;
}

.form {
	width: 100%;
	float: left;
}

.head {
	font-weight: bold;
	border: 1px solid #A4A4A4;
	margin-bottom: 0;
	padding-bottom: 10px;
}

.checkbox {
	height: 40px;
	float: left;
	display: inline;
	margin-left: 20px;
	padding-top: 5px;
}

.input_checkbox {
	width: 20px;
	height: 20px;
	top: 2px;
}

.sub_footer {
	width: 900px;
	height: 40px;
	float: left;
}

.textarea_content {
	border-radius: 4px;
	padding: 3 10px;
	overflow-x: hidden;
	overflow-y: auto;
	border-color: #A4A4A4;
	width: 100%;
	height: 80px;
	border: 1;
	overflow: visible;
	text-overflow: ellipsis;
}

.prefer_checkbox {
	width: 165px;
	height: 50px;
	margin-right: 10px;
	border: 1px solid #A4A4A4;
	float: left;
	padding-left: 15px;
	border-radius: 8px;
}

#form_Education {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Career {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Activities {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Certificate {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Award {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Overseas_Experience {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Language {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_Preferential {
	display: none;
	float: left;
	margin-bottom: 50px;
}

#form_school {
	display: none;
	float: left;
	margin-bottom: 50px;
}

.delete_btn {
	background: url( "/resources/images/delete.png" ) no-repeat;
	right: 0;
	top: -1;
	width: 32px;
	height: 32px;
	position: absolute;
	border: none;
}

.disability_grade {
	display: none;
}

.military_status {
	display: none;
}

.sub_title {
	border: 1px solid #A4A4A4;
	text-align: center;
	height: 40px;
	width: 940px;
	background-color: #FAFAFA;
}
</style>

<c:set var="pagingTag" value="전체" />
<sec:authentication property="details" var="member" />
<sec:authorize access="isAuthenticated()">
	<c:set var="mem" value="${member.member_no }" />
</sec:authorize>

<div>
	<div class="container">
		<section>
			<div class="sub_title">
				<h4 style="font-weight: bold;">제목</h4>
			</div>
			<div class="resume_title">
				<input type="text" name="resume_title" placeholder="제목을 입력하세요."
					value="${resume.resume_title }"> <input type="hidden"
					id="member_no" name="member_no" value="${mem }" /> <input
					type="hidden" id="resume_no" name="resume_no"
					value="${resume.resume_no }" />
			</div>

			<div class="form" style="float: left; margin-bottom: 40px;">
				<div class="sub_title">
					<h4 style="font-weight: bold;">인적사항</h4>
				</div>
				<div class="info" style="padding-bottom: 20px;" id="user_info">
					<div class="photo info_form">
						<img id="myImg" alt="" src="/upload/${resume.resume_stored_name }">
						<form id="fileForm" action="fileupload" method="post"
							enctype="miltipart/form-data">
							<input style="display: none;" type="file" name="imgfile">
						</form>
					</div>
					<div
						style="width: 680px; height: 50px; margin-left: 10px; margin-bottom: 10px; float: left; margin-top: 10px;">
						<div class="info_form name" style="width: 35%;">
							<input type="text" name="resume_name" placeholder="이름"
								value="${resume.resume_name }">
						</div>
						<div class="info_form name" style="width: 35%;">
							<input type="text" name="resume_birth" placeholder="생년월일"
								onfocus="focusBirth();" onblur="blurBirth();"
								value="${resume.resume_birth }">
						</div>
						<div class="info_form normal">
							<c:if test="${resume.resume_gender eq '남자'}">
								<select class="selecter" style="height: 100%;"
									name="resume_gender">
									<option value="남자" selected="selected">남자</option>
									<option value="여자">여자</option>
								</select>
							</c:if>

							<c:if test="${resume.resume_gender eq '여자'}">
								<select class="selecter" style="height: 100%;"
									name="resume_gender">
									<option value="남자">남자</option>
									<option value="여자" selected="selected">여자</option>
								</select>
							</c:if>

						</div>
					</div>
					<div
						style="width: 680px; height: 50px; margin-left: 10px; margin-bottom: 10px; float: left;">
						<div class="info_form email">
							<input type="text" name="resume_email" placeholder="이메일"
								value="${resume.resume_email }">
						</div>
					</div>
					<div
						style="width: 680px; height: 50px; margin-left: 10px; margin-bottom: 10px; float: left;">
						<div class="info_form name" style="width: 45%;">
							<input type="text" name="resume_phone" placeholder="전화번호"
								value="${resume.resume_phone }">
						</div>
						<div class="info_form name" style="width: 45%;">
							<input type="text" name="resume_cellphone" placeholder="휴대폰번호"
								value="${resume.resume_cellphone }">
						</div>
					</div>
					<div
						style="width: 680px; height: 50px; margin-left: 10px; margin-bottom: 10px; float: left;">
						<div class="info_form addr">
							<input type="text" name="resume_addr" placeholder="주소"
								value="${resume.resume_addr }">
						</div>
					</div>
				</div>
			</div>

			<c:if test="${checkSchool eq true }">
				<div id="form_School" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">학력사항</h4>
					</div>
					<div class="form" id="div_School">
						<c:forEach items="${school}" var="i">
							<c:choose>
								<c:when test="${i.school_classification eq '고등학교'}">
									<div class="new add">
										<div class="row">
											<div class="info_form normal" style="margin: 0;">
												<select class="selecter_full" name="school_classification"
													onchange="dynamic_change();">
													<option value="0">학교구분</option>
													<option value="고등학교" selected="selected">고등학교</option>
													<option value="대학">대학(2,3년)</option>
													<option value="대학교">대학교(4년)</option>
													<option value="대학원">대학원</option>
												</select>
											</div>
											<div class="info_form school">
												<c:choose>
													<c:when test="${i.school_name ne '0'}">
														<input type="text" name="school_name" placeholder="학교이름"
															value="${i.school_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="school_name" placeholder="학교이름"
															value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.graduation_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="${i.graduation_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="graduation_status">
													<option value="0" selected="selected">졸업상태</option>
													<option value="졸업">졸업</option>
													<option value="졸업예정">졸업예정</option>
													<option value="재학중">재학중</option>
												</select>
											</div>
											<div class="checkbox">
												<p>
													<input class="input_checkbox" type="checkbox"
														name="ged_status"><label
														style="padding-left: 5px;">대입검정고시</label>
												</p>
											</div>
											<button type="button" class="delete_btn"
												onclick="delete_btn()"></button>
										</div>
									</div>
								</c:when>

								<c:when test="${i.school_classification eq '대학'}">
									<div class="new add">
										<div class="row">
											<div class="info_form normal" style="margin: 0;">
												<select class="selecter_full" name="school_classification"
													onchange="dynamic_change();">
													<option value="0">학교구분</option>
													<option value="고등학교">고등학교</option>
													<option value="대학" selected="selected">대학(2,3년)</option>
													<option value="대학교">대학교(4년)</option>
													<option value="대학원">대학원</option>
												</select>
											</div>
											<div class="info_form school">
												<c:choose>
													<c:when test="${i.school_name ne '0'}">
														<input type="text" name="school_name" placeholder="학교이름"
															value="${i.school_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="school_name" placeholder="학교이름"
															value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.admission_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="admission_date"
															placeholder="입학년월" value="${i.admission_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="admission_date"
															placeholder="입학년월" value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.graduation_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="${i.graduation_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="graduation_status">
													<option value="0" selected="selected">졸업상태</option>
													<option value="졸업">졸업</option>
													<option value="졸업예정">졸업예정</option>
													<option value="재학중">재학중</option>
													<option value="중퇴">중퇴</option>
													<option value="수료">수료</option>
													<option value="휴학">휴학</option>
												</select>
											</div>
											<div class="checkbox">
												<p>
													<input class="input_checkbox" type="checkbox"
														name="transfer_status"><label
														style="padding-left: 5px;">편입</label>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="info_form school" style="width: 412px;">
												<c:choose>
													<c:when test="${i.major_name ne '0'}">
														<input type="text" name="major_name" placeholder="전공명"
															value="${i.major_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="major_name" placeholder="전공명"
															value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.credit ne '0'}">
														<input type="text" name="credit" placeholder="학점"
															value="${i.credit }">
													</c:when>
													<c:otherwise>
														<input type="text" name="credit" placeholder="학점" value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="total_score">
													<option value="0" selected="selected">총점</option>
													<option value="4.5">4.5</option>
													<option value="4.3">4.3</option>
													<option value="4.0">4.0</option>
													<option value="100">100</option>
												</select>
											</div>
										</div>
										<div class="row sub" style="display: none;">
											<div class="sub_major">
												<div class="info_form normal" style="margin: 0;">
													<select class="selecter_full" name="sub_major_status">
														<option value="0" selected="selected">전공선택</option>
														<option value="부전공">부전공</option>
														<option value="복수전공">복수전공</option>
														<option value="이중전공">이중전공</option>
													</select>
												</div>
												<div class="info_form school">
													<c:choose>
														<c:when test="${i.sub_major_name ne '0'}">
															<input type="text" name="sub_major_name"
																placeholder="전공명" value="${i.sub_major_name }">
														</c:when>
														<c:otherwise>
															<input type="text" name="sub_major_name"
																placeholder="전공명" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>
										</div>
										<div class="row grad" style="height: 85; display: none;">
											<c:choose>
												<c:when test="${i.graduation_thesis_content ne '0'}">
													<textarea class="textarea_content"
														name="graduation_thesis_content" rows="4" cols="118"
														placeholder="졸업 논문/작품">${i.graduation_thesis_content }</textarea>
												</c:when>
												<c:otherwise>
													<textarea class="textarea_content"
														name="graduation_thesis_content" rows="4" cols="118"
														placeholder="졸업 논문/작품"></textarea>
												</c:otherwise>
											</c:choose>

										</div>
										<div class="sub_footer">
											<div class="more_sub_btn">
												<button type="button" class="btn btn-default button"
													onclick="moreSub();">
													<span>다른전공 + </span>
												</button>
											</div>
											<div class="not_sub_btn" style="display: none;">
												<button type="button" class="btn btn-default button"
													onclick="notSub();">
													<span>다른전공 - </span>
												</button>
											</div>
											<div class="more_grad_btn">
												<button type="button" class="btn btn-default button"
													onclick="moreGrad();">
													<span>졸업 논문/ 작품 + </span>
												</button>
											</div>
											<div class="not_grad_btn" style="display: none;">
												<button type="button" class="btn btn-default button"
													onclick="notGrad();">
													<span>졸업 논문/ 작품 - </span>
												</button>
											</div>
										</div>
										<button type="button" class="delete_btn"
											onclick="delete_btn()"></button>
									</div>
								</c:when>

								<c:when test="${i.school_classification eq '대학교'}">
									<div class="new add">
										<div class="row">
											<div class="info_form normal" style="margin: 0;">
												<select class="selecter_full" name="school_classification"
													onchange="dynamic_change();">
													<option value="0">학교구분</option>
													<option value="고등학교">고등학교</option>
													<option value="대학">대학(2,3년)</option>
													<option value="대학교" selected="selected">대학교(4년)</option>
													<option value="대학원">대학원</option>
												</select>
											</div>
											<div class="info_form school">
												<c:choose>
													<c:when test="${i.school_name ne '0'}">
														<input type="text" name="school_name" placeholder="학교이름"
															value="${i.school_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="school_name" placeholder="학교이름"
															value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.admission_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="admission_date"
															placeholder="입학년월" value="${i.admission_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="admission_date"
															placeholder="입학년월" value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.graduation_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="${i.graduation_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="graduation_status">
													<option value="0" selected="selected">졸업상태</option>
													<option value="졸업">졸업</option>
													<option value="졸업예정">졸업예정</option>
													<option value="재학중">재학중</option>
													<option value="중퇴">중퇴</option>
													<option value="수료">수료</option>
													<option value="휴학">휴학</option>
												</select>
											</div>
											<div class="checkbox">
												<p>
													<input class="input_checkbox" type="checkbox"
														name="transfer_status"><label
														style="padding-left: 5px;">편입</label>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="info_form school" style="width: 412px;">
												<c:choose>
													<c:when test="${i.major_name ne '0'}">
														<input type="text" name="major_name" placeholder="전공명"
															value="${i.major_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="major_name" placeholder="전공명"
															value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.credit ne '0'}">
														<input type="text" name="credit" placeholder="학점"
															value="${i.credit }">
													</c:when>
													<c:otherwise>
														<input type="text" name="credit" placeholder="학점" value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="total_score">
													<option value="0" selected="selected">총점</option>
													<option value="4.5">4.5</option>
													<option value="4.3">4.3</option>
													<option value="4.0">4.0</option>
													<option value="100">100</option>
												</select>
											</div>
										</div>
										<div class="row sub" style="display: none;">
											<div class="sub_major">
												<div class="info_form normal" style="margin: 0;">
													<select class="selecter_full" name="sub_major_status">
														<option value="0" selected="selected">전공선택</option>
														<option value="부전공">부전공</option>
														<option value="복수전공">복수전공</option>
														<option value="이중전공">이중전공</option>
													</select>
												</div>
												<div class="info_form school">
													<c:choose>
														<c:when test="${i.sub_major_name ne '0'}">
															<input type="text" name="sub_major_name"
																placeholder="전공명" value="${i.sub_major_name }">
														</c:when>
														<c:otherwise>
															<input type="text" name="sub_major_name"
																placeholder="전공명" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>
										</div>
										<div class="row grad" style="height: 85; display: none;">
											<c:choose>
												<c:when test="${i.graduation_thesis_content ne '0'}">
													<textarea class="textarea_content"
														name="graduation_thesis_content" rows="4" cols="118"
														placeholder="졸업 논문/작품">${i.graduation_thesis_content }</textarea>
												</c:when>
												<c:otherwise>
													<textarea class="textarea_content"
														name="graduation_thesis_content" rows="4" cols="118"
														placeholder="졸업 논문/작품"></textarea>
												</c:otherwise>
											</c:choose>

										</div>
										<div class="sub_footer">
											<div class="more_sub_btn">
												<button type="button" class="btn btn-default button"
													onclick="moreSub();">
													<span>다른전공 + </span>
												</button>
											</div>
											<div class="not_sub_btn" style="display: none;">
												<button type="button" class="btn btn-default button"
													onclick="notSub();">
													<span>다른전공 - </span>
												</button>
											</div>
											<div class="more_grad_btn">
												<button type="button" class="btn btn-default button"
													onclick="moreGrad();">
													<span>졸업 논문/ 작품 + </span>
												</button>
											</div>
											<div class="not_grad_btn" style="display: none;">
												<button type="button" class="btn btn-default button"
													onclick="notGrad();">
													<span>졸업 논문/ 작품 - </span>
												</button>
											</div>
										</div>
										<button type="button" class="delete_btn"
											onclick="delete_btn()"></button>
									</div>
								</c:when>

								<c:when test="${i.school_classification eq '대학원'}">
									<div class="new add">
										<div class="row">
											<div class="info_form normal" style="margin: 0;">
												<select class="selecter_full" name="school_classification"
													onchange="dynamic_change();">
													<option value="0">학교구분</option>
													<option value="고등학교">고등학교</option>
													<option value="대학">대학(2,3년)</option>
													<option value="대학교">대학교(4년)</option>
													<option value="대학원" selected="selected">대학원</option>
												</select>
											</div>
											<div class="info_form school"
												style="width: 219px; margin: 0;">
												<c:choose>
													<c:when test="${i.school_name ne '0'}">
														<input type="text" name="school_name" placeholder="학교이름"
															value="${i.school_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="school_name" placeholder="학교이름"
															value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal" style="width: 80px;">
												<select class="selecter_full" name="academic_degree">
													<option value="0" selected="selected">학위</option>
													<option value="석사">석사</option>
													<option value="박사">박사</option>
													<option value="석박사">석박사</option>
												</select>
											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.admission_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="admission_date"
															placeholder="입학년월" value="${i.admission_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="admission_date"
															placeholder="입학년월" value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.graduation_date ne '0'}">
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="${i.graduation_date }">
													</c:when>
													<c:otherwise>
														<input class="date" onblur="blurDate()"
															onfocus="focusDate();" type="text" name="graduation_date"
															placeholder="졸업년도" value="">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="graduation_status">
													<option value="0" selected="selected">졸업상태</option>
													<option value="졸업">졸업</option>
													<option value="졸업예정">졸업예정</option>
													<option value="재학중">재학중</option>
													<option value="중퇴">중퇴</option>
													<option value="수료">수료</option>
													<option value="휴학">휴학</option>
												</select>
											</div>
											<div class="checkbox">
												<p>
													<input class="input_checkbox" type="checkbox"
														name="transfer_status"><label
														style="padding-left: 5px;">편입</label>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="info_form school" style="width: 412px;">
												<c:choose>
													<c:when test="${i.major_name ne '0'}">
														<input type="text" name="major_name" placeholder="전공명"
															value="${i.major_name }">
													</c:when>
													<c:otherwise>
														<input type="text" name="major_name" placeholder="전공명"
															value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal" style="margin: 0;">
												<c:choose>
													<c:when test="${i.credit ne '0'}">
														<input type="text" name="credit" placeholder="학점"
															value="${i.credit }">
													</c:when>
													<c:otherwise>
														<input type="text" name="credit" placeholder="학점" value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class="info_form normal">
												<select class="selecter_full" name="total_score">
													<option value="0" selected="selected">총점</option>
													<option value="4.5">4.5</option>
													<option value="4.3">4.3</option>
													<option value="4.0">4.0</option>
													<option value="100">100</option>
												</select>
											</div>
										</div>
										<div class="row sub" style="display: none;">
											<div class="sub_major">
												<div class="info_form normal" style="margin: 0;">
													<select class="selecter_full" name="sub_major_status">
														<option value="0" selected="selected">전공선택</option>
														<option value="부전공">부전공</option>
														<option value="복수전공">복수전공</option>
														<option value="이중전공">이중전공</option>
													</select>
												</div>
												<div class="info_form school">
													<c:choose>
														<c:when test="${i.sub_major_name ne '0'}">
															<input type="text" name="sub_major_name"
																placeholder="전공명" value="${i.sub_major_name }">
														</c:when>
														<c:otherwise>
															<input type="text" name="sub_major_name"
																placeholder="전공명" value="">
														</c:otherwise>
													</c:choose>

												</div>
											</div>
										</div>
										<div class="row grad" style="height: 85; display: none;">
											<c:choose>
												<c:when test="${i.graduation_thesis_content ne '0'}">
													<textarea class="textarea_content"
														name="graduation_thesis_content" rows="4" cols="118"
														placeholder="졸업 논문/작품">${i.graduation_thesis_content }</textarea>
												</c:when>
												<c:otherwise>
													<textarea class="textarea_content"
														name="graduation_thesis_content" rows="4" cols="118"
														placeholder="졸업 논문/작품"></textarea>
												</c:otherwise>
											</c:choose>

										</div>
										<div class="sub_footer">
											<div class="more_sub_btn">
												<button type="button" class="btn btn-default button"
													onclick="moreSub();">
													<span>다른전공 + </span>
												</button>
											</div>
											<div class="not_sub_btn" style="display: none;">
												<button type="button" class="btn btn-default button"
													onclick="notSub();">
													<span>다른전공 - </span>
												</button>
											</div>
											<div class="more_grad_btn">
												<button type="button" class="btn btn-default button"
													onclick="moreGrad();">
													<span>졸업 논문/ 작품 + </span>
												</button>
											</div>
											<div class="not_grad_btn" style="display: none;">
												<button type="button" class="btn btn-default button"
													onclick="notGrad();">
													<span>졸업 논문/ 작품 - </span>
												</button>
											</div>
										</div>
										<button type="button" class="delete_btn"
											onclick="delete_btn()"></button>
									</div>
								</c:when>

							</c:choose>
						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_School();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkSchool eq false }">
				<div id="form_School">
					<div class="sub_title">
						<h4 style="font-weight: bold;">학력사항</h4>
					</div>
					<div class="form" id="div_School"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_School();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkCareer eq true }">
				<div id="form_Career" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">경력사항</h4>
					</div>
					<div class="form" id="div_Career">
						<c:forEach items="${career}" var="i">
							<div class="new add">
								<div class="row">
									<div class="info_form school" style="width: 276px; margin: 0;">
										<c:choose>
											<c:when test="${i.company_name ne '0'}">
												<input type="text" name="company_name" placeholder="회사명"
													value="${i.company_name }">
											</c:when>
											<c:otherwise>
												<input type="text" name="company_name" placeholder="회사명"
													value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form school" style="width: 276px;">
										<c:choose>
											<c:when test="${i.department_name ne '0'}">
												<input type="text" name="department_name" placeholder="부서명"
													value="${i.department_name }">
											</c:when>
											<c:otherwise>
												<input type="text" name="department_name" placeholder="부서명"
													value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.hire_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="hire_date"
													placeholder="입사년월" value="${i.hire_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="hire_date"
													placeholder="입사년월" value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form normal">
										<c:choose>
											<c:when test="${i.retirement_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="retirement_date"
													placeholder="퇴사년월" value="${i.retirement_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="retirement_date"
													placeholder="퇴사년월" value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="served_status"><label
												style="padding-left: 5px;">재직중</label>
										</p>
									</div>
								</div>
								<div class="row info_career">
									<div class="info_form school" style="width: 276px; margin: 0;">
										<c:choose>
											<c:when test="${i.position ne '0'}">
												<input type="text" name="position" placeholder="직급/직책"
													value="${i.position }">
											</c:when>
											<c:otherwise>
												<input type="text" name="position" placeholder="직급/직책"
													value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form school" style="width: 276px;">
										<c:choose>
											<c:when test="${i.job_work ne '0'}">
												<input type="text" name="job_work" placeholder="직무"
													value="${i.job_work }">
											</c:when>
											<c:otherwise>
												<input type="text" name="job_work" placeholder="직무" value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal salary" style="display: none;">
										<input type="text" name="salary" placeholder="연봉"
											value="${i.salary }">
									</div>
								</div>
								<div class="row assigned_task"
									style="height: 85; display: none;">
									<c:choose>
										<c:when test="${i.assigned_task ne '0'}">
											<textarea class="textarea_content" name="assigned_task"
												rows="4" cols="118" placeholder="담당업무">${i.assigned_task }</textarea>
										</c:when>
										<c:otherwise>
											<textarea class="textarea_content" name="assigned_task"
												rows="4" cols="118" placeholder="담당업무"></textarea>
										</c:otherwise>
									</c:choose>

								</div>
								<div class='sub_footer'>
									<div class='more_salary_btn'>
										<button type='button' class='btn btn-default button'
											onclick='moreSalary();'>
											<span>연봉 + </span>
										</button>
									</div>
									<div class='not_salary_btn' style='display: none;'>
										<button type='button' class='btn btn-default button'
											onclick='notSalary();'>
											<span>연봉 - </span>
										</button>
									</div>
									<div class='more_task_btn'>
										<button type='button' class='btn btn-default button'
											onclick='moreTask();'>
											<span>담당업무 + </span>
										</button>
									</div>
									<div class='not_task_btn' style='display: none;'>
										<button type='button' class='btn btn-default button'
											onclick='notTask();'>
											<span>담당업무 - </span>
										</button>
									</div>
								</div>
								<button type="button" class="delete_btn" onclick="delete_btn();"></button>
							</div>
						</c:forEach>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;" onclick="create_Career();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkCareer eq false }">
				<div id="form_Career">
					<div class="sub_title">
						<h4 style="font-weight: bold;">경력사항</h4>
					</div>
					<div class="form" id="div_Career"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Career();">추가</button></label>
					</div>
				</div>
			</c:if>



			<c:if test="${checkActivities eq true }">
				<div id="form_Activities" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">대외활동</h4>
					</div>
					<div class="form" id="div_Activities">
						<c:forEach items="${activities}" var="i">
							<div class="new add">
								<div class="row">
									<div class="info_form normal" style="margin: 0;">
										<select class="selecter_full" name="activity_classification">
											<option value="0" selected="selected">활동구분</option>
											<option value="인턴">인턴</option>
											<option value="아르바이트">아르바이트</option>
											<option value="동아리">동아리</option>
											<option value="자원봉사">자원봉사</option>
											<option value="사회활동">사회활동</option>
											<option value="교내활동">교내활동</option>
										</select>
									</div>

									<div class="info_form school" style="width: 510px;">
										<c:choose>
											<c:when test="${i.institution_name ne '0'}">
												<input type="text" name="institution_name"
													placeholder="회사/기관/단체명" value="${i.institution_name }">
											</c:when>
											<c:otherwise>
												<input type="text" name="institution_name"
													placeholder="회사/기관/단체명" value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.start_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="start_date"
													placeholder="시작년월" value="${i.start_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="start_date"
													placeholder="시작년월" value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.end_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="end_date"
													placeholder="종료년월" value="${i.end_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="end_date"
													placeholder="종료년월" value="">
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<div class="row" style="height: 85;">
									<c:choose>
										<c:when test="${i.activity_content ne '0'}">
											<textarea class="textarea_content" name="activity_content"
												rows="4" cols="118" placeholder="활동내용">${i.activity_content }</textarea>
										</c:when>
										<c:otherwise>
											<textarea class="textarea_content" name="activity_content"
												rows="4" cols="118" placeholder="활동내용"></textarea>
										</c:otherwise>
									</c:choose>

								</div>
								<button type="button" class="delete_btn" onclick="delete_btn();"></button>
							</div>
						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Activities();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkActivities eq false }">
				<div id="form_Activities">
					<div class="sub_title">
						<h4 style="font-weight: bold;">대외활동</h4>
					</div>
					<div class="form" id="div_Activities"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Activities();">추가</button></label>
					</div>
				</div>
			</c:if>



			<c:if test="${checkEducation eq true }">
				<div id="form_Education" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">교육사항</h4>
					</div>
					<div class="form" id="div_Education">
						<c:forEach items="${education}" var="i">
							<div class="new add">
								<div class="row">
									<div class="info_form school" style="width: 276px;">
										<c:choose>
											<c:when test="${i.training_title ne '0'}">
												<input type="text" name="training_title" placeholder="교육명"
													value="${i.training_title }">
											</c:when>
											<c:otherwise>
												<input type="text" name="training_title" placeholder="교육명"
													value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form school" style="width: 276px;">
										<c:choose>
											<c:when test="${i.educational_facilities ne '0'}">
												<input type="text" name="educational_facilities"
													placeholder="교육기관" value="${i.educational_facilities }">
											</c:when>
											<c:otherwise>
												<input type="text" name="educational_facilities"
													placeholder="교육기관" value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.start_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="start_date"
													placeholder="시작년월" value="${i.start_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="start_date"
													placeholder="시작년월" value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form normal">
										<c:choose>
											<c:when test="${i.end_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="end_date"
													placeholder="종료년월" value="${i.end_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="end_date"
													placeholder="종료년월" value="">
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<div class="row" style="height: 85;">
									<c:choose>
										<c:when test="${i.training_content ne '0'}">
											<textarea class="textarea_content" name="training_content"
												rows="4" cols="118" placeholder="교육내용">${i.training_content }</textarea>
										</c:when>
										<c:otherwise>
											<textarea class="textarea_content" name="training_content"
												rows="4" cols="118" placeholder="교육내용"></textarea>
										</c:otherwise>
									</c:choose>

								</div>
								<button type="button" class="delete_btn" onclick="delete_btn();"></button>
							</div>
						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Education();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkEducation eq false }">
				<div id="form_Education">
					<div class="sub_title">
						<h4 style="font-weight: bold;">교육사항</h4>
					</div>
					<div class="form" id="div_Education"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Education();">추가</button></label>
					</div>
				</div>
			</c:if>



			<c:if test="${checkCertificate eq true }">
				<div id="form_Certificate" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">자격면허</h4>
					</div>
					<div class="form" id="div_Certificate">
						<c:forEach items="${certificate}" var="i">
							<div class="new add">
								<div class="row">
									<div class="info_form school" style="width: 400px;">
										<c:choose>
											<c:when test="${i.certificate_name ne '0'}">
												<input type="text" name="certificate_name"
													placeholder="자격증 명" value="${i.certificate_name }">
											</c:when>
											<c:otherwise>
												<input type="text" name="certificate_name"
													placeholder="자격증 명" value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form school" style="width: 276px;">
										<c:choose>
											<c:when test="${i.place_issue ne '0'}">
												<input type="text" name="place_issue" placeholder="발행처"
													value="${i.place_issue }">
											</c:when>
											<c:otherwise>
												<input type="text" name="place_issue" placeholder="발행처"
													value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.acquisition_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="acquisition_date"
													placeholder="취득년월" value="${i.acquisition_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="acquisition_date"
													placeholder="취득년월" value="">
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<button type="button" class="delete_btn" onclick="delete_btn();"></button>
							</div>
						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Certificate();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkCertificate eq false }">
				<div id="form_Certificate">
					<div class="sub_title">
						<h4 style="font-weight: bold;">자격면허</h4>
					</div>
					<div class="form" id="div_Certificate"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Certificate();">추가</button></label>
					</div>
				</div>
			</c:if>




			<c:if test="${checkAward eq true }">
				<div id="form_Award" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">수상경력</h4>
					</div>
					<div class="form" id="div_Award">
						<c:forEach items="${award}" var="i">
							<div class="new add">
								<div class="row">
									<div class="info_form school" style="width: 400px;">
										<c:choose>
											<c:when test="${i.award_name ne '0'}">
												<input type="text" name="award_name" placeholder="수상명"
													value="${i.award_name }">
											</c:when>
											<c:otherwise>
												<input type="text" name="award_name" placeholder="수상명"
													value="">
											</c:otherwise>
										</c:choose>

									</div>
									<div class="info_form school" style="width: 276px;">
										<c:choose>
											<c:when test="${i.award_service ne '0'}">
												<input type="text" name="award_service" placeholder="수여기관"
													value="${i.award_service }">
											</c:when>
											<c:otherwise>
												<input type="text" name="award_service" placeholder="수여기관"
													value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.award_date ne '0'}">
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="award_date"
													placeholder="수상년도" value="${i.award_date }">
											</c:when>
											<c:otherwise>
												<input class="date" onblur="blurDate()"
													onfocus="focusDate();" type="text" name="award_date"
													placeholder="수상년도" value="">
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<div class="row" style="height: 85;">
									<c:choose>
										<c:when test="${i.award_content ne '0'}">
											<textarea class="textarea_content" name="award_content"
												rows="4" cols="118" placeholder="수여내용">${i.award_content }</textarea>
										</c:when>
										<c:otherwise>
											<textarea class="textarea_content" name="award_content"
												rows="4" cols="118" placeholder="수여내용"></textarea>
										</c:otherwise>
									</c:choose>

								</div>
								<button type="button" class="delete_btn" onclick="delete_btn();"></button>
							</div>
						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Award();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkAward eq false }">
				<div id="form_Award">
					<div class="sub_title">
						<h4 style="font-weight: bold;">수상경력</h4>
					</div>
					<div class="form" id="div_Award"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Award();">추가</button></label>
					</div>
				</div>
			</c:if>



			<c:if test="${checkOverseas_Experience eq true }">
				<div id="form_Overseas_Experience" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">해외경험</h4>
					</div>
					<div class="form" id="div_Overseas_Experience">
						<c:forEach items="${overseas_Experience}" var="i">
							<div class="new add">
								<div class="row">
									<div class="info_form school" style="width: 400px;">
										<c:choose>
											<c:when test="${i.country_name ne '0'}">
												<input type="text" name="country_name" placeholder="국가명"
													value="${i.country_name }">
											</c:when>
											<c:otherwise>
												<input type="text" name="country_name" placeholder="국가명"
													value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.start_date ne '0'}">
												<input class="date" type="text" name="start_date"
													onblur="blurDate()" onfocus="focusDate();"
													placeholder="시작년월" value="${i.start_date }">
											</c:when>
											<c:otherwise>
												<input class="date" type="text" name="start_date"
													onblur="blurDate()" onfocus="focusDate();"
													placeholder="시작년월" value="">
											</c:otherwise>
										</c:choose>

									</div>

									<div class="info_form normal" style="margin: 0;">
										<c:choose>
											<c:when test="${i.end_date ne '0'}">
												<input class="date" type="text" name="end_date"
													onblur="blurDate()" onfocus="focusDate();"
													placeholder="종료년월" value="${i.end_date }">
											</c:when>
											<c:otherwise>
												<input class="date" type="text" name="end_date"
													onblur="blurDate()" onfocus="focusDate();"
													placeholder="종료년월" value="">
											</c:otherwise>
										</c:choose>

									</div>

								</div>
								<div class="row" style="height: 85;">
									<c:choose>
										<c:when test="${i.overseas_experience_content ne '0'}">
											<textarea class="textarea_content"
												name="overseas_experience_content" placeholder="내용">${i.overseas_experience_content }</textarea>
										</c:when>
										<c:otherwise>
											<textarea class="textarea_content"
												name="overseas_experience_content" placeholder="내용"></textarea>
										</c:otherwise>
									</c:choose>

								</div>
								<button type="button" class="delete_btn" onclick="delete_btn();"></button>
							</div>
						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down"
								id="new_Overseas_Experience" type="button" style="width: 90px;"
								onclick="create_Overseas_Experience();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkOverseas_Experience eq false }">
				<div id="form_Overseas_Experience">
					<div class="sub_title">
						<h4 style="font-weight: bold;">해외경험</h4>
					</div>
					<div class="form" id="div_Overseas_Experience"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down"
								id="new_Overseas_Experience" type="button" style="width: 90px;"
								onclick="create_Overseas_Experience();">추가</button></label>
					</div>
				</div>
			</c:if>



			<c:if test="${checkLanguage eq true }">
				<div id="form_Language" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">어학능력</h4>
					</div>
					<div class="form" id="div_Language">
						<c:forEach items="${language}" var="i">
							<c:choose>
								<c:when test="${i.language_classification eq '회화능력'}">
									<div class="new add">
										<div class="row">
											<div class="info_form normal" style="margin: 0;">
												<select class="selecter_full" name="language_classification"
													onchange="dynamic_change();">
													<option value="구분" selected="selected">구분</option>
													<option value="회화능력">회화능력</option>
													<option value="공인시험">공인시험</option>
												</select>
											</div>
											<div class="info_form normal"
												style="margin: 0; width: 200px;">
												<select class="selecter_full" name="language_name">
													<option value="0" selected="selected">외국어명</option>
													<option value="영어">영어</option>
													<option value="일본어">일본어</option>
													<option value="중국어">중국어</option>
													<option value="독일어">독일어</option>
													<option value="프랑스어">프랑스어</option>
													<option value="스페인어">스페인어</option>
													<option value="러시아어">러시아어</option>
													<option value="이탈리아어">이탈리아어</option>
													<option value="아랍어">아랍어</option>
													<option value="태국어">태국어</option>
													<option value="마인어">마인어</option>
													<option value="그리스어">그리스어</option>
													<option value="포르투칼어">포르투칼어</option>
													<option value="베트남어">베트남어</option>
													<option value="네덜란드어">네덜란드어</option>
													<option value="힌디어">힌디어</option>
													<option value="노르웨이어">노르웨이어</option>
													<option value="유고어">유고어</option>
													<option value="히브리어">히브리어</option>
													<option value="이란(페르시아어)">이란(페르시아어)</option>
													<option value="터키어">터키어</option>
													<option value="체코어">체코어</option>
													<option value="루마니아어">루마니아어</option>
													<option value="몽골어">몽골어</option>
													<option value="스웨덴어">스웨덴어</option>
													<option value="헝가리어">헝가리어</option>
													<option value="폴란드어">폴란드어</option>
													<option value="미얀마어">미얀마어</option>
													<option value="슬로바이카어">슬로바이카어</option>
													<option value="세르비아어">세르비아어</option>
													<option value="한국어">한국어</option>
												</select>
											</div>
											<div class="info_form normal"
												style="margin: 0; width: 140px;">
												<select class="selecter_full" name="conversational_ability">
													<option value="구분" selected="selected">회화능력</option>
													<option value="일상회화가능">일상회화 가능</option>
													<option value="비즈니스회화가능">비즈니스 회화가능</option>
													<option value="원어민수준">원어민 수준</option>
												</select>
											</div>
										</div>
										<button type="button" class="delete_btn"
											onclick="delete_btn();"></button>
									</div>
								</c:when>

								<c:when test="${i.language_classification eq '공인시험'}">
									<div class="new add">
										<div class='row'>
											<div class='info_form normal' style='margin: 0;'>
												<select class='selecter_full' name='language_classification'
													onchange='dynamic_change();'>
													<option value='구분'>구분</option>
													<option value='회화능력'>회화능력</option>
													<option value='공인시험' selected='selected'>공인시험</option>
												</select>
											</div>
											<div class='info_form normal'
												style='margin: 0; width: 200px;'>
												<select class='selecter_full' name='language_name'>
													<option value='0' selected='selected'>외국어명</option>
													<option value='영어'>영어</option>
													<option value='일본어'>일본어</option>
													<option value='중국어'>중국어</option>
													<option value='독일어'>독일어</option>
													<option value='프랑스어'>프랑스어</option>
													<option value='스페인어'>스페인어</option>
													<option value='러시아어'>러시아어</option>
													<option value='이탈리아어'>이탈리아어</option>
													<option value='아랍어'>아랍어</option>
													<option value='태국어'>태국어</option>
													<option value='마인어'>마인어</option>
													<option value='그리스어'>그리스어</option>
													<option value='포르투칼어'>포르투칼어</option>
													<option value='베트남어'>베트남어</option>
													<option value='네덜란드어'>네덜란드어</option>
													<option value='힌디어'>힌디어</option>
													<option value='노르웨이어'>노르웨이어</option>
													<option value='유고어'>유고어</option>
													<option value='히브리어'>히브리어</option>
													<option value='이란(페르시아어)'>이란(페르시아어)</option>
													<option value='터키어'>터키어</option>
													<option value='체코어'>체코어</option>
													<option value='루마니아어'>루마니아어</option>
													<option value='몽골어'>몽골어</option>
													<option value='스웨덴어'>스웨덴어</option>
													<option value='헝가리어'>헝가리어</option>
													<option value='폴란드어'>폴란드어</option>
													<option value='미얀마어'>미얀마어</option>
													<option value='슬로바이카어'>슬로바이카어</option>
													<option value='세르비아어'>세르비아어</option>
													<option value='한국어'>한국어</option>
												</select>
											</div>
											<div class='info_form normal' style='margin: 0;'>
												<c:choose>
													<c:when test="${i.language_score ne '0'}">
														<input type='text' name='language_score'
															placeholder='급수/점수' value="${i.language_score }">
													</c:when>
													<c:otherwise>
														<input type='text' name='language_score'
															placeholder='급수/점수' value="">
													</c:otherwise>
												</c:choose>

											</div>
											<div class='info_form normal'
												style='margin: 0; width: 140px;'>
												<select class='selecter_full' name='conversational_ability'>
													<option value='0' selected='selected'>선택</option>
													<option value='점'>점</option>
													<option value='급'>급</option>
													<option value='취득'>취득</option>
												</select>
											</div>
											<div class='info_form normal' style='margin: 0;'>
												<c:choose>
													<c:when test="${i.acquisition_date ne '0'}">
														<input class='date' onblur='blurDate()'
															onfocus='focusDate();' type='text'
															name='acquisition_date' placeholder='취득년월'
															value="${i.acquisition_date }">
													</c:when>
													<c:otherwise>
														<input class='date' onblur='blurDate()'
															onfocus='focusDate();' type='text'
															name='acquisition_date' placeholder='취득년월' value="">
													</c:otherwise>
												</c:choose>

											</div>
										</div>
										<button type='button' class='delete_btn'
											onclick='delete_btn()'></button>
									</div>
								</c:when>
							</c:choose>

						</c:forEach>
					</div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Language();">추가</button></label>
					</div>
				</div>
			</c:if>

			<c:if test="${checkLanguage eq false }">
				<div id="form_Language">
					<div class="sub_title">
						<h4 style="font-weight: bold;">어학능력</h4>
					</div>
					<div class="form" id="div_Language"></div>
					<div class="more" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button_down" type="button"
								style="width: 90px;" onclick="create_Language();">추가</button></label>
					</div>
				</div>
			</c:if>



			<c:if test="${checkPreferential eq true }">
				<div id="form_Preferential" style="display: block;">
					<div class="sub_title">
						<h4 style="font-weight: bold;">우대사항, 병역</h4>
					</div>
					<div class="form" style="margin-bottom: 30px;"
						id="div_Preferential">
						<div class="new add">
							<div class="row" style="margin-bottom: 20px;">
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox" name="veterans"><label
												style="padding-left: 5px;">보훈대상</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox" name="protect"><label
												style="padding-left: 5px;">취업보호 대상</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox" name="funding"><label
												style="padding-left: 5px;">고용지원금 대상</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="disability_grade" id="checkbox_disorder"
												onchange="disorderChange();"><label
												style="padding-left: 5px;">장애</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="military_status" id="checkbox_military"
												onchange="militaryChange();"><label
												style="padding-left: 5px;">병역</label>
										</p>
									</div>
								</div>
							</div>
							<c:if test="${preferential.disorder ne '0'}">
								<div class="row disability_grade" style="display: block;">
									<div
										style="width: 50px; height: 50px; float: left; padding-top: 15px;">
										<p>장애</p>
									</div>
									<div class="info_form normal" style="margin: 0;">
										<select class="selecter_full" name="disorder"
											id="disability_grade">
											<option value="0" selected="selected">장애등급</option>
											<option value="1급">1급</option>
											<option value="2급">2급</option>
											<option value="3급">3급</option>
											<option value="4급">4급</option>
											<option value="5급">5급</option>
											<option value="6급">6급</option>
										</select>
									</div>
								</div>
							</c:if>
							<c:if test="${preferential.disorder eq '0'}">
								<div class="row disability_grade">
									<div
										style="width: 50px; height: 50px; float: left; padding-top: 15px;">
										<p>장애</p>
									</div>
									<div class="info_form normal" style="margin: 0;">
										<select class="selecter_full" name="disorder"
											id="disability_grade">
											<option value="0" selected="selected">장애등급</option>
											<option value="1급">1급</option>
											<option value="2급">2급</option>
											<option value="3급">3급</option>
											<option value="4급">4급</option>
											<option value="5급">5급</option>
											<option value="6급">6급</option>
										</select>
									</div>
								</div>
							</c:if>
							<c:if test="${preferential.military ne '0'}">
								<div class="row military_status" style="display: block;">
									<div
										style="width: 50px; height: 50px; float: left; padding-top: 15px;">
										<p>병역</p>
									</div>
									<div class="info_form normal" style="margin: 0;">
										<select class="selecter_full" name="military"
											id="military_status">
											<option value="0" selected="selected">병역</option>
											<option value="군필">군필</option>
											<option value="미필">미필</option>
											<option value="면제">면제</option>
											<option value="해당없음">해당없음</option>
										</select>
									</div>
								</div>
							</c:if>
							<c:if test="${preferential.military eq '0'}">
								<div class="row military_status">
									<div
										style="width: 50px; height: 50px; float: left; padding-top: 15px;">
										<p>병역</p>
									</div>
									<div class="info_form normal" style="margin: 0;">
										<select class="selecter_full" name="military"
											id="military_status">
											<option value="0" selected="selected">병역</option>
											<option value="군필">군필</option>
											<option value="미필">미필</option>
											<option value="면제">면제</option>
											<option value="해당없음">해당없음</option>
										</select>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${checkPreferential eq false }">
				<div id="form_Preferential">
					<div class="sub_title">
						<h4 style="font-weight: bold;">우대사항, 병역</h4>
					</div>
					<div class="form" style="margin-bottom: 30px;"
						id="div_Preferential"></div>
				</div>
			</c:if>




			<div class="form" style="margin-bottom: 300px;">
				<div class="sub_title">
					<h4 style="font-weight: bold;">희망취업조건</h4>
				</div>
				<div class="new">
					<div class="row">
						<div class="info_form normal Preferential" style="width: 200px;">
							<select class="selecter_full" name="forms_employment"
								id="forms_employment">
								<option value="0" selected="selected">고용형태</option>
								<option value="정규직">정규직</option>
								<option value="계약직">계약직</option>
								<option value="병역특례">병역특례</option>
								<option value="프리랜서">프리랜서</option>
								<option value="헤드헌팅">헤드헌팅</option>
								<option value="파견대행">파견대행</option>
								<option value="인턴직">인턴직</option>
							</select>
						</div>
						<div class="info_form normal Preferential" style="width: 200px;">
							<select class="selecter_full" name="desired_work_place"
								id="desired_work_place">
								<option value="0" selected="selected">희망근무지</option>
								<option value="전국">전국</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="대전">대전</option>
								<option value="세종">세종</option>
								<option value="충남">충남</option>
								<option value="충북">충북</option>
								<option value="광주">광주</option>
								<option value="전남">전남</option>
								<option value="전북">전북</option>
								<option value="대구">대구</option>
								<option value="경북">경북</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="경남">경남</option>
								<option value="강원">강원</option>
								<option value="제주">제주</option>
								<option value="중국,홍콩">중국,홍콩</option>
								<option value="미국">미국</option>
								<option value="일본">일본</option>
								<option value="아시아,중동">아시아,중동</option>
								<option value="북아메리카">북아메리카</option>
								<option value="남아메리카">남아메리카</option>
								<option value="유럽">유럽</option>
								<option value="오세아니아">오세아니아</option>
								<option value="아프리카">아프리카</option>
							</select>
						</div>
						<div class="info_form normal Preferential" style="width: 200px;">
							<input type="text" name="salary" placeholder="희망연봉"
								value="${resume.salary }" onblur="blurSalary();"
								onfocus="focusSalary();">
						</div>
					</div>
				</div>
			</div>
		</section>







		<aside>
			<div class="more_menu">
				<p class="listhead" style="text-align: center;">항목 선택</p>
				<ul class="list_menu" id="list_menu">

					<c:if test="${checkSchool eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>학력사항</span></a>
							</div>
							<button class="img_button_plus" id="plus_School"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">학력사항</span></a>
							</div>
							<button class="img_button_minus" id="minus_School"></button></li>
					</c:if>

					<c:if test="${checkSchool eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>학력사항</span></a>
							</div>
							<button class="img_button_plus" id="plus_School"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">학력사항</span></a>
							</div>
							<button class="img_button_minus" id="minus_School"></button></li>
					</c:if>


					<c:if test="${checkCareer eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>경력사항</span></a>
							</div>
							<button class="img_button_plus" id="plus_Career"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">경력사항</span></a>
							</div>
							<button class="img_button_minus" id="minus_Career"></button></li>
					</c:if>
					<c:if test="${checkCareer eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>경력사항</span></a>
							</div>
							<button class="img_button_plus" id="plus_Career"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">경력사항</span></a>
							</div>
							<button class="img_button_minus" id="minus_Career"></button></li>
					</c:if>


					<c:if test="${checkActivities eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>대외활동</span></a>
							</div>
							<button class="img_button_plus" id="plus_Activities"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">대외활동</span></a>
							</div>
							<button class="img_button_minus" id="minus_Activities"></button></li>
					</c:if>
					<c:if test="${checkActivities eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>대외활동</span></a>
							</div>
							<button class="img_button_plus" id="plus_Activities"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">대외활동</span></a>
							</div>
							<button class="img_button_minus" id="minus_Activities"></button></li>
					</c:if>


					<c:if test="${checkEducation eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>교육사항</span></a>
							</div>
							<button class="img_button_plus" id="plus_Education"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">교육사항</span></a>
							</div>
							<button class="img_button_minus" id="minus_Education"></button></li>
					</c:if>
					<c:if test="${checkEducation eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>교육사항</span></a>
							</div>
							<button class="img_button_plus" id="plus_Education"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">교육사항</span></a>
							</div>
							<button class="img_button_minus" id="minus_Education"></button></li>
					</c:if>


					<c:if test="${checkCertificate eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>자격면허</span></a>
							</div>
							<button class="img_button_plus" id="plus_Certificate"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">자격면허</span></a>
							</div>
							<button class="img_button_minus" id="minus_Certificate"></button></li>
					</c:if>
					<c:if test="${checkCertificate eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>자격면허</span></a>
							</div>
							<button class="img_button_plus" id="plus_Certificate"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">자격면허</span></a>
							</div>
							<button class="img_button_minus" id="minus_Certificate"></button></li>
					</c:if>


					<c:if test="${checkAward eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>수상경력</span></a>
							</div>
							<button class="img_button_plus" id="plus_Award"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">수상경력</span></a>
							</div>
							<button class="img_button_minus" id="minus_Award"></button></li>
					</c:if>
					<c:if test="${checkAward eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>수상경력</span></a>
							</div>
							<button class="img_button_plus" id="plus_Award"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">수상경력</span></a>
							</div>
							<button class="img_button_minus" id="minus_Award"></button></li>
					</c:if>


					<c:if test="${checkOverseas_Experience eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>해외경험</span></a>
							</div>
							<button class="img_button_plus" id="plus_Overseas_Experience"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">해외경험</span></a>
							</div>
							<button class="img_button_minus" id="minus_Overseas_Experience"></button></li>
					</c:if>
					<c:if test="${checkOverseas_Experience eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>해외경험</span></a>
							</div>
							<button class="img_button_plus" id="plus_Overseas_Experience"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"> <span
									style="color: black; font-weight: bold;">해외경험</span></a>
							</div>
							<button class="img_button_minus" id="minus_Overseas_Experience"></button></li>
					</c:if>


					<c:if test="${checkLanguage eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>어학능력</span></a>
							</div>
							<button class="img_button_plus" id="plus_Language"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">어학능력</span></a>
							</div>
							<button class="img_button_minus" id="minus_Language"></button></li>
					</c:if>
					<c:if test="${checkLanguage eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>어학능력</span></a>
							</div>
							<button class="img_button_plus" id="plus_Language"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">어학능력</span></a>
							</div>
							<button class="img_button_minus" id="minus_Language"></button></li>
					</c:if>


					<c:if test="${checkPreferential eq false }">
						<li><div class="div_menu_li">
								<a style="color: black;"><span>우대사항, 병역</span></a>
							</div>
							<button class="img_button_plus" id="plus_Preferential"></button></li>
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span style="color: black;">우대사항,
										병역</span></a>
							</div>
							<button class="img_button_minus" id="minus_Preferential"></button></li>
					</c:if>
					<c:if test="${checkPreferential eq true }">
						<li style="display: none;"><div class="div_menu_li">
								<a style="color: black;"><span>우대사항, 병역</span></a>
							</div>
							<button class="img_button_plus" id="plus_Preferential"></button></li>
						<li><div class="div_menu_li">
								<a style="color: black;"><span
									style="color: black; font-weight: bold;">우대사항, 병역</span></a>
							</div>
							<button class="img_button_minus" id="minus_Preferential"></button></li>
					</c:if>
				</ul>
			</div>
			<div class="" style="width: 205px; height: 40px; float: left;">
				<button type="button" class=" btn-primary" id="submit"
					style="border: none; width: 100%; height: 100%; background-color: #848484; font-weight: bold;"
					onclick="submit();">수정완료</button>
			</div>
		</aside>
	</div>
</div>