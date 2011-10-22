/**
 * @extends test.acl.TestCase
 */
component {

	public void function testEmptyACL() {

		var acl = getACL();

		assertTrue(isStruct(acl.getRoles()));
		assertEquals(0, structCount(acl.getRoles()));
		assertFalse(acl.hasRole("admin"));

		assertTrue(isStruct(acl.getResources()));
		assertEquals(0, structCount(acl.getResources()));
		assertFalse(acl.hasResource("book"));

	}

}