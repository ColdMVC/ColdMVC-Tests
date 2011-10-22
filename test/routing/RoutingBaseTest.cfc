/**
 * @extends mxunit.framework.TestCase
 */
component {

	private any function getRouter(struct routeParams) {

		if (!structKeyExists(arguments, "routeParams")) {
			arguments.routeParams = {
				module = "default",
				controller = "index",
				action = "index"
			};
		}

		var requestContext = new coldmvc.request.RequestContext();
		requestContext.setRouteParams(arguments.routeParams);

		var requestManager = new coldmvc.request.RequestManager();
		requestManager.setRequestContext(requestContext);

		var router = new coldmvc.routing.Router();
		router.setBaseURL("");
		router.setRequestManager(requestManager);

		return router;

	}

	private any function setRouteParams(required struct routeParams) {

		var requestManager = new coldmvc.request.RequestManager();
		var requestContext = requestManager.getRequestContext();
		requestContext.setRouteParams(arguments.routeParams);

		return requestContext;

	}

	private any function getDefaultRouter() {

		var router = getRouter();

		router.addRoute(new coldmvc.routing.Route("/:module/:controller?/:action?/:id?", {
			requirements = {
				module = "admin|cms"
			},
			defaults = {
				controller = "index",
				action = "index"
			}
		}));

		router.addRoute(new coldmvc.routing.Route("/:controller?/:action?/:id?", {
			params = {
				module = "default"
			},
			defaults = {
				controller = "index",
				action = "index"
			}
		}));

		return router;

	}

	private any function createRoute(required string pattern, struct options) {

		if (!structKeyExists(arguments, "options")) {
			arguments.options = {};
		}

		var route = new coldmvc.routing.Route(arguments.pattern, arguments.options);

		return route;

	}

	private void function assertRouteMatches(required any route, required string path, boolean debug=false) {

		assertTrue(arguments.route.matches(arguments.path), "Path: #arguments.path#; Pattern: #route.getPattern()#");

	}

	private void function assertNotRouteMatches(required any route, required string path, boolean debug=false) {

		assertFalse(arguments.route.matches(arguments.path), arguments.path);

	}

	private void function assertRouteGenerates(required any route, required struct params, boolean debug=false) {

		assertTrue(arguments.route.generates(arguments.params), "Pattern: #route.getPattern()#; Parameters: #serializeJSON(arguments.params)#");

	}

	private void function assertNotRouteGenerates(required any route, required struct params, boolean debug=false) {

		assertFalse(arguments.route.generates(arguments.params), "Pattern: #route.getPattern()#; Parameters: #serializeJSON(arguments.params)#");

	}

	private void function assertRouteRouteParams(required any route, required string path, required struct expected, boolean debug=false) {

		assertRouteMatches(arguments.route, arguments.path);

		var routeParams = arguments.route.getRouteParams(arguments.path);

		assertIsStruct(routeParams, arguments.path);
		assertStructCount(routeParams, structCount(arguments.expected), arguments.path);

		var key = "";
		for (key in arguments.expected) {
			assertStructKeyEquals(routeParams, key, arguments.expected[key], arguments.path);
		}

	}

	private void function assertRouteAssembles(required any route, required string expected, required struct params, struct routeParams, boolean debug=false) {

		if (!structKeyExists(arguments, "routeParams")) {
			arguments.routeParams = {};
		}

		var assembled = arguments.route.assemble(arguments.params, arguments.routeParams);

		assertEqualsCase(arguments.expected, assembled);

	}

	private void function assertRouterRecognizes(required any router, required string path, required string expected, boolean debug=false) {

		var route = router.recognize(arguments.path);

		var pattern = route.getPattern();

		assertEqualsCase(arguments.expected, pattern, "Path: #arguments.path#");

	}

	private void function assertRouterGenerates(required any router, required string expected, required struct params, boolean debug=false) {

		var generated = router.generate(params=arguments.params);

		assertEqualsCase(arguments.expected, generated, "Parameters: #serializeJSON(arguments.params)#");

	}

	private void function assertIsStruct(required any value, string message="") {

		assertTrue(isStruct(arguments.value), arguments.message);

	}

	private void function assertStructCount(required struct struct, required string expected, string message="") {

		assertEquals(arguments.expected, structCount(arguments.struct), arguments.message);

	}

	private void function assertStructKeyExists(required struct struct, required string key, string message="") {

		assertTrue(structKeyExists(arguments.struct, arguments.key), arguments.message);

	}

	private void function assertStructKeyEquals(required struct struct, required string key, required any expected, string message="") {

		assertStructKeyExists(arguments.struct, arguments.key, arguments.message);

		assertEqualsCase(arguments.expected, arguments.struct[arguments.key], arguments.message);

	}

}