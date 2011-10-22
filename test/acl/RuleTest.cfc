/**
 * @extends test.acl.TestCase
 */
component {

	public void function testAllowAll() {

		var acl = getPopulatedACL();

		acl.allow("admin");
		acl.allow("admin", "event", "edit");
		acl.deny("admin", "event", "delete");

		acl.deny("guest");
		acl.allow("guest", "event", "view");
		acl.allow("guest", "comment", "add");

		assertTrue(acl.isAllowed("admin", "product", "update"));
		assertTrue(acl.isAllowed("admin", "product", "update"));
		assertTrue(acl.isAllowed("admin", "event", "list"));
		assertTrue(acl.isAllowed("admin", "event", "edit"));
		assertFalse(acl.isAllowed("admin", "event", "delete"));

		assertFalse(acl.isAllowed("guest", "page"));
		assertFalse(acl.isAllowed("guest", "page", "add"));
		assertFalse(acl.isAllowed("guest", "event"));
		assertFalse(acl.isAllowed("guest", "event", "add"));
		assertTrue(acl.isAllowed("guest", "event", "view"));
		assertFalse(acl.isAllowed("guest", "comment"));
		assertFalse(acl.isAllowed("guest", "comment", "view"));
		assertTrue(acl.isAllowed("guest", "comment", "add"));

	}

	public void function testAllowResource() {

		var acl = getPopulatedACL();

		acl.allow("admin", "event");
		acl.deny("admin", "event", "delete");

		acl.deny("guest", "event");
		acl.allow("guest", "event", "view");
		acl.allow("guest", "comment", "add");

		assertFalse(acl.isAllowed("admin", "product", "update"));
		assertFalse(acl.isAllowed("admin", "product", "update"));
		assertTrue(acl.isAllowed("admin", "event", "list"));
		assertTrue(acl.isAllowed("admin", "event", "edit"));
		assertFalse(acl.isAllowed("admin", "event", "delete"));

		assertFalse(acl.isAllowed("guest", "page"));
		assertFalse(acl.isAllowed("guest", "page", "add"));
		assertFalse(acl.isAllowed("guest", "event"));
		assertFalse(acl.isAllowed("guest", "event", "add"));
		assertTrue(acl.isAllowed("guest", "event", "view"));
		assertFalse(acl.isAllowed("guest", "comment"));
		assertFalse(acl.isAllowed("guest", "comment", "view"));
		assertTrue(acl.isAllowed("guest", "comment", "add"));

	}

	public void function testDenyResource() {

		var acl = getPopulatedACL();

		assertFalse(acl.isAllowed("admin", "event", "view"));
		assertFalse(acl.isAllowed("admin", "event", "edit"));

		acl.allow("admin");

		assertTrue(acl.isAllowed("admin", "event", "view"));
		assertTrue(acl.isAllowed("admin", "event", "edit"));

		acl.deny("admin", "event", "edit");

		assertTrue(acl.isAllowed("admin", "event", "view"));
		assertFalse(acl.isAllowed("admin", "event", "edit"));

	}

	public void function testAssertionsAsStrings() {

		var acl = getPopulatedACL();

		acl.allow("admin", "event", "delete", "test.acl.com.assert.RoleIsAdmin");
		acl.allow("guest", "event", "delete", "test.acl.com.assert.RoleIsAdmin");

		assertTrue(acl.isAllowed("admin", "event", "delete"));
		assertFalse(acl.isAllowed("guest", "event", "delete"));

	}

	public void function testAssertionsAsObject() {

		var acl = getPopulatedACL();

		var assertion = new test.acl.com.assert.RoleIsAdmin();

		acl.allow("admin", "event", "delete", assertion);
		acl.allow("guest", "event", "delete", assertion);

		assertTrue(acl.isAllowed("admin", "event", "delete"));
		assertFalse(acl.isAllowed("guest", "event", "delete"));

	}

}