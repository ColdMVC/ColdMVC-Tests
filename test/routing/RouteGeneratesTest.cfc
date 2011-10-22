/**
 * @extends RoutingBaseTest
 */
component {

	public void function testGenerates() {

		var route = createRoute("/:controller/:action/:id", {
			params = {
				module = "default"
			}
		});

		assertRouteGenerates(route, {
			module = "default",
			controller = "user",
			action = "edit",
			id = "1"
		});

		assertRouteGenerates(route, {
			module = "default",
			controller = "user",
			action = "edit",
			id = "all"
		});

		assertRouteGenerates(route, {
			module = "default",
			controller = "user",
			action = "edit",
			id = "all",
			sort = "name",
			order = "asc"
		});

		assertRouteGenerates(route, {
			module = "default",
			controller = "user",
			action = "edit",
			id = "1",
			format = "xml"
		});

	}

	public void function testParams() {

		var route = createRoute("/post/:id", {
			params = {
				module = "default",
				controller = "blog",
				action = "show"
			}
		});

		assertRouteGenerates(route, {
			module = "default",
			controller = "blog",
			action = "show",
			id = "this-is-a-test"
		});

	}

	public void function testConflictingParams() {

		var route = createRoute("/post/:id", {
			params = {
				module = "default",
				controller = "blog",
				action = "show"
			}
		});

		assertNotRouteGenerates(route, {
			module = "default",
			controller = "foo",
			action = "bar",
			id = "this-is-a-test"
		});

	}

}