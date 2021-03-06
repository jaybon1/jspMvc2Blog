<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">
	<form action="/blog/user?cmd=joinProc" method="post" class="was-validated" onsubmit="return validate()">
		<div class="form-group">
			<label for="username">Username:</label> <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" required>
			<button type="button" class="btn btn-info" onclick="usernameCheck()">아이디 중복확인</button>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="password">Password:</label> <input type="password" class="form-control" id="password" placeholder="Enter password" name="password" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="email">Email:</label> <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<div class="form-group">
			<label for="address">Address:</label> <input type="button" onClick="goPopup();" value="주소검색" class="btn btn-primary btn-sm" />
			<!-- 추가 -->

			<input type="text" class="form-control" id="address" placeholder="Enter address" name="address" required readonly>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>

		<button type="submit" class="btn btn-primary">회원가입</button>
	</form>
</div>

<script src="/blog/js/join.js"></script>

<%@include file="../include/footer.jsp"%>










