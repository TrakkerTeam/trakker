<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../../header.jspf" %>
	<style>
		#banner {
			right: 20px;
			bottom: 50px;
			width: 50px;
			height: 100px;
			position: fixed;
		}
		#banner.on {
			position: absolute;
			bottom: 350px;
		}
	</style>
</head>
<body>

<main class="position-relative">
	<div style="height: 700px;">텍스트 공간</div>
	<div id="banner">
		banner
	</div>
	<%@ include file="../../footer.jspf" %>
</main>

<script>
	$(function() {
		var $w = $(window);
		var footerHei = $('footer').outerHeight();
		var $banner = $('#banner');
		$w.on('scroll', function() {
			var sT = $w.scrollTop();
			var val = $(document).height() - $w.height() - footerHei;
			if (sT >= val)
				$banner.addClass('on')
			else
				$banner.removeClass('on')

			console.log()
			console.log('sT '+sT)
			console.log('val '+val)
			console.log('비교 '+sT>=val)
			console.log()

			console.log('$(document).높이 '+$(document).height())
			console.log('$w.높이 '+$w.height())
			console.log('footer의 outerHeight '+$('footer').outerHeight())
			console.log()
			console.log('reset!')
		});
	});
</script>
</body>
</html>