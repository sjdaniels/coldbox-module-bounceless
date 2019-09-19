<h1 class="text-center">Bounceless API</h1>
<cfoutput>
<div class="row">
	<div class="col-sm-6 col-sm-offset-3">
		<form method="post" class="form-horizontal">
			<div class="panel panel-default">
				<div class="panel-body">
				    <input type="text" name="email" value="" placeholder="Enter email address" class="form-control" required>
				</div>
				<div class="panel-footer">
					<input type="submit" class="btn btn-success" value="Check Email">
				</div>
			</div>
		</form>
	</div>
</div>
<cfif event.privateValueExists("result")>
	<h2 class="text-center">#rc.email# is #prc.result.data.result_code#</h2>
	<cfdump var="#prc.result#" expand="false" label="Complete Result">
</cfif>
</cfoutput>
