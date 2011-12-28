/**
 * @extends coldmvc.test.mxunit.TestCase
 */
component {

	private any function createPage(struct data) {

		if (!structKeyExists(arguments, "data")) {
			arguments.data = {};
		}

		var page = new coldmvc.navigation.Page(arguments.data);
		page.setControllerManager(getControllerManager());
		page.setRouter(getRouter());
		page.setRequestManager(getRequestManager());

		return page;

	}

	private any function getContainer(string configPath="/test/navigation/config/navigation-attributes.xml") {

		if (arguments.configPath != "") {
			arguments.configPath = expandPath(arguments.configPath);
		}

		var container = new coldmvc.navigation.Container({
			router = getRouter(),
			requestManager = getRequestManager()
		});

		container.load(arguments.configPath);

		return container;

	}

	private any function getNavigation() {

		var navigation = new coldmvc.navigation.Navigation();
		var requestScope = new coldmvc.scopes.RequestScope();
		navigation.setRequestScope(requestScope);

		var coldmvc = {};
		coldmvc.struct = new coldmvc.app.helpers.Struct();

		var acl = new coldmvc.acl.ACL();
		navigation.setACL(acl);
		navigation.setColdMVC(coldmvc);

		return navigation;

	}

	private any function getRequestManager() {

		if (!structKeyExists(variables, "requestManager")) {
			var requestContext = new coldmvc.request.RequestContext();
			variables.requestManager = new coldmvc.request.RequestManager();
			variables.requestManager.setRequestContext(requestContext);
		}

		return variables.requestManager;

	}

	private any function getRequestContext() {

		return getRequestManager().getRequestContext();

	}

	private any function getRouter() {

		var router = new coldmvc.routing.Router();
		router.setRequestManager(getRequestManager());
		router.setBaseURL("");

		var routes = [ "foo", "bar", "baz" ];
		var i = "";

		for (i = 1; i <= arrayLen(routes); i++) {

			var route = routes[i];

			router.addRoute(new coldmvc.routing.Route("/#route#", {
				name = route,
				params = {
					module = "default",
					controller = route,
					action = "index"
				}
			}));

		}

		router.addRoute(new coldmvc.routing.Route("/:controller?/:action?", {
			params = {
				module = "default"
			},
			defaults = {
				controller = "index",
				action = "index"
			}
		}));

		return router;

	}

	private any function getControllerManager() {

		if (structKeyExists(variables, "controllerManager")) {
			return variables.controllerManager;
		}

		var controllerManager = new coldmvc.system.ControllerManager();
		var moduleManager = new coldmvc.system.ModuleManager();
		var fileSystem = new coldmvc.util.FileSystem();
		var pluginManager = new coldmvc.system.PluginManager("/config/plugins.cfm", fileSystem);
		var metaDataFlattener = new coldmvc.metadata.MetaDataFlattener();
		var templateManager = new coldmvc.rendering.TemplateManager();
		var framework = new coldmvc.Framework(expandPath("/config/../"), "coldmvc.");
		framework.onApplicationStart();

		var coldmvc = {};
		coldmvc.string = new coldmvc.app.helpers.String();

		controllerManager.setColdMVC(coldmvc);
		controllerManager.setFileSystem(fileSystem);
		controllerManager.setFramework(framework);
		controllerManager.setMetaDataFlattener(metaDataFlattener);
		controllerManager.setModuleManager(moduleManager);
		controllerManager.setTemplateManager(templateManager);

		moduleManager.setFileSystem(fileSystem);
		moduleManager.setPluginManager(pluginManager);

		variables.controllerManager = controllerManager;

		return controllerManager;

	}

}