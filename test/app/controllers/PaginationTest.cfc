/**
 * @extends coldmvc.test.mxunit.ControllerTestCase
 */
component {

	public void function testStatic() {

		var output = dispatchRequest("/pagination/static");

		assertTrue(findNoCase('/pagination/static?order=desc&sort=firstName" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=email">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2">2</a>', output));

	}

	public void function testStaticWithPage() {

		var output = dispatchRequest("/pagination/static?page=2");

		assertTrue(findNoCase('/pagination/static?order=desc&page=1&sort=firstName" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=email">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2" class="active">2</a>', output));

	}

	public void function testStaticWithSort() {

		var output = dispatchRequest("/pagination/static?sort=email&order=desc");

		assertTrue(findNoCase('/pagination/static?order=asc&sort=firstName">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=email" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1&order=desc&sort=email" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2&order=desc&sort=email">2</a>', output));

	}

	public void function testStaticWithPageAndSort() {

		var output = dispatchRequest("/pagination/static?page=2&sort=email&order=desc");

		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=firstName">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=email" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1&order=desc&sort=email">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2&order=desc&sort=email" class="active">2</a>', output));

	}

	public void function testStaticWithQueryString() {

		var output = dispatchRequest("/pagination/static?foo=bar");

		assertTrue(findNoCase('/pagination/static?order=desc&sort=firstName&foo=bar" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=lastName&foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=email&foo=bar">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1&foo=bar" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2&foo=bar">2</a>', output));

	}

	public void function testStaticWithPageAndQueryString() {

		var output = dispatchRequest("/pagination/static?page=2&foo=bar");

		assertTrue(findNoCase('/pagination/static?order=desc&page=1&sort=firstName&foo=bar" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=lastName&foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=email&foo=bar">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1&foo=bar">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2&foo=bar" class="active">2</a>', output));

	}

	public void function testStaticWithSortAndQueryString() {

		var output = dispatchRequest("/pagination/static?sort=email&order=desc&foo=bar");

		assertTrue(findNoCase('/pagination/static?order=asc&sort=firstName&foo=bar">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=lastName&foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&sort=email&foo=bar" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1&foo=bar&order=desc&sort=email" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2&foo=bar&order=desc&sort=email">2</a>', output));

	}

	public void function testStaticWithPageAndSortAndQueryString() {

		var output = dispatchRequest("/pagination/static?page=2&sort=email&order=desc&foo=bar");

		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=firstName&foo=bar">First Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=lastName&foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/static?order=asc&page=1&sort=email&foo=bar" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/static?page=1&foo=bar&order=desc&sort=email">1</a>', output));
		assertTrue(findNoCase('/pagination/static?page=2&foo=bar&order=desc&sort=email" class="active">2</a>', output));

	}

	public void function testPlaceholder() {

		var output = dispatchRequest("/pagination/placeholder");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/desc" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2">2</a>', output));

	}

	public void function testPlaceholderWithPage() {

		var output = dispatchRequest("/pagination/placeholder/2");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/desc" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2" class="active">2</a>', output));

	}

	public void function testPlaceholderWithSort() {

		var output = dispatchRequest("/pagination/placeholder?sort=email&order=desc");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/asc">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder?order=desc&sort=email" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2?order=desc&sort=email">2</a>', output));

	}

	public void function testPlaceholderWithPageAndSort() {

		var output = dispatchRequest("/pagination/placeholder/2/email/desc");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/asc">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder/1/email/desc">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2/email/desc" class="active">2</a>', output));

	}

	public void function testPlaceholderWithQueryString() {

		var output = dispatchRequest("/pagination/placeholder?foo=bar");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/desc?foo=bar" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc?foo=bar">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder?foo=bar" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2?foo=bar">2</a>', output));

	}

	public void function testPlaceholderWithPageAndQueryString() {

		var output = dispatchRequest("/pagination/placeholder/2?foo=bar");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/desc?foo=bar" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc?foo=bar">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder?foo=bar">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2?foo=bar" class="active">2</a>', output));

	}

	public void function testPlaceholderWithSortAndQueryString() {

		var output = dispatchRequest("/pagination/placeholder?sort=email&order=desc&foo=bar");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/asc?foo=bar">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc?foo=bar" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder?foo=bar&order=desc&sort=email" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2?foo=bar&order=desc&sort=email">2</a>', output));

	}

	public void function testPlaceholderWithPageAndSortAndQueryString() {

		var output = dispatchRequest("/pagination/placeholder/2/email/desc?foo=bar");

		assertTrue(findNoCase('/pagination/placeholder/1/firstName/asc?foo=bar">First Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/lastName/asc?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/1/email/asc?foo=bar" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/placeholder/1/email/desc?foo=bar">1</a>', output));
		assertTrue(findNoCase('/pagination/placeholder/2/email/desc?foo=bar" class="active">2</a>', output));

	}

	public void function testWildcard() {

		var output = dispatchRequest("/pagination/wildcard");

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/firstName" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/page/2">2</a>', output));

	}

	public void function testWildcardWithPage() {

		var output = dispatchRequest("/pagination/wildcard/page/2");

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/firstName" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/page/2" class="active">2</a>', output));

	}

	public void function testWildcardWithSort() {

		var output = dispatchRequest("/pagination/wildcard/sort/email/order/desc");

		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/firstName">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/email" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/desc/page/2/sort/email">2</a>', output));

	}

	public void function testWildcardWithPageAndSort() {

		var output = dispatchRequest("/pagination/wildcard/page/2/sort/email/order/desc");

		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/firstName">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/email">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/desc/page/2/sort/email" class="active">2</a>', output));

	}

	public void function testWildcardWithQueryString() {

		var output = dispatchRequest("/pagination/wildcard?foo=bar");

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/firstName?foo=bar" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email?foo=bar">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard?foo=bar" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/page/2?foo=bar">2</a>', output));

	}

	public void function testWildcardWithPageAndQueryString() {

		var output = dispatchRequest("/pagination/wildcard/page/2?foo=bar");

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/firstName?foo=bar" class="active">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email?foo=bar">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard?foo=bar">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/page/2?foo=bar" class="active">2</a>', output));

	}

	public void function testWildcardWithSortAndQueryString() {

		var output = dispatchRequest("/pagination/wildcard/sort/email/order/asc?foo=bar");

		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/firstName?foo=bar">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/email?foo=bar" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email?foo=bar" class="active">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/page/2/sort/email?foo=bar">2</a>', output));

	}

	public void function testWildcardWithPageAndSortAndQueryString() {

		var output = dispatchRequest("/pagination/wildcard/page/2/sort/email/order/desc?foo=bar");

		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/firstName?foo=bar">First Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/lastName?foo=bar">Last Name</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/asc/sort/email?foo=bar" class="active">Email</a>', output));

		assertTrue(findNoCase('/pagination/wildcard/order/desc/sort/email?foo=bar">1</a>', output));
		assertTrue(findNoCase('/pagination/wildcard/order/desc/page/2/sort/email?foo=bar" class="active">2</a>', output));

	}

}