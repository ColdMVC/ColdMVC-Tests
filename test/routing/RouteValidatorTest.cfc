/**
 * @extends RoutingBaseTest
 */
component {

	public void function testGenerator() {

		var route = createRoute("/post/:id");

		assertRouteMatches(route, "/post/success");
		assertRouteMatches(route, "/post/failure");

		var route = createRoute("/post/:id", {
			validator = "test.routing.com.PostValidator"
		});

		assertRouteMatches(route, "/post/success");
		assertNotRouteMatches(route, "/post/failure");

	}

}