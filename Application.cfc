component {

	this.name = "tests";
	this.mappings["/tests"] = getDirectoryFromPath(getCurrentTemplatePath());

	this.datasource = "tests";
	this.ormEnabled = true;

	this.ormSettings = {
		dbcreate = "update",
		flushAtRequestEnd = false
	};

	function onRequestStart() {

		ormReload();

	}

}