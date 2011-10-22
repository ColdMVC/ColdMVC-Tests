/**
 * @extends RoutingBaseTest
 */
component {

	public void function testGenerates() {

		var router = getRouter();

		router.addRoute(createRoute("/:controller/:action/:id", {
			params = {
				module = "default"
			}
		}));

		router.addRoute(createRoute("/:controller/:action", {
			params = {
				module = "default"
			},
			defaults = {
				action = "index"
			}
		}));

		router.addRoute(createRoute("/:controller", {
			params = {
				module = "default",
				action = "index"
			}
		}));

		assertRouterGenerates(router, "/user/edit/1.json", {
			module = "default",
			controller = "user",
			action = "edit",
			id = "1",
			format = "json"
		});

		assertRouterGenerates(router, "/user/edit/1", {
			module = "default",
			controller = "user",
			action = "edit",
			id = "1"
		});

		assertRouterGenerates(router, "/user/edit.json", {
			module = "default",
			controller = "user",
			action = "edit",
			format = "json"
		});

		assertRouterGenerates(router, "/user/list", {
			module = "default",
			controller = "user",
			action = "list"
		});

		assertRouterGenerates(router, "/user.json", {
			module = "default",
			controller = "user",
			format = "json"
		});

		assertRouterGenerates(router, "/user", {
			controller = "user",
			action = "index"
		});

	}

	public void function testDefaultRoutes() {

		var router = getDefaultRouter();

		assertRouterGenerates(router, "/", { });
		assertRouterGenerates(router, "/", { controller = "index" });
		assertRouterGenerates(router, "/", { controller = "index", action = "index" });
		assertRouterGenerates(router, "/index.json", { controller = "index", format = "json" });
		assertRouterGenerates(router, "/user", { controller = "user" });
		assertRouterGenerates(router, "/user", { controller = "user", action = "index" });
		assertRouterGenerates(router, "/user.json", { controller = "user", format = "json" });
		assertRouterGenerates(router, "/user/list", { controller = "user", action = "list" });
		assertRouterGenerates(router, "/user/list.json", { controller = "user", action = "list", format="json" });
		assertRouterGenerates(router, "/user/show/1", { controller = "user", action = "show", id = "1" });
		assertRouterGenerates(router, "/user/show/1.json", { controller = "user", action = "show", id = "1", format = "json" });
		assertRouterGenerates(router, "/index/list", { action = "list" });
		assertRouterGenerates(router, "/index/list.json", { action = "list", format = "json" });
		assertRouterGenerates(router, "/index/show/1", { action = "show", id = "1" });
		assertRouterGenerates(router, "/index/show/1.json", { action = "show", id = "1", format = "json" });
		assertRouterGenerates(router, "/index/index/1", { id = "1" });
		assertRouterGenerates(router, "/index/index/1.json", { id = "1", format = "json" });
		assertRouterGenerates(router, "/index.json", { format = "json" });

	}

	public void function testGeneratesQueryString() {

		var router = getRouter();

		router.addRoute(createRoute("/:controller/:action", {
			params = {
				module = "default"
			}
		}));

		assertRouterGenerates(router, "/user/list?order=asc&page=3&sort=name", {
			module = "default",
			controller = "user",
			action = "list",
			page = "3",
			sort = "name",
			order = "asc"
		});

	}

	public void function testRouteParams() {

		var router = getDefaultRouter();

		setRouteParams({
			module = "admin",
			controller = "user",
			action = "list"
		});

		assertRouterGenerates(router, "/admin", { controller = "index" });

	}

}