/**
 * @extends test.acl.TestCase
 */
component {

	public void function testGetResourceID() {

		var acl = getACL();

		assertEquals("simple", acl.getResourceID("simple"));

		var book = new test.acl.com.resource.Book();
		assertEquals("book-resource", acl.getResourceID(book));

		var car = new test.acl.com.resource.Car();
		assertEquals("car", acl.getResourceID(car));

		var table = new test.acl.com.resource.Table();
		assertEquals("table-resource", acl.getResourceID(table));

		var game = new test.acl.com.resource.Game();
		var resource = new test.acl.com.resource.GameResource();
		game.setResource(resource);
		assertEquals("game-resource", acl.getResourceID(game));

		var event = new test.acl.com.resource.Event();
		var resource = new test.acl.com.resource.EventResource();
		event.setResource(resource);
		assertEquals("event-resource", acl.getResourceID(event));

	}

	public void function testResources() {

		var acl = getACL();

		acl.addResource("book");
		assertEquals(1, structCount(acl.getResources()));
		assertTrue(acl.hasResource("book"));

		var resource = acl.getResource("book");
		assertTrue(isStruct(resource));
		assertEquals(3, structCount(resource));

		assertTrue(structKeyExists(resource, "id"));
		assertTrue(isSimpleValue(resource.id));
		assertEquals("book", resource.id);

		assertTrue(structKeyExists(resource, "value"));
		assertTrue(isSimpleValue(resource.value));
		assertEquals("book", resource.value);

		assertTrue(structKeyExists(resource, "instance"));
		assertTrue(isObject(resource.instance));

		acl.addResource("product");
		assertEquals(2, structCount(acl.getResources()));
		assertTrue(acl.hasResource("product"));

		acl.addResource("category");
		assertEquals(3, structCount(acl.getResources()));
		assertTrue(acl.hasResource("category"));

		acl.removeResource("book");
		assertEquals(2, structCount(acl.getResources()));
		assertFalse(acl.hasResource("book"));

		acl.addResources("hat, glove");
		assertEquals(4, structCount(acl.getResources()));
		assertTrue(acl.hasResource("hat"));
		assertTrue(acl.hasResource("glove"));

		acl.addResources([ "shirt", "shoe", "hooded sweatshirt" ]);
		assertEquals(7, structCount(acl.getResources()));
		assertTrue(acl.hasResource("shirt"));
		assertTrue(acl.hasResource("shoe"));
		assertTrue(acl.hasResource("hooded sweatshirt"));

		acl.removeResources("hat, glove");
		assertEquals(5, structCount(acl.getResources()));
		assertFalse(acl.hasResource("hat"));
		assertFalse(acl.hasResource("glove"));

		acl.removeResources([ "shirt", "shoe", "hooded sweatshirt" ]);
		assertEquals(2, structCount(acl.getResources()));
		assertFalse(acl.hasResource("shirt"));
		assertFalse(acl.hasResource("shoe"));
		assertFalse(acl.hasResource("hooded sweatshirt"));

		acl.clearResources();
		assertEquals(0, structCount(acl.getResources()));

	}

}