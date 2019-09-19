component {

	property name="settings" inject="coldbox:moduleSettings:bounceless";

	public struct function checkOne(required string email) {
		/*
			ok: email is ok
			all is ok : of catch all emails is when the server is saying that it is ready to receive a letter to this address, and no trickshave been detected
			error - server: is saying that delivery failed, but no information about the email exists
			smtp_error: SMTP answer from the server is invalid, destination server reported an internal error to us.
			smtp_protocol: destination server allows us to connect, but SMTP session was closed before the email was verified.
			unknown_email: server saying that delivery failed, and the email does not exist.
			t_attempt_rejected: delivery failed, reason similar to “rejected".
			relay_error: delivery fail because a relaying problem took place.
			antispam_system: some anti-spam technology is blocking the verification progress.
			email_disabled: email account is suspended/disabled/limited and can't receive emails.
			domain_error: email server for the whole domain is not installed or is incorrect, so noemails are deliverable.
			ok_for_all: email server is saying that it is ready to accept letters to any email.
			dead_server: email server is dead, no connection to it exists.
			syntax_error: syntax error in email address.
			invalid_syntax: syntax error in email address.
			unknown: email delivery failed, but no information about why.
			invalid_mx : Could not get MX records for domain
		*/

		var params = {"email":arguments.email, "secret":settings.apiKey}
		var result = call("verifEmail",params);

		result.data = {"result_code":result.response.filecontent}
		result.params.secret = "********";

		return result;
	}

	private struct function call( required string path, required struct params, string method="get" ) {
		var result = {
			url:"#settings.baseURL#/#arguments.path#"
		,	method:arguments.method
		,	params:params
		,	data:{}
		,	response:{}
		};

		http url="#settings.baseURL#/#arguments.path#" method="#arguments.method#" result="result.response" timeout="10" {
			loop collection="#arguments.params#" item="local.param" {
				httpparam type="url" name="#local.param#" value="#arguments.params[local.param]#";
			}
		}

		return result;
	}

}