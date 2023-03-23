<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
<!-- </head> -->
<!-- <body> -->
<script>
//   function requestPay() {
//     IMP.request_pay({
//       pg: "kcp.{imp81323135}",
//       pay_method: "card",
//       merchant_uid: ${rsrv_no},   // 주문번호
//       name: ${store_name},
//       amount: ${price}                     // 숫자 타입
// //       buyer_email: "",
// //       buyer_name: "",
// //       buyer_tel: "",
// //       buyer_addr: "",
// //       buyer_postcode: ""
//     }, function (rsp) { // callback
//       if (rsp.success) {
//         // 결제 성공 시 로직
//         alert("O");
//       } else {
//         // 결제 실패 시 로직
//         location.href = './Error.er';
//       }
//     });
//   }
</script>
<!-- <h1>pay.jsp</h1> -->

<%-- ${rsrv_no } <br> --%>
<%-- ${price } <br> --%>
<%-- ${store_no } <br> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp81323135"); 
    
        function requestPay() {
            IMP.request_pay({
                pg : 'kcp.{imp81323135}',
                pay_method : 'card',
                merchant_uid: "57008833-33004", 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '포트원 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>

<!-- </body> -->
<!-- </html> -->