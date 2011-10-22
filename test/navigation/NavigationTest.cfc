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