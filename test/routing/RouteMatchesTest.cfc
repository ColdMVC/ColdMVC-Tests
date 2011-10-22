/**
 * @extends RoutingBaseTest
 */
component {

	public void function testEmpty() {

		var route = createRoute("/");

		assertRouteMatches(route, "/");

		assertNotRouteMatches(route, "/user/show/1");
		assertNotRouteMatches(route, "/user/show");
		assertNotRouteMatches(route, "/user.json");

	}

	public void function testController() {

		var route = createRoute("/:controller");

		assertRouteMatches(route, "/user");
		assertRouteMatches(route, "/user-list");
		assertRouteMatches(route, "/user_list");
		assertRouteMatches(route, "/user.json");

		assertNotRouteMatches(route, "/user/show/1");
		assertNotRouteMatches(route, "/user/show/all");
		assertNotRouteMatches(route, "/user_list/show_users/all_users");
		assertNotRouteMatches(route, "/user-list/show-users/all-users");
		assertNotRouteMatches(route, "/user/show/1/all");
		assertNotRouteMatches(route, "/user/show/1.json");
		assertNotRouteMatches(route, "/user/show");
		assertNotRouteMatches(route, "/");

	}

	public void function testControllerAction() {

		var route = createRoute("/:controller/:action");

		assertRouteMatches(route, "/user/list");
		assertRouteMatches(route, "/user-list/list-list");
		assertRouteMatches(route, "/user_list/list_list");
		assertRouteMatches(route, "/user/list.json");

		assertNotRouteMatches(route, "/user/show/1");
		assertNotRouteMatches(route, "/user/show/all");
		assertNotRouteMatches(route, "/user_list/show_users/all_users");
		assertNotRouteMatches(route, "/user-list/show-users/all-users");
		assertNotRouteMatches(route, "/user/show/1/all");
		assertNotRouteMatches(route, "/user/show/1.json");
		assertNotRouteMatches(route, "/user");
		assertNotRouteMatches(route, "/");

	}

	public void function testControllerActionID() {

		var route = createRoute("/:controller/:action/:id");

		assertRouteMatches(route, "/user/show/1");
		assertRouteMatches(route, "/user/show/all");
		assertRouteMatches(route, "/user_list/show_users/all_users");
		assertRouteMatches(route, "/user-list/show-users/all-users");
		assertRouteMatches(route, "/user/show/1.json");

		assertNotRouteMatches(route, "/user/show/1/all");
		assertNotRouteMatches(route, "/user/show");
		assertNotRouteMatches(route, "/user");
		assertNotRouteMatches(route, "/");

	}

	public void function testControllerActionIDFormat() {

		var route = createRoute("/:controller/:action/:id");

		assertRouteMatches(route, "/user/show/1.json");
		assertRouteMatches(route, "/user/show/all.xml");
		assertRouteMatches(route, "/user_list/show_users/all_users.foo_bar");
		assertRouteMatches(route, "/user-list/show-users/all-users.foo-bar");

		assertNotRouteMatches(route, "/user/show/1/all/what");
		assertNotRouteMatches(route, "/user/show/1/all");
		assertNotRouteMatches(route, "/user/show");
		assertNotRouteMatches(route, "/user");
		assertNotRouteMatches(route, "/");

	}

	public void function testStatic() {

		var route = createRoute("/admin/:controller/edit");

		assertRouteMatches(route, "/admin/user/edit");
		assertRouteMatches(route, "/admin/foo/edit");
		assertNotRouteMatches(route, "/public/user/edit");
		assertNotRouteMatches(route, "/admin/user/edit/3");
		assertNotRouteMatches(route, "/admin/user/edit/3");

		route = createRoute("/:this/:is/:a/:long/test");

		assertRouteMatches(route, "/this/is/a/valid/test");
		assertNotRouteMatches(route, "/this-is-a-bad-a/test");
		assertNotRouteMatches(route, "/this/is/not/a/valid/test");

	}

	public void function testWildcard() {

		var route = createRoute("/:controller/:action/*");

		assertRouteMatches(route, "/user/list/all");
		assertRouteMatches(route, "/user/list/all/foo/bar");
		assertRouteMatches(route, "/user/list/");
		assertRouteMatches(route, "/user/list");
		assertRouteMatches(route, "/user/list/all.json");
		assertRouteMatches(route, "/user/list/all/foo/bar.json");

		assertNotRouteMatches(route, "/user");

		route = createRoute("/admin/:controller/:action/*");

		assertRouteMatches(route, "/admin/user/list/edit");
		assertRouteMatches(route, "/admin/user/list/edit/all");
		assertNotRouteMatches(route, "/public/list/edit");
		assertNotRouteMatches(route, "/public/user/list/edit/all");

	}

	public void function testGreedy() {

		var route = createRoute("/:address*");

		assertRouteMatches(route, "/about");
		assertRouteMatches(route, "/about-us");
		assertRouteMatches(route, "/products/show/3");
		assertRouteMatches(route, "/about.json");
		assertRouteMatches(route, "/products/edit/3.json");

		assertRouteMatches(route, "/about");
		assertRouteMatches(route, "/about-us");
		assertRouteMatches(route, "/products/show/3");

		assertNotRouteMatches(route, "/");

	}

	public void function testOptional() {

		var route = createRoute("/:controller/:action/:id?");

		assertRouteMatches(route, "/user/list");
		assertRouteMatches(route, "/user/show/3");
		assertRouteMatches(route, "/user/list.json");
		assertRouteMatches(route, "/user/show/3.json");

		assertNotRouteMatches(route, "/user");
		assertNotRouteMatches(route, "/user/list/page/3");

		route = createRoute("/:controller?/:action?/:id?");

		assertRouteMatches(route, "/user/show/3.json");
		assertRouteMatches(route, "/user/show/3");
		assertRouteMatches(route, "/user/list.json");
		assertRouteMatches(route, "/user/list");
		assertRouteMatches(route, "/user.json");
		assertRouteMatches(route, "/user");

		assertNotRouteMatches(route, "/user/list/page/2.json");
		assertNotRouteMatches(route, "/user/list/page/2");
		assertNotRouteMatches(route, "/");

	}

	public void function testRequirements() {

		var route = createRoute("/:controller", {
			requirements = {
				controller = "foo"
			}
		});

		assertRouteMatches(route, "/foo");
		assertNotRouteMatches(route, "/foobar");
		assertNotRouteMatches(route, "/foo-bar");
		assertNotRouteMatches(route, "/foo_bar");
		assertNotRouteMatches(route, "/bar");

		route = createRoute("/:controller/:action/:id", {
			requirements = {
				action = "show"
			}
		});

		assertRouteMatches(route, "/user/show/1");
		assertNotRouteMatches(route, "/user/edit/1");

		route = createRoute("/:controller/:action/:id", {
			requirements = {
				action = "add|edit"
			}
		});

		assertRouteMatches(route, "/user/add/1");
		assertRouteMatches(route, "/user/edit/1");
		assertNotRouteMatches(route, "/user/show/1");

		route = createRoute("/:controller/:action/:id", {
			requirements = {
				id = "\d+"
			}
		});

		assertRouteMatches(route, "/user/add/1");
		assertRouteMatches(route, "/user/edit/10");
		assertRouteMatches(route, "/user/edit/10000");
		assertNotRouteMatches(route, "/user/edit/1-0");
		assertNotRouteMatches(route, "/user/edit/all");

	}

}