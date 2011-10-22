component {

	public any function init() {

		return this;

	}

	public any function new(required string classPath) {

		var object = createObject("component", arguments.classPath);

		if (structKeyExists(object, "init")) {
			object.init();
		}

		if (structKeyExists(object, "setBeanFactory")) {
			object.setBeanFactory(this);
		}

		return object;

	}

}