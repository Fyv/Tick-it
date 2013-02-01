<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main_lite" />
<title>Tick-it !</title>
</head>
<body>
	<div id='login'>
		<div class='container'>
			<div class="row">
				<div class="span3"></div>
				<div class=" well span5">
					<div class="row">
						<div class="span1"></div>
						<div class="span3">
							<div class="page-header">
								<h2 class='fheader'>
									<g:message code="springSecurity.login.header" />
								</h2>
							</div>
							<form action='${postUrl}' method='POST' id='loginForm'
								class='form-signin' autocomplete='off'>

								<p>
									<input type='text' class='text_' name='j_username'
										id='username'
										placeholder="<g:message
								code="springSecurity.login.username.label" />" />
								</p>

								<p>
									<input type='password' class='text_' name='j_password'
										id='password'
										placeholder="<g:message
								code="springSecurity.login.password.label" />" />
								</p>

								<p id="remember_me_holder">

									<label class="checkbox"> <input type='checkbox'
										class='chk' name='${rememberMeParameter}' id='remember_me'
										<g:if test='${hasCookie}'>checked='checked'</g:if> /> <g:message
											code="springSecurity.login.remember.me.label" />
									</label>
								</p>

								<p>
									<input type='submit' id="submit"
										class="btn btn-large btn-primary"
										value='${message(code: "springSecurity.login.button")}' />
								</p>
							</form>
						</div>
					</div>
					<g:if test='${flash.message}'>
						<div class='alert alert-error'>
							${flash.message}
						</div>
					</g:if>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'>
	<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
	// -->
	</script>
</body>
</html>
