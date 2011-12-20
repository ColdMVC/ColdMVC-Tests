/**
 * @extends test.navigation.TestCase
 */
component {

	public void function testModule() {

		var page = createPage();

		assertEqualsCase("default", page.getModule());

		var page = createPage({
			module = "admin"
		});

		assertEqualsCase("admin", page.getModule());

	}

	public void function testController() {

		var page = createPage();

		assertEqualsCase("index", page.getController());

		var page = createPage({
			controller = "user"
		});

		assertEqualsCase("user", page.getController());

	}

	public void function testAction() {

		var page = createPage();

		assertEqualsCase("index", page.getAction());

		var page = createPage({
			action = "edit"
		});

		assertEqualsCase("edit", page.getAction());

	}

	public void function testTitle() {

		var page = createPage({
			label = "Foo"
		});

		assertEqualsCase("Foo", page.getTitle());

		var page = createPage({
			label = "Foo",
			title = "Bar"
		});

		assertEqualsCase("Bar", page.getTitle());

	}

	public void function testAttributes() {

		var page = createPage();

		assertEqualsCase("", page.getAttribute("target"));

		var page = createPage({
			target = "_blank"
		});

		assertEqualsCase("_blank", page.getAttribute("target"));

	}

	public void function testOnMissingMethod() {

		var page = createPage();

		assertEqualsCase("Index", page.getResource());
		assertFalse(page.hasResource());

		assertEqualsCase("index", page.getPermission());
		assertFalse(page.hasPermission());

		var page = createPage({
			resource = "user",
			permission = "add"
		});

		assertEqualsCase("user", page.getResource());
		assertEqualsCase("user", page.getAttribute("resource"));
		assertTrue(page.hasResource());

		assertEqualsCase("add", page.getPermission());
		assertEqualsCase("add", page.getAttribute("permission"));
		assertTrue(page.hasPermission());

		assertFalse(page.hasFoo());

	}

	public void function testAttributesReturnVariables() {

		var page = createPage({
			label = "Foo"
		});

		assertEqualsCase("Foo", page.getTitle());
		assertEqualsCase("Foo", page.getAttribute("label"));

	}

	public void function testRouteParams() {

		var page = createPage({
			controller = "user",
			action = "show",
			params = {
				id = "12"
			}
		});

		var routeParams = page.getRouteParams();

		assertStructEquals({
			module = "default",
			controller = "user",
			action = "show",
			id = "12"
		}, routeParams);

	}

	public void function testDepth() {

		var page = createPage();

		assertEquals(0, page.getDepth());

	}

	public void function testRenderPage() {

		var container = getContainer();
		var pages = container.getPages();

		assertEquals(7, arrayLen(pages));

		assertEqualsCase("Home", pages[1].getLabel());
		assertEqualsCase("Download", pages[2].getLabel());
		assertEqualsCase("Quick Start", pages[3].getLabel());
		assertEqualsCase("Documentation", pages[4].getLabel());
		assertEqualsCase("Plugins", pages[5].getLabel());
		assertEqualsCase("Discussion", pages[6].getLabel());
		assertEqualsCase("Contact", pages[7].getLabel());

		var page = pages[1];
		assertEqualsCase('<a href="/" title="Home">Home</a>', page.render(), page.getLabel());

		page = pages[2];
		assertEqualsCase('<a href="/index/download" title="Download">Download</a>', page.render(), page.getLabel());

		page = pages[3];
		assertEqualsCase('<a href="/index/quickstart" title="Quick Start">Quick Start</a>', page.render(), page.getLabel());

		page = pages[4];
		assertEqualsCase('<a href="/index/documentation" title="Documentation">Documentation</a>', page.render(), page.getLabel());

		page = pages[5];
		assertEqualsCase('<a href="/plugin" title="Plugins">Plugins</a>', page.render(), page.getLabel());

		page = pages[6];
		assertEqualsCase('<a href="/discussion" title="Discussion">Discussion</a>', page.render(), page.getLabel());

		page = pages[7];
		assertEqualsCase('<a href="/index/contact" title="Contact">Contact</a>', page.render(), page.getLabel());

	}

	public void function testRenderPageMVC() {

		var container = getContainer("/test/navigation/config/navigation-mvc.xml");

		testRendering(container);

	}

	public void function testRenderPagePaths() {

		var container = getContainer("/test/navigation/config/navigation-paths.xml");

		testRendering(container);

	}

	public void function testRenderPageRoutes() {

		var container = getContainer("/test/navigation/config/navigation-routes.xml");

		testRendering(container);

	}

	private void function testRendering(required any container) {

		var pages = arguments.container.getPages();

		assertEquals(3, arrayLen(pages));

		assertEqualsCase("Foo", pages[1].getLabel());
		assertEqualsCase("Bar", pages[2].getLabel());
		assertEqualsCase("Baz", pages[3].getLabel());

		var page = pages[1];
		assertEqualsCase('<a href="/foo" title="Foo">Foo</a>', page.render(), page.getLabel());

		page = pages[2];
		assertEqualsCase('<a href="/bar" title="Bar">Bar</a>', page.render(), page.getLabel());

		page = pages[3];
		assertEqualsCase('<a href="/baz" title="Baz">Baz</a>', page.render(), page.getLabel());

	}

}