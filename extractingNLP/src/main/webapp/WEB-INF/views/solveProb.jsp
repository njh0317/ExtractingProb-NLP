  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
   pageEncoding="UTF-8" session="false"%>
   
<!DOCTYPE html>
<html>

<head>

    <title>__Blank__</title>


    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">

    <link href="${pageContext.request.contextPath}/resources/js/file.js">
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
    
</head>
<style>
    .navbar-brand {
        font-family: 'Lobster', cursive;
    }

    #borderimg2 {
        text-align: right;
        width: 1000px;
        border-top: 10px solid transparent;
        border-image: url(http://i.stack.imgur.com/bZ8Lk.png) 30 stretch;
    }

    .pt-3-half {
        padding-top: 1.4rem;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:80px; width:100%">

    <a class="navbar-brand" style="width: 100%; text-align: center;">&nbsp;&nbsp;__Blank__</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">

        <span class="navbar-toggler-icon"></span>

    </button>

</nav>

<body>
    <!--          <h4 class="card-header text-center font-weight-bold text-uppercase py-4">Editable table</h4>                  -->

    <div class="card-body" style="padding:30px">
        <div id="table" class="table-editable">
            <span class="table-add float-right mb-3 mr-2">
                <a href="#!" class="text-success">
                    <i class="fas fa-plus fa-2x" aria-hidden="true"></i>
                </a>
            </span>
            <table class="table table-bordered table-responsive-md table-striped text-center">
                <thead>
                    <tr>
                        <th class="text-center" style="width:90%">Question</th>
                        <th class="text-center">정답보기</th>
                    </tr>
                </thead>
                <tbody id="final_table_item"></tbody>
            </table>
        </div>
    </div>

    <div style="padding:10px; text-align:right">
        <button class="btn btn-primary">채점하기</button>
    </div>
</body>

<script>

    var question = ["q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"];//textrank로 만든 question을 이 array에 담기
    $('#final_table_item').empty();
    for (var i = 0; i < question.length; i++) {
        var rowItem = "<tr>"
        rowItem += "<td class = 'pt-3-half' contenteditable = 'true'>" + question[i] + "</td>"
        rowItem += "<td><span class = 'table-remove'><button type = 'button' class = 'btn btn-danger btn-rounded btn-sm my-0' id = " + i + "_remove>정답보기</button></span></td>"
        rowItem += "</tr>"

        console.log(rowItem);
        $('#final_table_item').append(rowItem)
    }



</script>

</html>
<!-- 참고 사이트: https://mdbootstrap.com/docs/jquery/tables/editable/#! -->
<!-- 동적 테이블 생성 : https://lasdri.tistory.com/594 -->
<!-- 드래그앤드롭(sort) 참고 사이트: https://developer.mozilla.org/ko/docs/Web/API/HTML_%EB%93%9C%EB%9E%98%EA%B7%B8_%EC%95%A4_%EB%93%9C%EB%A1%AD_API  -->
<!-- remove 클릭시 테이블에서는 요소 빼고 변수에 저장해뒀다가 리무브드테이블에 다시 작성-->
<!-- add 클릭시 테이블에서는 요소 빼고 변수에 저장해뒀다가 에디터블테이블에 다시 작성 -->