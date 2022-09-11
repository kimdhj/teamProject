<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
<div class="page-flex">
	<!-- ! Sidebar -->
	<aside class="sidebar">
		<div class="sidebar-start">
			<!-- 젤상단 로고 -->
			<div class="sidebar-head">
				<a href="/" class="logo-wrapper" title="Home"> <span
					class="sr-only">Home</span> <span class="icon logo"
					style="background-image: url(/img/서점로고.ico);" aria-hidden="true"></span>
					<div class="logo-text">
						<span class="logo-title">낭만 서점</span> <span class="logo-subtitle">낭만
							전사</span>
					</div>

				</a>
				<button class="sidebar-toggle transparent-btn" title="Menu"
					type="button">
					<span class="sr-only">Toggle menu</span> <span
						class="icon menu-toggle" aria-hidden="true"></span>
				</button>
			</div>
			<!-- 집모양 여기부터 -->
			<div class="sidebar-body">
				<ul class="sidebar-body-menu">
					<li><a class="active" href="/adminMain.mdo"><span class="icon home"
							aria-hidden="true"></span>Dashboard</a></li>
					<li><a class="show-cat-btn" href="##"> <span
							class="icon user-3" aria-hidden="true"></span>회원관리 <span
							class="category__btn transparent-btn" title="Open list"> <span
								class="sr-only">Open list</span> <span class="icon arrow-down"
								aria-hidden="true"></span>
						</span>
					</a>
						<ul class="cat-sub-menu">
							<li><a href="/getAdmin_member_List.mdo">회원관리</a></li>
							<li><a href="/getAdmin_admin_List.mdo">관리자계정 관리</a></li>
							<li><a href="/new-post.html">약관관리</a></li>
						</ul></li>
					<li><a class="show-cat-btn" href="/ab"> <span
							class="icon folder " aria-hidden="true"></span>카테고리 관리
					</a></li>
					<li><a class="show-cat-btn" href="##"> <span
							class="icon document" aria-hidden="true"></span>로그
					</a></li>
					<li><a class="show-cat-btn" href="##"> <span
							class="marketing fs-5"><i class="bi bi-box2-heart-fill"></i></span>상품

					</a></li>
					<li><a class="show-cat-btn" href="##"> <span
							class="icon paper" aria-hidden="true"></span>주문 <span
							class="category__btn transparent-btn" title="Open list"> <span
								class="sr-only">Open list</span> <span class="icon arrow-down"
								aria-hidden="true"></span>
						</span>
					</a>
						<ul class="cat-sub-menu">
							<li><a href=/pages.html">주문 관리</a></li>
							<li><a href="/new-page.html">환불/교환/반품</a></li>
						</ul></li>
					<li><a class="show-cat-btn" href="##"> <span
							class="icon edit" aria-hidden="true"></span>게시판 <span
							class="category__btn transparent-btn" title="Open list"> <span
								class="sr-only">Open list</span> <span class="icon arrow-down"
								aria-hidden="true"></span>
						</span>
					</a>
						<ul class="cat-sub-menu">
							<li><a href="admin_post_Notice.jsp">공지 사항</a></li>
							<li><a href="admin_post_Review.jsp">리뷰</a></li>
							<li><a href="admin_post_Faq.jsp">FAQ</a></li>
							<li><a href="admin_post_Qna.jsp">문의(Q&A)</a></li>
						</ul></li>
					<li><a class="show-cat-btn" href="##"> <span
							class=" fs-5 marketing"><i class="bi bi-newspaper"></i></span>마케팅
							<span class="category__btn transparent-btn" title="Open list">
								<span class="sr-only">Open list</span> <span
								class="icon arrow-down" aria-hidden="true"></span>
						</span>
					</a>
						<ul class="cat-sub-menu">
							<li><a href="/pages.html">배너/아이콘</a></li>
							<li><a href="/new-page.html">구독</a></li>
							<li><a href="/new-page.html">쿠폰</a></li>
							<li><a href="/new-page.html">이벤트 관리</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- 가장 하단 아이콘 -->
		<div class="sidebar-footer">
			<a href="##" class="sidebar-user"> <span class="sidebar-user-img">
					<picture>
					<source srcset="/img/avatar/avatar-illustrated-01.webp"
						type="image/webp">
					<img src="/img/avatar/avatar-illustrated-01.png" alt="User name">
					</picture>
			</span>
				<div class="sidebar-user-info">
					<span class="sidebar-user__title">Nafisa Sh.</span> <span
						class="sidebar-user__subtitle">Support manager</span>
				</div>
			</a>
		</div>
	</aside>