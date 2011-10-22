component {

	public any function init() {

		return this;

	}

	public boolean function assert(required any acl, required any role, required any resource, required any permission) {

		var roleID = arguments.acl.getRoleID(arguments.role);

		return roleID == "admin";

	}

}