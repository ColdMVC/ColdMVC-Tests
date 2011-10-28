/**
 * @extends RoutingBaseTest
 */
component {

	public void function testGenerate() {

		var route = createRoute("/:controller/:action/:id", {
			params = {
				module = "default"
			}
		});

		assertRouteGeneratesPath(route, "/user/edit/1", {
			module = "default",
			controller = "user",
			action = "edit",
			id = 1
		});

	}

	public void function testStaticControllerActionID() {

		var route = createRoute("/admin/:controller/do/:action/:id");

		assertRouteGeneratesPath(route, "/admin/user/do/show/1", {
			controller = "user",
			action = "show",
			id = 1
		});

	}

	public void function testControllerActionIDFormat() {

		var route = createRoute("/:controller/:action/:id");

		assertRouteGeneratesPath(route, "/user/show/1.json", {
			controller = "user",
			action = "show",
			id = 1,
			format = "json"
		});

	}

	public void function testStaticControllerActionIDFormat() {

		var route = createRoute("/admin/:controller/do/:action/:id");

		assertRouteGeneratesPath(route, "/admin/user/do/show/1.json", {
			controller = "user",
			action = "show",
			id = 1,
			format = "json"
		});

	}

	public void function testWildcard() {

		var route = createRoute("/products/*");

		assertRouteGeneratesPath(route, "/products/order/asc/page/2/sort/name", {
			page = 2,
			sort = "name",
			order = "asc"
		});

		route = createRoute("/product/list/*");

		assertRouteGeneratesPath(route, "/product/list", { });

		assertRouteGeneratesPath(route, "/product/list/category//status/active", {
			category = "",
			status = "active"
		});

		route = createRoute("/product/list/*", {
			defaults = {
				status = "active",
				category = ""
			}
		});

		assertRouteGeneratesPath(route, "/product/list", {
			category = "",
			status = "active"
		});

		route = createRoute("/product/list/*", {
			defaults = {
				status = "",
				category = ""
			}
		});

		assertRouteGeneratesPath(route, "/product/list/status/active", {
			category = "",
			status = "active"
		});

	}

	public void function testOptional() {

		var route = createRoute("/:controller/:action/:id?");

		assertRouteGeneratesPath(route, "/user/list", {
			controller = "user",
			action = "list"
		});

		assertRouteGeneratesPath(route, "/user/list/1", {
			controller = "user",
			action = "list",
			id = 1
		});

		route = createRoute("/:controller/:action");

		assertRouteGeneratesPath(route, "/user/list.json", {
			controller = "user",
			action = "list",
			format = "json"
		});

		assertRouteGeneratesPath(route, "/user/list", {
			controller = "user",
			action = "list"
		});

	}

	public void function testGreedy() {

		var route = createRoute("/post/:category/:title*");

		assertRouteGeneratesPath(route, "/post/coldmvc/2011/09/30/coldmvc-routing", {
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

		assertRouteGeneratesPath(route, "/product/list/new//page/3/sort/category/status/active", {
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

		assertRouteGeneratesPath(route, "/posts", {
			page = 1
		});

		assertRouteGeneratesPath(route, "/posts/3", {
			page = 3
		});

	}

	public void function testQueryString() {

		var route = createRoute("/:controller/:action");

		assertRouteGeneratesPath(route, "/user/list?boo=baz&foo=bar", {
			controller = "user",
			action = "list",
			foo = "bar",
			boo = "baz"
		});

	}

	public void function testQueryStringToWildCard() {

		var route = createRoute("/:controller/:action/*");

		assertRouteGeneratesPath(route, "/user/list/boo/baz/foo/bar", {
			controller = "user",
			action = "list",
			foo = "bar",
			boo = "baz"
		});

	}

	public void function testParams() {

		var route = createRoute("/post/:id", {
			params = {
				controller = "blog",
				action = "show"
			}
		});

		assertRouteGeneratesPath(route, "/post/this-is-a-test", {
			controller = "blog",
			action = "show",
			id = "this-is-a-test"
		});

	}

}