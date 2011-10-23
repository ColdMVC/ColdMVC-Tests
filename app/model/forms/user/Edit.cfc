/**
 * @accessors true
 * @extends coldmvc.forms.Form
 */
component {

	property user;

	public void function create() {

		addElement("input", "firstName")
			.setValue(user.firstName())
			.setRequired(true);

		addElement("input", "lastName")
			.setValue(user.lastName())
			.setRequired(true);

		addElement("email", "email")
			.setValue(user.email())
			.setRequired(true)
			.addValidator("email");

		addElement("select", "gender")
			.setValue(user.gender())
			.setOptions("Male,Female");

		addElement("number", "age")
			.setValue(user.age())
			.setRequired(true)
			.addValidator("range", { min = 18, max = 25 });

		addElement("submit", "save");

	}

}