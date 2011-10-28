component {
	
	public string function generate(required struct params, required struct routeParams, required struct attributes) {
		
		return "/post/#arguments.params.id.getSlug()#";
		
	}
	
}