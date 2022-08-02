<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <div id="footer" class="container-fluid bg-dark footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
        <div id="footer_row" class=" row container py-5">
            <div id="footer_des" class=" g-5">
                <div id="foot_address" class=" col-lg-3 col-md-6">
                    <h4 class="text-light mb-4 col-3">Address</h4>
                    <p><i class="fa fa-map-marker-alt me-3"></i>&nbsp&nbsp 123 Street, New York, USA</p>
                    <p><i class="fa fa-phone-alt me-3"></i>&nbsp +012 345 67890</p>
                    <p><i class="fa fa-envelope me-3"></i>&nbsp info@example.com</p>
                </div>



                <div class="row">
                    <div class="col-md-4 text-center text-md-start mb-4 mb-md-0">
                        <h1 class="fw-bold text-primary mb-4">낭<span class="text-secondary">만</span>서점
                        </h1>
                    </div>
                    <div class="col-md-4 text-center text-md-center mb-4 mb-md-0">
                        <p>Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et
                            lorem
                            et sit, sed
                            stet lorem sit clita</p>
                    </div>
                    <div id="sns_footer" class="col-md-4 text-md-end mb-4 mb-md-0">

                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-0" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>




            </div>
        </div>
        <div class="container-fluid copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a href="#">Your Site Name</a>, All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end">

                        Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                        <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
    <div class="fix">

        <!-- 실시간 -->
        <div class="col-4" id="real_chatSum">
            <div id="real_chat" class="col-12 hide">
                <div class="row" id="real_nav">
                    <div class="col-2" id="nav_ico"><i class="bi bi-person-fill"></i></div>
                    <div class="col" id="nav_text">
                        <div id="text_title">독립서점</div>
                        <div id="text_subtitle">응답하는중</div>
                    </div>
                </div>
                <div id="real_chatItems">
                    <div class="row" id="chat_left">
                        <div class="row">

                            <div id="item_ico" class="col-2 justify-content-end"><i class="bi bi-person-circle"></i>
                            </div>
                            <div class="col-10"></div>
                        </div>

                        <div class="row">

                            <div class="col-9" id="content_box">

                                <div id="item_content">
                                    dfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddd
                                </div>
                            </div>
                            <div class="col-3"></div>
                        </div>

                    </div>
                    <div class="row" id="chat_right">
                        <div class="row">
                            <div class="col-10"></div>
                            <div id="item_ico" class="col-2"><i class="bi bi-person-circle"></i></div>
                        </div>

                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-9" id="content_box">

                                <div id="item_content">
                                    dfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddddfsfdddddddd
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="row" id="real_input">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Recipient's username"
                            aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-secondary" type="button" id="button-addon2">Button</button>
                    </div>
                </div>
            </div>
            <div class="row" id="button_box">

                <button class="btn btn-info" id="chat_button"> 실시간 채팅</button>
            </div>


        </div>
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
                class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#chat_button").click(function () {

                $("#real_chat").toggleClass("hide");
            });

            $("#search_btn").click(function () {

                $("#main_search").toggleClass("hide");
            });
            search_btn
        });


    </script>