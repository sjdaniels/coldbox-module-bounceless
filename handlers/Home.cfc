component {
	
	function index( event, rc, prc ){
		if (event.valueExists("email")) {
			prc.result = getInstance("Bounceless@bounceless").checkOne(rc.email);
		}

		event.setView( "home/index" );
	}

}
