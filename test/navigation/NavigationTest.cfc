/**
 * @extends test.navigation.TestCase
 */
component {

	public void function testMenu() {

		var requestContext = getRequestContext();

		requestContext.populate({
			module = "default",
			controller = "tag",
			action = "index"
		});

		var container = getContainer("/test/navigation/config/navigation-deep.xml");
		var navigation = getNavigation();

		navigation.setOptions({
			menu = {
				class = "tabs"
			}
		});

		var menu = navigation.renderMenu({
			navigation = container
		});

		assertStringContainsCountEquals(4, "<ul>", menu);

	}

	public void function testMenuMinDepth() {

		var requestContext = getRequestContext();

		requestContext.populate({
			module = "default",
			controller = "tag",
			action = "index"
		});

		var container = getContainer("/test/navigation/config/navigation-deep.xml");
		var navigation = getNavigation();

		var menu = navigation.renderMenu({
			navigation = container,
			minDepth = 2,
			maxDepth = 2
		});

		assertStringContainsCountEquals(1, "</ul>", menu);
		assertStringContainsCountEquals(5, "</li>", menu);
		assertTrue(findNoCase('href="/annotation/documentation"', menu));
		assertTrue(findNoCase('href="/chapter"', menu));
		assertTrue(findNoCase('href="/annotation"', menu));
		assertTrue(findNoCase('href="/helper"', menu));
		assertTrue(findNoCase('href="/tag"', menu));

	}

	public void function testMenuMinDepthEmpty() {

		var requestContext = getRequestContext();

		requestContext.populate({
			module = "default",
			controller = "index",
			action = "index"
		});

		var container = getContainer("/test/navigation/config/navigation-deep.xml");
		var navigation = getNavigation();

		var menu = navigation.renderMenu({
			navigation = container,
			minDepth = 2,
			maxDepth = 2
		});

		assertEquals("", menu);

	}

	public void function testBreadcrumbs() {

		var requestContext = getRequestContext();

		requestContext.populate({
			module = "default",
			controller = "tag",
			action = "index"
		});

		var container = getContainer("/test/navigation/config/navigation-deep.xml");
		var navigation = getNavigation();

		navigation.setOptions({
			breadcrumbs = {
				class = "breadcrumb"
			}
		});

		var breadcrumbs = navigation.renderBreadcrumbs({
			navigation = container
		});

		assertStringContainsCountEquals(2, "</li>", breadcrumbs);
		assertStringContainsCountEquals(1, '<span class="divider">/</span>', breadcrumbs);
		assertTrue(findNoCase('href="/index/documentation"', breadcrumbs));
		assertTrue(findNoCase('href="/tag"', breadcrumbs));

	}

}