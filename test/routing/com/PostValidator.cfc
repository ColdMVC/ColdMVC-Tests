component {

	public string function validate(required string path) {

		if (arguments.path == "/post/success") {
			return true;
		}

		return false;

	}

}