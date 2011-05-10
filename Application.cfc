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

	function onRequestStart() {

		ormReload();

	}

}