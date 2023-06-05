<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>카카오 지도 테스트</title>
</head>
<body>
<div id="map" style="height: 400px;width: 400px;">지도영역입니다.</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff578b49f92891ac0c09c13cd0555703"></script>
<script>
    let mapContainer= document.getElementById('map');
    let mapOptions = {
        center: new kakao.maps.LatLng(37.565715842361456, 126.97791684733436),
        level: 7
    };
    let map = new kakao.maps.Map(mapContainer, mapOptions);
</script>
</body>
</html>