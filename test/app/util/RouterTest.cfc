/**
 * @extends test.Base
 */
component {

	function beforeTests() {

		super.beforeTests();

		variables.router = beanFactory.getBean("router");

	}

	public function testRoutes() {

		var routes = variables.router.getRoutes();

		assertEquals(arrayLen(routes), 13);

	}

}