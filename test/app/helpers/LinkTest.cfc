/**
 * @extends coldmvc.test.mxunit.FrameworkTestCase
 */
component {

	function beforeTests() {

		super.beforeTests();

		var router = getFramework().getBean("router");

		router.setBaseURL("");

	}

	public function testBasic() {

		setRouteParams({
			module = "default",
			controller = "index",
			action = "index"
		});

		assertEquals("/", $.link.to({}));
		assertEquals("/", $.link.to({controller="index"}));
		assertEquals("/", $.link.to({action="index"}));
		assertEquals("/", $.link.to({controller="index", action="index"}));

		assertEquals("/index/list", $.link.to({controller="index", action="list"}));
		assertEquals("/index/list", $.link.to({action="list"}));

		assertEquals("/user", $.link.to({controller="user"}));
		assertEquals("/user", $.link.to({controller="user", action="index"}));
		assertEquals("/user/list", $.link.to({controller="user", action="list"}));

	}

	function testDefaultModule() {

		setRouteParams({
			module = "default",
			controller = "index",
			action = "index"
		});

		assertEquals("/", $.link.to({module="default"}));
		assertEquals("/", $.link.to({module="default", controller="index"}));
		assertEquals("/", $.link.to({module="default", action="index"}));
		assertEquals("/", $.link.to({module="default", controller="index", action="index"}));

		assertEquals("/index/list", $.link.to({module="default", controller="index", action="list"}));
		assertEquals("/index/list", $.link.to({module="default", action="list"}));

		assertEquals("/user", $.link.to({module="default", controller="user"}));
		assertEquals("/user", $.link.to({module="default", controller="user", action="index"}));
		assertEquals("/user/list", $.link.to({module="default", controller="user", action="list"}));

	}

	function testCustomModule() {

		setRouteParams({
			module = "default",
			controller = "index",
			action = "index"
		});

		assertEquals("/admin", $.link.to({module="admin"}));
		assertEquals("/admin", $.link.to({module="admin", controller="index"}));
		assertEquals("/admin", $.link.to({module="admin", action="index"}));
		assertEquals("/admin", $.link.to({module="admin", controller="index", action="index"}));

		assertEquals("/admin/index/list", $.link.to({module="admin", controller="index", action="list"}));
		assertEquals("/admin/index/list", $.link.to({module="admin", action="list"}));

		assertEquals("/admin/user", $.link.to({module="admin", controller="user"}));
		assertEquals("/admin/user", $.link.to({module="admin", controller="user", action="index"}));
		assertEquals("/admin/user/list", $.link.to({module="admin", controller="user", action="list"}));

	}

	public function testBasicInsideModule() {

		setRouteParams({
			module = "admin",
			controller = "user",
			action = "list"
		});

		assertEquals("/admin/user/list", $.link.to({}));
		assertEquals("/admin", $.link.to({controller="index"}));
		assertEquals("/admin/user", $.link.to({action="index"}));
		assertEquals("/admin", $.link.to({controller="index", action="index"}));

		assertEquals("/admin/index/list", $.link.to({controller="index", action="list"}));
		assertEquals("/admin/user/list", $.link.to({action="list"}));

		assertEquals("/admin/user/list", $.link.to({controller="user"}));
		assertEquals("/admin/user", $.link.to({controller="user", action="index"}));
		assertEquals("/admin/user/list", $.link.to({controller="user", action="list"}));

	}

	function testDefaultModuleInsideModule() {

		setRouteParams({
			module = "admin",
			controller = "user",
			action = "list"
		});

		assertEquals("/", $.link.to({module="default"}));
		assertEquals("/", $.link.to({module="default", controller="index"}));
		assertEquals("/", $.link.to({module="default", action="index"}));
		assertEquals("/", $.link.to({module="default", controller="index", action="index"}));

		assertEquals("/index/list", $.link.to({module="default", controller="index", action="list"}));
		assertEquals("/index/list", $.link.to({module="default", action="list"}));

		assertEquals("/user", $.link.to({module="default", controller="user"}));
		assertEquals("/user", $.link.to({module="default", controller="user", action="index"}));
		assertEquals("/user/list", $.link.to({module="default", controller="user", action="list"}));

	}

	function testCustomModuleInsideModule() {

		setRouteParams({
			module = "admin",
			controller = "user",
			action = "list"
		});

		assertEquals("/admin/user/list", $.link.to({module="admin"}));
		assertEquals("/admin", $.link.to({module="admin", controller="index"}));
		assertEquals("/admin/user", $.link.to({module="admin", action="index"}));
		assertEquals("/admin", $.link.to({module="admin", controller="index", action="index"}));

		assertEquals("/admin/index/list", $.link.to({module="admin", controller="index", action="list"}));
		assertEquals("/admin/user/list", $.link.to({module="admin", action="list"}));

		assertEquals("/admin/user/list", $.link.to({module="admin", controller="user"}));
		assertEquals("/admin/user", $.link.to({module="admin", controller="user", action="index"}));
		assertEquals("/admin/user/list", $.link.to({module="admin", controller="user", action="list"}));

	}

	function testCustomModuleInsideOtherModule() {

		setRouteParams({
			module = "admin",
			controller = "user",
			action = "list"
		});

		assertEquals("/cms", $.link.to({module="cms"}));
		assertEquals("/cms", $.link.to({module="cms", controller="index"}));
		assertEquals("/cms", $.link.to({module="cms", action="index"}));
		assertEquals("/cms", $.link.to({module="cms", controller="index", action="index"}));

		assertEquals("/cms/index/list", $.link.to({module="cms", controller="index", action="list"}));
		assertEquals("/cms/index/list", $.link.to({module="cms", action="list"}));

		assertEquals("/cms/user", $.link.to({module="cms", controller="user"}));
		assertEquals("/cms/user", $.link.to({module="cms", controller="user", action="index"}));
		assertEquals("/cms/user/list", $.link.to({module="cms", controller="user", action="list"}));

	}

}