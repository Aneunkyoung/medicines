<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style type="text/css">
figure.fileblock, #tt-body-page figure.fileblock {
    margin-top: 28px;
    margin-bottom: 20px;
    width: 470px;
    height: 71px;
    border: 1px solid #e9e9e9;
    position: relative;
    border-radius: 1px;
}
figure.fileblock a, #tt-body-page figure.fileblock a {
    display: block;
    height: 71px;
}
.article-view a {
    display: inline-block;
    color: #3d62ce;
}
figure.fileblock .image, #tt-body-page figure.fileblock .image {
    position: absolute;
    left: 0;
    top: 0;
    width: 30px;
    height: 30px;
    background-image: url(https://t1.daumcdn.net/tistory_admin/static/manage/post-editor/img_editor_content.svg);
    background-position: 0 0;
    margin: 21px 17px 20px 22px;
}
figure.fileblock .desc, #tt-body-page figure.fileblock .desc {
    position: absolute;
    left: 70px;
    right: 60px;
    top: 0;
    bottom: 0;
}
figure.fileblock .filename, #tt-body-page figure.fileblock .filename {
    color: #333333;
    font-size: 14px;
    text-overflow: ellipsis;
    height: 20px;
    margin: 17px 0 0;
}
figure.fileblock .name, #tt-body-page figure.fileblock .name {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 272px;
    height: 20px;
    display: block;
}
figure.fileblock .size, #tt-body-page figure.fileblock .size {
    font-family: Avenir Next, sans-serif;
    font-size: 12px;
    color: #777;
    height: 16px;
    margin: 2px 0 0;
}
</style>
</head>
<form id="noticeModifyForm" action="${pageContext.request.contextPath }/notice_modify/${notice.num}" method="post" enctype="multipart/form-data">
	<div class="wrapper">
		<section class="module">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt m-t-0 m-b-0">notice</h4>
						<hr class="divider-w m-t-10 m-b-20">
						<div class="form-group">
							<c:if test="${notice.origin!=null}">
								<div>
									<i class="fa fa-fw" onclick="deleteFile(${notice.num});" style="margin-left: 5px; margin-top: 5px; position: absolute; z-index: 999; cursor: pointer;">???</i>
								    	<figure class="fileblock" data-ke-align="alignCenter">
								        	<a tyle="cursor: pointer;">
												<div class="image"></div>
							        			<div class="desc">
									            	<div class="filename">
									               		<span class="name">${notice.origin }</span>
									                </div>
									             	<div class="size">????????????</div>
									           	</div>
								       		</a>
						        		</figure>
			                	</div>					
								<input type="file" id="fileUpload" name="uploadNoticeFile" style="display: none;">			
							</c:if>
							<c:if test="${notice.origin==null }">
								<input type="file" id="fileUpload" name="uploadNoticeFile">			
							</c:if>
						</div>
						<div class="form-group">
							<input name="id" class="form-control" type="hidden" placeholder="?????????" value="${notice.id }">							
							<input name="writer" class="form-control" type="hidden" placeholder="?????????" value="${notice.writer }">
							<input name="origin" class="form-control" type="hidden" placeholder="origin" value="${notice.origin }">
							<input name="upload" class="form-control" type="hidden" placeholder="upload" value="${notice.upload }">
							<input id="title" name="title" class="form-control" type="text" placeholder="??????" maxlength="200" value="${notice.title }">
							<div id = "titleErr"></div>
						</div>
						<div class="form-group">
							<textarea id="content" name="content" class="form-control" rows="10" style="resize: none;" placeholder="??????" maxlength="1000">${notice.content }</textarea>
							<div id = "contentErr"></div>
						</div>
						<p><button id="noticeModifyBtn" type="submit" class="btn btn-border-d btn-round btn-block">Submit</button></p>
					</div>
				</div>
			</div>
		</section>
	</div>
</form>	
<script type="text/javascript">
$("#noticeModifyBtn").click(function(){
	if($("#title").val() == ''){
		$("#title").focus();
		document.getElementById("titleErr").innerHTML="????????? ??????????????????.";
		return false;
	} else if($("#title").val().length>=200){
		$("#title").focus();
		document.getElementById("titleErr").innerHTML="????????? 200?????? ????????? ??????????????????.";
		return false;
	} else{
		document.getElementById("titleErr").innerHTML="";			
	}
	if($("textarea#content").val() == ''){
		$("textarea#content").focus();
		document.getElementById("contentErr").innerHTML="????????? ??????????????????.";
		return false;
	} else if($("textarea#content").val().length >= 1000){
		$("textarea#content").focus();
		document.getElementById("contentErr").innerHTML="????????? 1000?????? ????????? ??????????????????.";
		return false;
	} else{
		document.getElementById("contentErr").innerHTML="";			
	}	 
	noticeModifyForm.submit();
});
function deleteFile(num) {
	location.href="${pageContext.request.contextPath }/delete_file/"+num;
}
</script>