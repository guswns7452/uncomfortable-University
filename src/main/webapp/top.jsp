<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.6/flowbite.min.css"
	rel="stylesheet" />
<link href="<c:url value="/resource/top10.css"/>" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap"
	rel="stylesheet">
</head>


<body>
	<nav class="bg-white border-gray-200 dark:bg-gray-900">
		<div
			class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
			<a href="/uncomfortable/board" class="flex items-center"> <!-- ${pageContext.request.contextPath}/resources/views/CP_CoP_front/icon -->
				<div class="font-bold text-2xl" style="font-family: 'Oswald';">Uncomfortable
					University</div>
			</a>
			<div class="flex items-center md:order-2">
				<!-- 로그인 버튼 -->
				<c:choose>
					<c:when test="${sessionScope.user eq null}">
						<a href="/uncomfortable/user/login">
							<button type="button"
								class="text-white bg-gradient-to-br from-pink-500 to-orange-400 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">로그인</button>
						</a>
					</c:when>
					<c:otherwise>
						<button type="button"
							class="flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600"
							id="user-menu-button" aria-expanded="false"
							data-dropdown-toggle="user-dropdown"
							data-dropdown-placement="bottom">
							<span class="sr-only">Open user menu</span> <img
								class="w-8 h-8 rounded-full background_color_white"
								src="<c:url value="/resource/OtterDog.jpg"/>" alt="user photo">
						</button>
					</c:otherwise>
				</c:choose>
				<!-- Dropdown menu -->
				<div
					class="z-50 hidden my-4 text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow dark:bg-gray-700 dark:divide-gray-600"
					id="user-dropdown">
					<div class="px-4 py-3">
						<span class="block font-bold text-gray-900 dark:text-white">${user.id}</span>
						<span class="block text-sm text-gray-900 dark:text-white">${user.userName}</span>
						<span
							class="block text-sm  text-gray-500 truncate dark:text-gray-400">${user.studentId}</span>
					</div>
					<ul class="py-2" aria-labelledby="user-menu-button">
						<li><a href="/uncomfortable/user/mypage"
							class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Mypage</a>
						</li>
						<form class="hover:bg-gray-100 dark:hover:bg-gray-600"
							action="/uncomfortable/user/logout.do" method="post">
							<button type="submit"
								class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">
								Log out</button>
						</form>
					</ul>
				</div>
				<button data-collapse-toggle="navbar-user" type="button"
					class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
					aria-controls="navbar-user" aria-expanded="false">
					<span class="sr-only">Open main menu</span>
					<svg class="w-5 h-5" aria-hidden="true"
						xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
                        <path stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							d="M1 1h15M1 7h15M1 13h15" />
                    </svg>
				</button>
			</div>
			<!--  -->
			<div
				class="alignCenter items-center justify-between hidden w-full md:flex md:w-auto md:order-1"
				id="navbar-user">
				<ul style="margin-top: 0px;"
					class="flex flex-col font-medium p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
					<li><a href="/uncomfortable/board"
						class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700"
						aria-current="page">Home</a></li>
					<li><a href="/uncomfortable/board/top"
						class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500">Top
							10</a></li>
					<li><a href="/uncomfortable/user/mypage"
						class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">마이페이지</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="top10Title text-5xl font-bold">Top10</div>
	<div class="top10Content text-xl font-bold">학생들의 공감을 많이 받은 글을
		살펴보세요!</div>
	<div class="flexCenter">
		<!-- Text box 1 -->
		<c:forEach items="${boardListTop}" var="board" varStatus="i" begin="0"
			end="2">
			<div href="#"
				class="flexBlock block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
				<h5
					class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">${i.count}위</h5>
				<div style="display: none;" class="likeNumber">${board.likeNumber}</div>
				<div style="display: none;" class="dislikeNumber">${board.dislikeNumber}</div>
				<div style="display: none;" class="boardNumber">${board.boardNumber}</div>
				<h6
					class="mb-2 text-mi font-bold tracking-tight text-gray-900 dark:text-white">익명
					${board.boardNumber}</h6>
				<p class="font-normal text-gray-700 dark:text-gray-400">${board.content}</p>

				<!-- Like and dislike buttons with counters -->
				<div class="flex mt-2 justify-between">
					<div class="flex items-center">
						<button class="mr-2 p-2 bg-green-500 text-white rounded-md"
							onclick="likeComment(${i.count})">좋아요
							${board.likeNumber}</button>

					</div>
					<div class="flex items-center">
						<button class="p-2 bg-red-500 text-white rounded-md"
							onclick="dislikeComment(${i.count})">싫어요
							${board.dislikeNumber}</button>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<c:forEach items="${boardListTop}" var="board" varStatus="i" begin="3"
		end="9">
		<div class="flexList">
			<div style="display: none;" class="likeNumber">${board.likeNumber}</div>
			<div style="display: none;" class="dislikeNumber">${board.dislikeNumber}</div>
			<div style="display: none;" class="boardNumber">${board.boardNumber}</div>

			<div href="#"
				class="flexBlockList block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
				<h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">${i.index+1}위</h5>
				<h6 class="mb-2 text-mi font-bold tracking-tight text-gray-900 dark:text-white">익명 ${board.boardNumber}</h6>
				<p class="font-normal text-gray-700 dark:text-gray-400">${board.content}</p>


				<div class="flex mt-2 justify-between">
					<div class="flex items-center">
						<button class="mr-2 p-2 bg-green-500 text-white rounded-md"
							onclick="likeComment(${i.count})">좋아요 ${board.likeNumber}</button>

					</div>
					<div class="flex items-center">
						<button class="p-2 bg-red-500 text-white rounded-md"
							onclick="dislikeComment(${i.count})">싫어요 ${board.dislikeNumber}</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<script>
 // 좋아요 버튼 클릭 시 동작
    function likeComment(boardNumber) {
    	alert ('좋아요 반영되었습니다!');
    	
        // 서버로 좋아요 클릭을 전송
        fetch('/uncomfortable/board/like.do', { 
        	method: 'POST',
        	 cache: 'no-cache',
        	    headers: {
        	        'Content-Type': 'application/x-www-form-urlencoded'
        	    },
        	    body: 'boardNumber='+document.querySelectorAll(".boardNumber")[boardNumber-1].textContent+'&likeNumber='+document.querySelectorAll(".likeNumber")[boardNumber-1].textContent
        	})
            .then(response => response.json());    
            
        location.reload();
    }

    // 싫어요 버튼 클릭 시 동작
    function dislikeComment(boardNumber) {
        // 서버로 싫어요 클릭을 전송
		alert (' 싫어요 반영되었습니다!');
    	
        // 서버로 좋아요 클릭을 전송
        fetch('/uncomfortable/board/dislike.do', { 
        	method: 'POST',
        	 cache: 'no-cache',
        	    headers: {
        	        'Content-Type': 'application/x-www-form-urlencoded'
        	    },
        	    body: 'boardNumber='+document.querySelectorAll(".boardNumber")[boardNumber-1].textContent+'&dislikeNumber='+document.querySelectorAll(".dislikeNumber")[boardNumber-1].textContent
        	})
            .then(response => response.json());    
            
        location.reload();
    }
    </script>
</body>

</html>