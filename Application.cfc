/**
 * @extends coldmvc.Application
 */
component {

	rootPath = getDirectoryFromPath(getCurrentTemplatePath());

	this.mappings["/test"] = rootPath & "test";

}