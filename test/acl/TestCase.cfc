/**
 * @extends mxunit.framework.TestCase
 */
component {

	private any function getACL() {

		var acl = new coldmvc.acl.ACL();
		var framework = new test.acl.com.mock.Framework();
		var beanFactory = new test.acl.com.mock.BeanFactory();
		framework.setApplication(beanFactory);
		acl.setFramework(framework);

		return acl;

	}

	private any function getPopulatedACL() {

		var acl = getACL();

		acl.addRole("Admin")
		   .addRole("Moderator")
		   .addRole("Editor")
		   .addRole("Member")
		   .addRole("Guest");

		acl.addResource("category")
		   .addResource("event")
		   .addResource("location")
		   .addResource("page")
		   .addResource("product")
		   .addResource("task")
		   .addResource("user");

		assertEquals(structCount(acl.getRoles()), 5);
		assertEquals(structCount(acl.getResources()), 7);

		return acl;

	}

}