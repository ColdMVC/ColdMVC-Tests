/**
 * @extends RoutingBaseTest
 */
component {

	public void function testControllerActionID() {

		var route = createRoute("/:controller/:action/:id");

		assertRouteRouteParams(route, "/user/show/1", {
			controller = "user",
			action = "show",
			id = 1
		});

	}

	public void function testStaticControllerActionID() {

		var route = createRoute("/admin/:controller/do/:action/:id");

		assertRouteRouteParams(route, "/admin/user/do/show/1", {
			controller = "user",
			action = "show",
			id = 1
		});

	}

	public void function testControllerActionIDFormat() {

		var route = createRoute("/:controller/:action/:id");

		assertRouteRouteParams(route, "/user/show/1.json", {
			controller = "user",
			action = "show",
			id = 1,
			format = "json"
		});

	}

	public void function testStaticControllerActionIDFormat() {

		var route = createRoute("/admin/:controller/do/:action/:id");

		assertRouteRouteParams(route, "/admin/user/do/show/1.json", {
			controller = "user",
			action = "show",
			id = 1,
			format = "json"
		});

	}

	public void function testWildcard() {

		var route = createRoute("/products/*");

		assertRouteRouteParams(route, "/products/page/2/sort/name/order/asc", {
			page = 2,
			sort = "name",
			order = "asc"
		});

		route = createRoute("/product/list/*");

		assertRouteRouteParams(route, "/product/list", { });

		assertRouteRouteParams(route, "/product/list/category//status/active", {
			category = "",
			status = "active"
		});

		route = createRoute("/product/list/*", {
			defaults = {
				status = "active",
				category = ""
			}
		});

		assertRouteRouteParams(route, "/product/list", {
			category = "",
			status = "active"
		});

		route = createRoute("/product/list/*", {
			defaults = {
				status = "",
				category = ""
			}
		});

		assertRouteRouteParams(route, "/product/list/status/active", {
			category = "",
			status = "active"
		});

	}

	public void function testOptional() {

		var route = createRoute("/:controller/:action/:id?");

		assertRouteRouteParams(route, "/user/list", {
			controller = "user",
			action = "list"
		});

		assertRouteRouteParams(route, "/user/list/1", {
			controller = "user",
			action = "list",
			id = 1
		});

		route = createRoute("/:controller/:action");

		assertRouteRouteParams(route, "/user/list.json", {
			controller = "user",
			action = "list",
			format = "json"
		});

		assertRouteRouteParams(route, "/user/list", {
			controller = "user",
			action = "list"
		});

	}

	public void function testGreedy() {

		var route = createRoute("/post/:category/:title*");

		assertRouteRouteParams(route, "/post/coldmvc/2011/09/30/coldmvc-routing", {
			category = "coldmvc",
			title = "2011/09/30/coldmvc-routing"
		});

	}

	public void function testDefaults() {

		var route = createRoute("/product/list/*", {
			defaults = {
				sort = "name",
				order = "asc"
			}
		});

		assertRouteRouteParams(route, "/product/list/page/3/sort/category/status/active/new", {
			page = 3,
			sort = "category",
			order = "asc",
			status = "active",
			new = ""
		});

	}

	public void function testDefaultPlaceholder() {

		var route = createRoute("/posts/:page?", {
			defaults = {
				page = "1"
			}
		});

		assertRouteRouteParams(route, "/posts", {
			page = 1
		}, true);

		assertRouteRouteParams(route, "/posts/3", {
			page = 3
		});

	}

	public void function testAliases() {

		var route = createRoute("/post/:id", {
			params = {
				controller = "blog",
				action = "show"
			},
			aliases = {
				id = "slug"
			}
		});

		assertRouteRouteParams(route, "/post/this-is-a-test-post", {
			controller = "blog",
			action = "show",
			slug = "this-is-a-test-post"
		});

	}

}