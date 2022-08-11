<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>슈퍼멍뭉</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/resources/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${ctx}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/resources/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${ctx}/resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="${ctx}/resources/css/glightbox.min.css" />
    <link rel="stylesheet" href="${ctx}/resources/scss/main.css" />
</head>

<body>
  <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

  <!-- Preloader -->
  <div class="preloader">
    <div class="preloader-inner">
      <div class="preloader-icon">
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- /End Preloader -->

  <!-- Start Error Area -->
  <div class="error-area">
    <div class="d-table">
      <div class="d-table-cell">
        <div class="container">
          <div class="error-content">
            <h1>404</h1>
            <h2>페이지가 존재하지 않습니다.</h2>
            <p>해당 URL은 존재하지 않는 URL입니다. 아래 뒤로가기 버튼을 눌러 페이지로 돌아가세요.</p>
            <div class="button">
              <a href="javascript:history.back()" class="btn">뒤로가기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Error Area -->

  <!-- ========================= JS here ========================= -->
  <script src="${ctx}/resources/js/bootstrap.min.js"></script>
  <script>
    window.onload = function () {
      window.setTimeout(fadeout, 500);
    }

    function fadeout() {
      document.querySelector('.preloader').style.opacity = '0';
      document.querySelector('.preloader').style.display = 'none';
    }
  </script>
</body>

</html>