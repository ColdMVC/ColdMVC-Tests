/**
 * @extends RoutingBaseTest
 */
component {

	public void function testGenerator() {

		var route = createRoute("/post/:id", {
			params = {
				module = "default",
				controller = "post",
				action = "show"
			},
			generator = "test.routing.com.PostGenerator"
		});
		
		var post = new test.routing.com.Post();
		post.setSlug("this-is-a-test");

		assertRouteGeneratesPath(route, "/post/this-is-a-test", {
			id = post
		});

	}

}