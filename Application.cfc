component {

	this.name = "tests";
	this.root = getDirectoryFromPath(getCurrentTemplatePath());

	this.mappings = {
		"/app" = this.root & "app",
		"/config" = this.root & "config",
		"/mock" = this.root & "mock",
		"/test" = this.root & "test"
	};

	this.datasource = "tests";
	this.ormEnabled = true;

	this.ormSettings = {
		dbcreate = "update",
		eventHandler = "EventHandler",
		flushAtRequestEnd = false,
		saveMapping = true
	};

	this.sessionManagement = true;
	this.serverSideFormValidation = false;
	this.sessionTimeout = createTimeSpan(0, 2, 0, 0);

	function onRequestStart() {

		ormReload();

	}

}