/**
 * @extends test.navigation.TestCase
 */
component {

	public void function testEmptyContainer() {

		var container = getContainer("");
		assertEquals(0, arrayLen(container.getPages()));

	}

	public void function testLoadingContainerUsingNodes() {

		var container = getContainer("/test/navigation/config/navigation-nodes.xml");
		testContainer(container);

	}

	public void function testLoadingContainerUsingAttributes() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");
		testContainer(container);

	}

	public void function testFindBy() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");

		var page = container.findByLabel("Quick Start");
		assertEqualsCase("quickstart", page.getAction());

	}

	public void function testChainedFindBy() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");

		var page = container.findByLabel("Documentation").findByLabel("Reference Guide");
		// same as container.findByLabel("Documentation", "Reference Guide");

		assertEqualsCase("chapter", page.getController());

	}

	public void function testFindByWithMultipleArguments() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");

		var page = container.findByLabel("Documentation", "Reference Guide");
		// same as container.findByLabel("Documentation").findByLabel("Reference Guide");

		assertEqualsCase("chapter", page.getController());

	}

	public void function testDepth() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");

		assertEquals(0, container.getDepth());

		var page = container.findByLabel("Documentation");

		assertEquals(1, page.getDepth());

		page = container.findByLabel("Documentation", "Reference Guide");

		assertEquals(2, page.getDepth());

	}

	public void function testRemovePage() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");

		assertEqualsCase("Home", container.getPage(1).getLabel());

		container.removePage(1);

		assertEqualsCase("Download", container.getPage(1).getLabel());

	}

	public void function testIsActiveMVC() {

		var container = getContainer("/test/navigation/config/navigation-mvc.xml");

		var requestContext = getRequestContext();

		requestContext.populate({
			module = "default",
			controller = "qux",
			action = "index"
		});

		var page = container.findByLabel("Foo");
		assertFalse(page.isActive());

		page = container.findByLabel("Bar");
		assertTrue(page.isActive());

		page = container.findByLabel("Baz");
		assertFalse(page.isActive());

		page = container.findByLabel("Bar").findByLabel("Qux");
		assertTrue(page.isActive());

		page = container.findByLabel("Bar").findByLabel("Corge");
		assertFalse(page.isActive());

	}

	public void function testIsActivePath() {

		var container = getContainer("/test/navigation/config/navigation-paths.xml");

		var requestContext = getRequestContext();

		requestContext.populate({
			path = "/qux",
			module = "default",
			controller = "qux",
			action = "index"
		});

		var page = container.findByLabel("Foo");
		assertFalse(page.isActive());

		page = container.findByLabel("Bar");
		assertTrue(page.isActive());

		page = container.findByLabel("Baz");
		assertFalse(page.isActive());

		page = container.findByLabel("Bar").findByLabel("Qux");
		assertTrue(page.isActive());

		page = container.findByLabel("Bar").findByLabel("Corge");
		assertFalse(page.isActive());

	}

	public void function testIsActiveRoute() {

		var container = getContainer("/test/navigation/config/navigation-routes.xml");

		var requestContext = getRequestContext();

		requestContext.populate({
			routeName = "qux",
			module = "default",
			controller = "qux",
			action = "index"
		});

		var page = container.findByLabel("Foo");
		assertFalse(page.isActive());

		page = container.findByLabel("Bar");
		assertTrue(page.isActive());

		page = container.findByLabel("Baz");
		assertFalse(page.isActive());

		page = container.findByLabel("Bar").findByLabel("Qux");
		assertTrue(page.isActive());

		page = container.findByLabel("Bar").findByLabel("Corge");
		assertFalse(page.isActive());

	}

	public void function testIsVisible() {

		var container = getContainer("/test/navigation/config/navigation-attributes.xml");

		var page = container.findByLabel("Home");
		assertFalse(page.isVisible());

		page = container.findByLabel("Documentation");
		assertTrue(page.isVisible());

	}

	public void function testParams() {

		var container = getContainer("/test/navigation/config/navigation-params.xml");

		var pages = container.getPages();
		assertEquals(4, arrayLen(pages));

		var params = pages[1].getParams();
		assertTrue(structKeyExists(params, "foo"));
		assertEqualsCase("bar", params.foo);
		assertTrue(structKeyExists(params, "boo"));
		assertEqualsCase("baz", params.boo);

		params = pages[2].getParams();
		assertTrue(structKeyExists(params, "foo"));
		assertEqualsCase("bar", params.foo);
		assertTrue(structKeyExists(params, "boo"));
		assertEqualsCase("baz", params.boo);

		params = pages[3].getParams();
		assertTrue(structKeyExists(params, "foo"));
		assertEqualsCase("bar", params.foo);
		assertTrue(structKeyExists(params, "boo"));
		assertEqualsCase("baz", params.boo);

		params = pages[4].getParams();
		assertTrue(structKeyExists(params, "foo"));
		assertEqualsCase("bar", params.foo);
		assertTrue(structKeyExists(params, "boo"));
		assertEqualsCase("baz", params.boo);

	}

	private void function testContainer(required any container) {

		var pages = arguments.container.getPages();
		assertEquals(7, arrayLen(pages));

		assertEqualsCase("Home", pages[1].getLabel());
		assertEqualsCase("Download", pages[2].getLabel());
		assertEqualsCase("Quick Start", pages[3].getLabel());
		assertEqualsCase("Documentation", pages[4].getLabel());
		assertEqualsCase("Plugins", pages[5].getLabel());
		assertEqualsCase("Discussion", pages[6].getLabel());
		assertEqualsCase("Contact", pages[7].getLabel());

		assertEquals(0, arrayLen(pages[1].getPages()));
		assertEquals(0, arrayLen(pages[2].getPages()));
		assertEquals(0, arrayLen(pages[3].getPages()));
		assertEquals(5, arrayLen(pages[4].getPages()));
		assertEquals(1, arrayLen(pages[5].getPages()));
		assertEquals(0, arrayLen(pages[6].getPages()));
		assertEquals(0, arrayLen(pages[7].getPages()));

	}

}