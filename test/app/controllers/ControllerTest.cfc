/**
 * @extends coldmvc.test.mxunit.ControllerTestCase
 */
component {

	public void function testBasic() {

		var output = dispatchRequest("/");

		assertEqualsCase("Hello, world", output);

	}

	public void function testURLParam() {

		var output = dispatchRequest("/index/test_param?name=Tony");

		assertEqualsCase("Hello, my name is Tony", output);

	}

	public void function testPostParam() {

		setParams({
			name = "Anthony"
		});

		var output = dispatchRequest("/index/test_param");

	}

}