/**
 * @extends mxunit.framework.TestCase
 */
component {

	private any function getFramework() {

		return new coldmvc.system.Framework("E:\workspace\tests\");

	}

	public void function testRootPath() {

		var framework = getFramework();

		assertEquals("E:/workspace/tests/", framework.getRootPath());

	}

	public void function testMappings() {

		var framework = getFramework();

		assertIsStruct(framework.getMappings());

	}

	public void function testPluginManager() {

	}

}