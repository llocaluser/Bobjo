<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style type="text/css">
 
.footer_new {
    border-top: #ddd solid 2px;
    background: #fff
}

.footer_new .sns-link a,.footer_new .footer-layer2 h1 a,.footer_new .award-list li a {
    display: block;
    overflow: hidden;
    text-indent: -99em
}

.footer_new .footer-layer1 {
    /* border-bottom: #ddd solid 1px; */
    height: 34px;
    text-align: center;
    padding-top: 15px;
    white-space: nowrap
}

.footer_new .footer-layer1 a {
   /*  display: inline-block; */
    white-space: nowrap;
    padding: 0 14px;
    font-size: 12px;
    color: #555;
    height: 12px;
    border-left: #888 solid 1px
}

.footer_new .footer-layer1 a:first-child {
    border-left: 0
}

.footer_new .footer-layer2 {
    width: 1020px;
    height: 100px;
    margin: 30px auto;
    font-size: 12px;
    color: #555;
    line-height: 150%
}

.footer_new .footer-layer2 a {
    color: #555
}

.footer_new .footer-layer2 h1 {
    float: left;
    width: 150px;
    background-image: url("./img/BOBJO!Footer.png");
    height: 50px;
    margin-top: 10px;
}

.footer_new .footer-layer2 h1 a {
    background-position: -19px -34px;
    width: 117px;
    height: 34px;
    margin-left: 10px;
}

.footer_new .footer-layer2 .licensee,.footer_new .footer-layer2 .service-check {
    text-decoration: underline
}

.footer_new .footer-layer2 strong {
    font-weight: bold;
    font-size: 12px
}

.footer_new .footer-content address {
    float: left;
    width: 260px
}

.footer_new .contact-fax {
    font-size: 11px
}

.footer_new .contact-info {
    float: left;
    width: 340px;
    color: #555
}

.footer_new .contact-info em {
    font-size: 24px;
    font-family: Tahoma;
    font-weight: bold;
    display: block;
    margin: 9px 0 11px 0
}

.footer_new .safe-service {
    float: left;
    width: 270px;
    font-size: 11px;
    margin-top: 10px;
}

.footer_new .footer-layer3 {
    width: 1020px;
    height: 80px;
    margin: 0 auto;
    position: relative;
    border-top: #ddd solid 1px
}

.footer_new .footer-layer3 .slide-area {
    width: 940px;
    height: 80px;
    margin: 0 auto;
    overflow: hidden
}

.footer_new .footer-layer3 .slide-navi .move {
    position: absolute;
    width: 40px;
    height: 80px;
    overflow: hidden;
    text-indent: -9em
}

.footer_new .footer-layer3 .slide-navi .prev {
    background-position: -20px -92px;
    left: 0;
    z-index: 5
}

.footer_new .footer-layer3 .slide-navi .next {
    background-position: -998px -92px;
    right: 0;
    z-index: 5
}

.footer_new .award-list {
    overflow: hidden
}

.footer_new .award-list li {
    float: left;
    width: 220px;
    height: 80px
}

.footer_new .award-list li a {
    height: 55px;
    margin-top: 15px;
    width: 188px
}

.footer_new .award-list li a.award-link3 {
    background-position: -44px -107px
}

.footer_new .award-list li a.award-link4 {
    background-position: -222px -107px
}

.footer_new .award-list li a.award-link5 {
    background-position: -417px -107px
}

.footer_new .award-list li a.award-link13 {
    background-position: -623px -107px
}

.footer_new .footer-layer4 {
    background: #333;
    height: 80px
}

.footer_new .coupang-copyright {
    width: 1020px;
    margin: 0 auto;
    position: relative
}

.footer_new .coupang-copyright p {
    color: #888;
    font-size: 11px
}

.footer_new .coupang-copyright .info {
    padding: 21px 0 3px 0
}

.footer_new .sns-link {
    position: absolute;
    top: 23px;
    right: 0
}

.footer_new .sns-link li {
    float: left
}

.footer_new .sns-link a {
    width: 34px;
    height: 34px;
    margin-right: 8px
}

.footer_new .sns-link a.facebook {
    background-position: -220px -30px
}

.footer_new .sns-link a.blog {
    background-position: -348px -30px
}

.footer_new .sns-link a.instagram {
    background-position: -390px -30px
}

.footer-top__banner-notice {
    background: #f1f4f6;
    font-size: 12px
}

.footer-top__banner-notice .footer-top__banner-notice-inner {
    width: 1020px;
    position: relative;
    margin: 0 auto;
    padding: 12px
}

.footer-top__banner-notice .footer-top__banner-notice-inner .footer-top__banner-notice-link {
    color: inherit;
    font-weight: bold
}

.footer-top__banner-notice .footer-top__banner-notice-inner .footer-top__banner-notice-link:after {
    display: inline-block;
    content: '';
    border-top: 1px solid #000;
    border-right: 1px solid #000;
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
    width: 6px;
    height: 6px;
    position: relative;
    top: -1px
}

.footer-banner-floating {
    z-index: 2000;
    position: fixed;
    bottom: 0;
    left: 0
}

.footer-banner {
    width: 100%;
    min-width: 1020px;
    text-align: center;
    background-color: rgba(214,239,255,0.98);
    padding-top: 14px;
    padding-bottom: 13px
}

.footer-banner .footer-banner-message {
    font-size: 14px
}

.footer-banner .footer-banner-message a {
    color: #111
}

.footer-banner .footer-banner-message .footer-banner-arrow {
    height: 12px;
    margin-top: 2px
}

.footer-banner .footer-banner-message .highlights {
    color: #009abf;
    font-weight: 550
}

.footer-banner .footer-banner-close-button-wrapper {
    position: absolute;
    right: 0;
    bottom: 0;
    width: 44px;
    height: 44px
}

.footer-banner .footer-banner-close-button-wrapper img {
    height: 100%
}
 </style>


</head>
<body>

<footer id="footer" class="footer_new">
   
  
        
          <div class="footer-layer2">
              <h1><a href="./Main.me" title="BOBJO">BOBJO</a></h1>    <!-- 쿠팡에서 그림변경하기  -->
              <div class="footer-content">
                  <address>
                       <br>
                      상호명 및 호스팅 서비스 제공 : BOBJO(주)<br>
                      부산광역시 부산진구 동천로 109 <br>
                  </address>
                  <div class="contact-info">
                      <a href="#" class="call-center" title="365 고객센터">
                         <strong>365고객센터</strong>
                          <em>051-803-0909</em>
                          부산광역시 부산진구 동천로 109 삼한골든게이트 7층<br>
                      </a>
                  </div>
                  <p class="safe-service">
                      <strong> 서울 음식점 예약사이트 BobJo! </strong><br>
                      <a href="./main.me" id="serviceCheck" class="service-check" title="음식점 예약하러가기">음식점 예약하러가기 &gt;</a>
                  </p>
              </div>
          </div>
         <!--  <div class="footer-layer3 slide-unit">
              <div class="certification-list" style="width: 968px;height: 80px; margin: 0 auto; background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v10.png) no-repeat; background-position: -44px -92px; position: relative;">
              </div>
          </div> -->
      <div class="footer-layer4">
           <div class="coupang-copyright"> 
              <div class="footer-layer1 is-narrowed"> 
              <a target="_blank">회사소개</a>
              <a>입점 / 제휴문의</a>
              <a>공지사항</a>
              <a>이용약관</a>
              <a><b>개인정보 처리방침</b></a>
            <div class="site-picker">
          </div>
         </div>
     </footer>

</body>
</html>