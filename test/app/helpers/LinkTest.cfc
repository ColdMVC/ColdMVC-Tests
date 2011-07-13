/**
 * @extends test.Base
 */
component {

	function beforeTests() {

		super.beforeTests();

		var routeHandler = beanFactory.getBean("routeHandler");

		routeHandler.setBaseURL("");

	}

	public function testBasic() {

		coldmvc.event.setModule("default");
		coldmvc.event.setController("index");
		coldmvc.event.setAction("index");

		assertEquals($.link.to({}), "");
		assertEquals($.link.to({controller="index"}), "");
		assertEquals($.link.to({action="index"}), "");
		assertEquals($.link.to({controller="index", action="index"}), "");

		assertEquals($.link.to({controller="index", action="list"}), "/index/list");
		assertEquals($.link.to({action="list"}), "/index/list");

		assertEquals($.link.to({controller="user"}), "/user");
		assertEquals($.link.to({controller="user", action="index"}), "/user");
		assertEquals($.link.to({controller="user", action="list"}), "/user/list");

	}

	function testDefaultModule() {

		coldmvc.event.setModule("default");
		coldmvc.event.setController("index");
		coldmvc.event.setAction("index");

		assertEquals($.link.to({module="default"}), "");
		assertEquals($.link.to({module="default", controller="index"}), "");
		assertEquals($.link.to({module="default", action="index"}), "");
		assertEquals($.link.to({module="default", controller="index", action="index"}), "");

		assertEquals($.link.to({module="default", controller="index", action="list"}), "/index/list");
		assertEquals($.link.to({module="default", action="list"}), "/index/list");

		assertEquals($.link.to({module="default", controller="user"}), "/user");
		assertEquals($.link.to({module="default", controller="user", action="index"}), "/user");
		assertEquals($.link.to({module="default", controller="user", action="list"}), "/user/list");

	}

	function testEmptyModule() {

		coldmvc.event.setModule("default");
		coldmvc.event.setController("index");
		coldmvc.event.setAction("index");

		assertEquals($.link.to({module=""}), "");
		assertEquals($.link.to({module="", controller="index"}), "");
		assertEquals($.link.to({module="", action="index"}), "");
		assertEquals($.link.to({module="", controller="index", action="index"}), "");

		assertEquals($.link.to({module="", controller="index", action="list"}), "/index/list");
		assertEquals($.link.to({module="", action="list"}), "/index/list");

		assertEquals($.link.to({module="", controller="user"}), "/user");
		assertEquals($.link.to({module="", controller="user", action="index"}), "/user");
		assertEquals($.link.to({module="", controller="user", action="list"}), "/user/list");

	}

	function testCustomModule() {

		coldmvc.event.setModule("default");
		coldmvc.event.setController("index");
		coldmvc.event.setAction("index");

		assertEquals($.link.to({module="admin"}), "/admin");
		assertEquals($.link.to({module="admin", controller="index"}), "/admin");
		assertEquals($.link.to({module="admin", action="index"}), "/admin");
		assertEquals($.link.to({module="admin", controller="index", action="index"}), "/admin");

		assertEquals($.link.to({module="admin", controller="index", action="list"}), "/admin/index/list");
		assertEquals($.link.to({module="admin", action="list"}), "/admin/index/list");

		assertEquals($.link.to({module="admin", controller="user"}), "/admin/user");
		assertEquals($.link.to({module="admin", controller="user", action="index"}), "/admin/user");
		assertEquals($.link.to({module="admin", controller="user", action="list"}), "/admin/user/list");

	}

	public function testBasicInsideModule() {

		coldmvc.event.setModule("admin");
		coldmvc.event.setController("user");
		coldmvc.event.setAction("list");

		assertEquals($.link.to({}), "/admin");
		assertEquals($.link.to({controller="index"}), "/admin");
		assertEquals($.link.to({action="index"}), "/admin/user");
		assertEquals($.link.to({controller="index", action="index"}), "/admin");

		assertEquals($.link.to({controller="index", action="list"}), "/admin/index/list");
		assertEquals($.link.to({action="list"}), "/admin/user/list");

		assertEquals($.link.to({controller="user"}), "/admin/user");
		assertEquals($.link.to({controller="user", action="index"}), "/admin/user");
		assertEquals($.link.to({controller="user", action="list"}), "/admin/user/list");

	}

	function testDefaultModuleInsideModule() {

		coldmvc.event.setModule("admin");
		coldmvc.event.setController("user");
		coldmvc.event.setAction("list");

		assertEquals($.link.to({module="default"}), "");
		assertEquals($.link.to({module="default", controller="index"}), "");
		assertEquals($.link.to({module="default", action="index"}), "/user");
		assertEquals($.link.to({module="default", controller="index", action="index"}), "");

		assertEquals($.link.to({module="default", controller="index", action="list"}), "/index/list");
		assertEquals($.link.to({module="default", action="list"}), "/user/list");

		assertEquals($.link.to({module="default", controller="user"}), "/user");
		assertEquals($.link.to({module="default", controller="user", action="index"}), "/user");
		assertEquals($.link.to({module="default", controller="user", action="list"}), "/user/list");

	}

	function testEmptyModuleInsideModule() {

		coldmvc.event.setModule("admin");
		coldmvc.event.setController("user");
		coldmvc.event.setAction("list");

		assertEquals($.link.to({module=""}), "");
		assertEquals($.link.to({module="", controller="index"}), "");
		assertEquals($.link.to({module="", action="index"}), "/user");
		assertEquals($.link.to({module="", controller="index", action="index"}), "");

		assertEquals($.link.to({module="", controller="index", action="list"}), "/index/list");
		assertEquals($.link.to({module="", action="list"}), "/user/list");

		assertEquals($.link.to({module="", controller="user"}), "/user");
		assertEquals($.link.to({module="", controller="user", action="index"}), "/user");
		assertEquals($.link.to({module="", controller="user", action="list"}), "/user/list");

	}

	function testCustomModuleInsideModule() {

		coldmvc.event.setModule("admin");
		coldmvc.event.setController("user");
		coldmvc.event.setAction("list");

		assertEquals($.link.to({module="admin"}), "/admin");
		assertEquals($.link.to({module="admin", controller="index"}), "/admin");
		assertEquals($.link.to({module="admin", action="index"}), "/admin/user");
		assertEquals($.link.to({module="admin", controller="index", action="index"}), "/admin");

		assertEquals($.link.to({module="admin", controller="index", action="list"}), "/admin/index/list");
		assertEquals($.link.to({module="admin", action="list"}), "/admin/user/list");

		assertEquals($.link.to({module="admin", controller="user"}), "/admin/user");
		assertEquals($.link.to({module="admin", controller="user", action="index"}), "/admin/user");
		assertEquals($.link.to({module="admin", controller="user", action="list"}), "/admin/user/list");

	}

	function testCustomModuleInsideOtherModule() {

		coldmvc.event.setModule("admin");
		coldmvc.event.setController("user");
		coldmvc.event.setAction("list");

		assertEquals($.link.to({module="cms"}), "/cms");
		assertEquals($.link.to({module="cms", controller="index"}), "/cms");
		assertEquals($.link.to({module="cms", action="index"}), "/cms/user");
		assertEquals($.link.to({module="cms", controller="index", action="index"}), "/cms");

		assertEquals($.link.to({module="cms", controller="index", action="list"}), "/cms/index/list");
		assertEquals($.link.to({module="cms", action="list"}), "/cms/user/list");

		assertEquals($.link.to({module="cms", controller="user"}), "/cms/user");
		assertEquals($.link.to({module="cms", controller="user", action="index"}), "/cms/user");
		assertEquals($.link.to({module="cms", controller="user", action="list"}), "/cms/user/list");

	}

}