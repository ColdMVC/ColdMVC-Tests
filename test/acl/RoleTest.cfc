/**
 * @extends test.acl.TestCase
 */
component {

	public void function testGetRoleID() {

		var acl = getACL();

		assertEquals("simple", acl.getRoleID("simple"));

		var admin = new test.acl.com.role.Admin();
		assertEquals("admin-role", acl.getRoleID(admin));

		var guest = new test.acl.com.role.Guest();
		assertEquals("guest", acl.getRoleID(guest));

		var supervisor = new test.acl.com.role.Supervisor();
		assertEquals("supervisor-role", acl.getRoleID(supervisor));

		var manager = new test.acl.com.role.Manager();
		var role = new test.acl.com.role.ManagerRole();
		manager.setRole(role);
		assertEquals("manager-role", acl.getRoleID(manager));

		var user = new test.acl.com.role.User();
		var role = new test.acl.com.role.UserRole();
		user.setRole(role);
		assertEquals("user-role", acl.getRoleID(user));

	}

	public void function testRoles() {

		var acl = getACL();

		acl.addRole("admin");
		assertEquals(1, structCount(acl.getRoles()));
		assertTrue(acl.hasRole("admin"));

		var role = acl.getRole("admin");
		assertTrue(isStruct(role));
		assertEquals(4, structCount(role));
		assertTrue(structKeyExists(role, "id"));
		assertTrue(structKeyExists(role, "name"));
		assertTrue(structKeyExists(role, "value"));
		assertTrue(structKeyExists(role, "instance"));
		assertEquals(role.id, "admin");
		assertEquals(role.name, "admin");

		assertTrue(structKeyExists(role, "id"));
		assertTrue(isSimpleValue(role.id));
		assertEquals("admin", role.id);

		assertTrue(structKeyExists(role, "value"));
		assertTrue(isSimpleValue(role.value));
		assertEquals("admin", role.value);

		assertTrue(structKeyExists(role, "instance"));
		assertTrue(isObject(role.instance));

		acl.addRole("member");
		assertEquals(2, structCount(acl.getRoles()));
		assertTrue(acl.hasRole("member"));

		acl.addRole("guest");
		assertEquals(3, structCount(acl.getRoles()));
		assertTrue(acl.hasRole("guest"));

		acl.removeRole("admin");
		assertEquals(2, structCount(acl.getRoles()));
		assertFalse(acl.hasRole("admin"));

		acl.addRoles("editor, lead");
		assertEquals(4, structCount(acl.getRoles()));
		assertTrue(acl.hasRole("editor"));
		assertTrue(acl.hasRole("lead"));

		acl.addRoles([ "supervisor", "manager", "boss" ]);
		assertEquals(7, structCount(acl.getRoles()));
		assertTrue(acl.hasRole("supervisor"));
		assertTrue(acl.hasRole("manager"));
		assertTrue(acl.hasRole("boss"));

		acl.removeRoles("editor, lead");
		assertEquals(5, structCount(acl.getRoles()));
		assertFalse(acl.hasRole("editor"));
		assertFalse(acl.hasRole("lead"));

		acl.removeRoles([ "supervisor", "manager", "boss" ]);
		assertEquals(2, structCount(acl.getRoles()));
		assertFalse(acl.hasRole("supervisor"));
		assertFalse(acl.hasRole("manager"));
		assertFalse(acl.hasRole("boss"));

		acl.clearRoles();
		assertEquals(0, structCount(acl.getRoles()));

	}

}