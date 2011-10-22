<cfscript>
requestContext = new coldmvc.request.RequestContext();
requestContext.setRouteParams({
	module = "admin",
	controller = "user",
	action = "list"
});

requestManager = new coldmvc.request.RequestManager();
requestManager.setRequestContext(requestContext);

router = new coldmvc.routing.Router();
router.setRequestManager(requestManager);
router.setBaseURL("");


router.addRoute(new coldmvc.routing.Route("/:module/:controller?/:action?/:id?", {
	requirements = {
		module = "admin|cms"
	},
	defaults = {
		controller = "index",
		action = "index"
	}
}));

router.addRoute(new coldmvc.routing.Route("/:controller?/:action?/:id?", {
	params = {
		module = "default"
	},
	defaults = {
		controller = "index",
		action = "index"
	}
}));

parameters = { module="default" };

path = router.generate(parameters);

writeDump(path);
abort;

</cfscript>