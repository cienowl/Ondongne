<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.ondongne.dto.DataTransferCircle"%>
<%@page import="com.ondongne.dto.DataTransferCircleJoin"%>

<%
	List<DataTransferCircle> joinCircleList = (List<DataTransferCircle>)request.getAttribute("circleList");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 마이페이지</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
        </style>
        <style>
            .navbar {
                background: #880e4f !important;
            }
        </style>
        <style>
            .sticky-top {
                top: 6em;
            }
        </style>
    </head>

    <body class="grey lighten-3">

        <!-- Header Start -->
        <header>
            <jsp:include page="navbar_signon.jsp"/>
        </header>

        <!--Modal: 회원탈퇴 확인창-->
        <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-md modal-notify modal-danger" role="document">
                <!--Content-->
                <div class="modal-content">
                    <form action="delete.users" method="POST">
                        <!--Header-->
                        <div class="modal-header d-flex justify-content-center">
                            <p class="heading">ON동네 탈퇴</p>
                        </div>

                        <!--Body-->
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-3">
                                    <p></p>
                                    <p class="text-center"><i class="fas fa-times fa-4x animated rotateIn"></i></p>
                                </div>

                                <div class="col-9">
                                    <p>ON동네 서비스를 정말로 탈퇴하시겠습니까?</p>
                                    <p>탈퇴를 위해 계정 비밀번호를 입력해주세요.</p>
                                    <div class="md-form">
                                        <i class="fas fa-lock prefix"></i>
                                        <input type="password" id="inputValidationEx2" name="confirmPassword" class="form-control validate"/>
                                        <label for="inputValidationEx2" data-error="wrong" data-success="right">비밀번호 입력</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Footer-->
                        <div class="modal-footer flex-center">
                            <button class="btn btn-outline-danger" type="submit">탈퇴</button>
                            <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">취소</a>
                        </div>
                    </form>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <!--Modal: modalConfirmDelete-->

        <!--Main layout-->
        <main class="pt-5 mx-lg-5">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-2 mt-5">
                        <!-- Card -->
                        <div class="card sticky-top">

                            <!-- Card image -->
                            <%-- <img class="card-img-top img-fluid rounded-circle hoverable zoom" src="https://mdbootstrap.com/img/Photos/Others/images/43.jpg" alt="Card image cap"> --%>
                            <div class="view overlay zoom">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/6-col/img%20(131).jpg" class="img-fluid rounded" alt="zoom">
                                <div class="mask flex-center waves-effect waves-light">
                                    <p class="white-text">사진 변경</p>
                                </div>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h5 class="card-title"><%= session.getAttribute("email") %></h5>
                                <!-- Text -->
                                <%-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                content.</p> --%>

                                <!-- Nav list -->
                                <%-- <a href="#" class="btn btn-primary">Button</a> --%>
                                <div class="list-group">
                                    <%-- <a href="#!" class="list-group-item list-group-item-action active">
                                        Cras justo odio
                                    </a> --%>
                                    <a href="mypage.ondongne" class="list-group-item list-group-item-action">대시보드</a>
                                    <a href="signupsub.users" class="list-group-item list-group-item-action">개인정보수정</a>
                                    <a href="" class="list-group-item list-group-item-action" onclick="acyncMovePage('testform2.html');">Ajax Test</a>
                                    <a href="" class="list-group-item list-group-item-action">팔로잉</a>
                                    <a href="" class="list-group-item list-group-item-action">팔로워</a>
                                    <a href="" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#modalConfirmDelete">탈퇴하기</a>
                                </div>

                            </div>

                        </div>
                        <!-- Card -->
                    </div>

                    <div class="col mt-5">

                        <div class="row">
                            <!-- Heading -->
                            <div class="card col mb-4 wow fadeIn">
                                <!--Card content-->
                                <div class="card-body d-sm-flex justify-content-between">
                                    <h4 class="mb-2 mb-sm-0 pt-1">
                                        <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Home Page</a>
                                        <span>/</span>
                                        <span>Dashboard</span>
                                    </h4>
                                    <form class="d-flex justify-content-center">
                                        <!-- Default input -->
                                        <input type="search" placeholder="Type your query" aria-label="Search" class="form-control">
                                        <button class="btn btn-primary btn-sm my-0 p" type="submit">
                                        <i class="fas fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <!-- Heading -->
                        </div>

                        <div class="row" id="bodyContents">
                            <!--Grid row-->
                            <div class="row wow fadeIn">

                                <!--Grid column-->
                                <div class="col-lg-6 col-md-6 mb-4">

                                <!--Card-->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header">내가 작성한 소모임글</div>

                                    <!--Card content-->
                                    <div class="card-body">

                                    <canvas id="lineChart"></canvas>

                                    </div>

                                </div>
                                <!--/.Card-->

                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-lg-6 col-md-6 mb-4">

                                <!--Card-->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header">내가 작성한 판매글</div>

                                    <!--Card content-->
                                    <div class="card-body">

                                    <canvas id="radarChart"></canvas>

                                    </div>

                                </div>
                                <!--/.Card-->

                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-lg-6 col-md-6 mb-4">

                                <!--Card-->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header">참여한 소모임</div>

                                    <!--Card content-->
                                    <div class="card-body">
                                        <table class="table table-hover" style="padding-left:300px;">
                                            <thead>
                                                <tr>
                                                <th scope="col">참여한 소모임</th>
                                                <th scope="col">글제목</th>
                                                <th scope="col">작성자</th>
                                                <th scope="col">모임날짜</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < joinCircleList.size(); i++) { %>
                                                    <tr>
                                                        <td><%=i+1 %></td>
                                                        <th><%=joinCircleList.get(i).getTitle()%></th>
                                                        <td><%=joinCircleList.get(i).getEmail() %></td>
                                                        <td><%=joinCircleList.get(i).getEvent_date() %></td>
                                                    </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <!--/.Card-->

                                </div>
                                <!--Grid column-->

                                <!--Grid column-->
                                <div class="col-lg-6 col-md-6 mb-4">

                                <!--Card-->
                                <div class="card">

                                    <!-- Card header -->
                                    <div class="card-header">판매글 스크랩</div>

                                    <!--Card content-->
                                    <div class="card-body">

                                    <canvas id="horizontalBar"></canvas>

                                    </div>

                                </div>
                                <!--/.Card-->

                                </div>
                                <!--Grid column-->
                            </div>
                            <!--Grid row-->
                        </div>

                    </div>

                </div>
            </div>
        </main>
        <!--Main layout-->


        <footer>
        <!-- Footer import -->
        <%@ include file="footer.jsp" %>
        </footer>


        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->


        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>

        <script>
            function acyncMovePage(url){
                // ajax option
                var ajaxOption = {
                    url : url,
                    async : true,
                    type : "POST",
                    dataType : "text",
                    cache : false
                };

                $.ajax(ajaxOption).done(function(data){
                    $('#bodyContents').children().remove();
                    // $('#bodyContents').children().empty();
                    $('#bodyContents').html(data);
                    // $('#bodyContents').append("data");
                    // console.log("dd");
                });
            }
        </script>
    </body>
</html>