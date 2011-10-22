/**
 * @extends RoutingBaseTest
 */
component {

	public void function testRecognizes() {

		var router = getRouter();

		router.addRoute(createRoute("/:controller/:action/:id"));
		router.addRoute(createRoute("/:controller/:action"));
		router.addRoute(createRoute("/:controller"));

		assertRouterRecognizes(router, "/user/edit/1.json", "/:controller/:action/:id");
		assertRouterRecognizes(router, "/user/edit/1", "/:controller/:action/:id");
		assertRouterRecognizes(router, "/user/list.json", "/:controller/:action");
		assertRouterRecognizes(router, "/user/list", "/:controller/:action");
		assertRouterRecognizes(router, "/user.json", "/:controller");
		assertRouterRecognizes(router, "/user", "/:controller");

	}

}