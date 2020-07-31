 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
작성자:
    html        - 김나예
    css         - 김나예
    JavaScript  - 김나예
-->
<%@page import="com.ondongne.dto.DataTransferCircle" %>
<%@page import="java.util.List" %>


<%
	List<DataTransferCircle> circleList = (List<DataTransferCircle>) request.getAttribute("circleList");
	String dataTarget = null;
%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ON동네 - 우리동네 소모임</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet">

        <!-- half-page-carousel image-->
        <style type="text/css">
            html, body, header, .carousel {
                height: 60vh;
            }
            @media (max-width: 740px) {
                html, body, header, .carousel {
                    height: 100vh;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                html, body, header, .carousel {
                    height: 100vh;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #1C2331 !important;
                }
            }
            /* 다른 색상 네비바
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #929FBA !important;
                }
            } */
        </style>
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
        </style>
    </head>

    <body>

        <!--Main Navigation-->
        <header>
            <!-- Navbar signin form -->
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>

            <!--Carousel Wrapper-->
            <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">

                <!--Indicators-->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                </ol>
                <!--/.Indicators-->

                <!--Slides-->
                <div class="carousel-inner" role="listbox">

                    <%
                    String[] imgUrl = {
                        "https://mdbootstrap.com/img/Photos/Others/nature7.jpg",
                        "https://mdbootstrap.com/img/Photos/Others/images/77.jpg",
                        "https://mdbootstrap.com/img/Photos/Others/images/47.jpg"
                    };
                    String[] carouselClass = {
                        "carousel-item active",
                        "carousel-item",
                        "carousel-item"
                    };
                    %>
                    <% for (int i = 0; i < 3; i++) { %>
                        <!-- slide -->
                        <div class="<%= carouselClass[i] %>">
                            <div class="view" style="background-image: url('<%= imgUrl[i] %>'); background-repeat: no-repeat; background-size: cover;">

                            <!-- Mask & flexbox options -->
                            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

                                <!-- Content -->
                                <div class="text-center white-text mx-5 wow fadeIn">
                                    <h1 class="mb-4">
                                        <strong>Learn Bootstrap 4 with MDB</strong>
                                    </h1>

                                    <p>
                                        <strong>Best & free guide of responsive web design</strong>
                                    </p>

                                    <p class="mb-4 d-none d-md-block">
                                        <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and
                                        written versions
                                        available. Create your own, stunning website.</strong>
                                    </p>

                                    <a class="btn btn-outline-white btn-lg" onclick="checksession();">소모임 글쓰기
                                        <i class="fas fa-pen ml-2"></i>
                                    </a>
                                </div>
                                <!-- Content -->

                            </div>
                            <!-- Mask & flexbox options -->

                            </div>
                        </div>
                        <!-- /slide -->

                    <% } %>

                </div>
                <!--/.Slides-->

                <!--Controls-->
                <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <!--/.Controls-->

            </div>
            <!--/.Carousel Wrapper-->
        </header>
        <!--Main Navigation-->


        <!--Main layout-->
        <main>
            <div class="container my-5">

                <!-- Section -->
                <section>

                <style>
                    .md-pills .nav-link.active {
                        color: #fff;
                        background-color: #616161;
                    }
                    button.close {
                        position: absolute;
                        right: 0;
                        z-index: 2;
                        padding-right: 1rem;
                        padding-top: .6rem;
                    }
                </style>
				<% for(int i=0;i<circleList.size();i++) { %>
				<% dataTarget = "circleList" + Integer.toString(i); %>
                <!-- Modal: Card Content -->
                <div class="modal fade" id="<%=dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body p-0">

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                                <!-- Grid row -->
                                <div class="row">
                                    <!-- Grid column -->
                                    <div class="col-md-6 py-5 pl-5">

                                        <h5 class="font-weight-normal mb-3"><%= circleList.get(i).getTitle() %></h5>

                                        <p class="text-muted" style="overflow-y:scroll; height:100px;  word-break:break-all;"><%= circleList.get(i).getDescription() %></p>

                                        <ul class="list-unstyled font-small mt-3">
                                            <li>
                                                <p class="text-uppercase mb-2"><strong>작성자</strong></p>
                                                <p class="text-muted mb-4"><a href="https://mdbootstrap.com/docs/jquery/design-blocks/"><%= circleList.get(i).getEmail() %></a></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>지역</strong></p>
                                                <p class="text-muted mb-4"><%= circleList.get(i).getRegion() %></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>모임날짜</strong></p>
                                                <p class="text-muted mb-4"><%= circleList.get(i).getEvent_date() %></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>마감날짜</strong></p>
                                                <a href="https://mdbootstrap.com/docs/jquery/design-blocks/"><%= circleList.get(i).getEnd_date() %></a>
                                            </li>
                                        </ul>
                                        <button type="submit" class="btn btn-outline-primary" style="position:absolute;">참여하기</button>
		
                                    </div>
                                    <!-- Grid column -->

                                    <!-- Grid column -->
                                    <div class="col-md-6">

                                        <div class="view rounded-right">
                                            <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Vertical/5.jpg" alt="Sample image">
                                        </div>

                                    </div>
                                    <!-- Grid column -->

                                </div>
                                <!-- Grid row -->

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal end -->
                <% } %>

                <%-- <h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">portfolio</h6>
                <h3 class="font-weight-bold text-center dark-grey-text pb-2">Product Designs</h3>
                <hr class="w-header my-4">
                <p class="lead text-center text-muted pt-2 mb-5">You can find several product design by our professional team in this section.</p>

               
                <!--First row-->
                <div class="row">

                    <!--First column: filter button-->
                    <div class="col-12 my-4">
                        <!-- Nav tabs -->
                        <ul class="nav md-pills flex-center flex-wrap mx-0" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active font-weight-bold text-uppercase" data-toggle="tab" href="#panel31" role="tab">전체</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#panel32" role="tab">소모임</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#panel33" role="tab">판매</a>
                            </li>
                        </ul>
                    </div>
                    <!--First column--> 

                </div>
                <!--First row-->
--%>
                <!--Tab panels-->
                <div class="tab-content mb-5">

                    <!--Panel 1-->
                    <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

                        <!-- Grid row -->
                        <div class="row">
						
						<% for (int i=0;i<circleList.size();i++){ %>
							<% dataTarget = "#circleList" + Integer.toString(i); %>
                            <!-- Grid column 1 -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="<%= dataTarget %>">
                                    <!-- Card image -->
                                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img3.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3"><%= circleList.get(i).getTitle() %></h5>
                                        <p class="font-small grey-text mb-2"><%= circleList.get(i).getEmail() %></p>
                                        <p class="card-text mb-3" style="overflow:hidden; text-overflow: ellipsis; height:40px; white-space: nowrap; word-break:break-all;"><%= circleList.get(i).getDescription() %></p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"> <i class="far fa-heart" ></i><%= circleList.get(i).getEvent_date() %></p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0">(마감 : <%=circleList.get(i).getEnd_date() %> )</p>
                                    </div>
                                </a>
                                <!-- Card -->
                            </div>
                            <!-- Grid column  -->
                       	<% } %>

                        </div>
                        <!-- Grid row -->

                    </div>
                    <!--Panel 1-->
				</div>
				<!--  Tab panels -->
<%-- 
                    <!--Panel 2-->
                    <div class="tab-pane fade" id="panel32" role="tabpanel">

                        <!-- Grid row -->
                        <div class="row">

                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">
                                    <!-- Card image -->
                                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img9.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3">글제목1</h5>
                                        <p class="font-small grey-text mb-2">Anna Smith</p>
                                        <p class="card-text mb-3">내용내용내용</p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="fa fa-clock-o"></i>27/08/2019</p>
                                    </div>
                                </a>
                                <!-- Card -->
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">
                                    <!-- Card image -->
                                    <img class="card-img-top" src=" https://mdbootstrap.com/img/Photos/Others/img4.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3">글제목1</h5>
                                        <p class="font-small grey-text mb-2">Anna Smith</p>
                                        <p class="card-text mb-3">내용내용내용</p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="fa fa-clock-o"></i>27/08/2019</p>
                                    </div>
                                </a>
                                <!-- Card -->
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">
                                    <!-- Card image -->
                                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img8.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3">글제목1</h5>
                                        <p class="font-small grey-text mb-2">Anna Smith</p>
                                        <p class="card-text mb-3">내용내용내용</p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="fa fa-clock-o"></i>27/08/2019</p>
                                    </div>
                                </a>
                                <!-- Card -->
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">
                                    <!-- Card image -->
                                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img8.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3">글제목1</h5>
                                        <p class="font-small grey-text mb-2">Anna Smith</p>
                                        <p class="card-text mb-3">내용내용내용</p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="fa fa-clock-o"></i>27/08/2019</p>
                                    </div>
                                </a>
                                <!-- Card -->
                            </div>
                            <!-- Grid column -->

                        </div>
                        <!-- Grid row -->

                    </div>
                    <!--Panel 2-->

                    <!--Panel 3-->
                    <div class="tab-pane fade" id="panel33" role="tabpanel">

                      <!-- Grid row -->
                      <div class="row">

                        <!-- Grid column -->
                        <div class="col-md-12 col-lg-4">

                          <!-- Card -->
                          <div class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">

                            <!-- Card image -->
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img3.jpg" alt="Card image cap">

                            <!-- Card content -->
                            <div class="card-body">

                              <h5 class="my-3">Phone Bag</h5>
                              <p class="card-text text-uppercase mb-3">Bag, Box</p>

                            </div>

                          </div>
                          <!-- Card -->

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-6 col-lg-4">

                          <!-- Card -->
                          <a class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">

                            <!-- Card image -->
                            <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img5.jpg" alt="Card image cap">

                            <!-- Card content -->
                            <div class="card-body">

                              <h5 class="my-3">Notes</h5>
                              <p class="card-text text-uppercase mb-3">Note</p>

                            </div>

                          </a>
                          <!-- Card -->

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-6 col-lg-4">

                          <!-- Card -->
                          <a class="card hoverable mb-4" data-toggle="modal" data-target="#basicExampleModal">

                            <!-- Card image -->
                            <img class="card-img-top" src=" https://mdbootstrap.com/img/Photos/Others/img10.jpg" alt="Card image cap">

                            <!-- Card content -->
                            <div class="card-body">

                              <h5 class="my-3">T-shirt</h5>
                              <p class="card-text text-uppercase mb-3">Box</p>

                            </div>

                          </a>
                          <!-- Card -->

                        </div>
                        <!-- Grid column -->

                      </div>
                      <!-- Grid row -->

                    </div>
                    <!--Panel 3-->

                  </div>
                  <!--Tab panels-->
--%>
                </section>
                <!-- Section -->

              </div>


        </main>
        <!--Main layout-->


        <!-- Footer import -->
        <%@ include file="footer.jsp" %>


        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Optional JavaScript -->
      

        <!-- cards effect -->
        <script>
            $(function () {
                var selectedClass = "";
                $(".filter").click(function () {
                    selectedClass = $(this).attr("data-rel");
                    $("#gallery").fadeTo(100, 0.1);
                    $("#gallery div").not("." + selectedClass).fadeOut().removeClass('animation');

                    setTimeout(function () {
                        $("." + selectedClass).fadeIn().addClass('animation');
                        $("#gallery").fadeTo(300, 1);
                    }, 300);
                });
            });
        </script>
    
 		<!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>
        
        <!-- login check -->
        <script>
        
        	function checksession(){

        		var checksession = '<%= (String)session.getAttribute("email") %>';
        		
        	   	if(checksession=="null"){
        	   		alert("로그인 모달창");
			
        	   	}
        	   	else{
        	   		window.location.href='postform.circle';
        	   	}	
        	}
        </script>
        
    
      

    </body>

</html>