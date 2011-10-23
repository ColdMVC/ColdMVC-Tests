/**
 * @accessors true
 */
component {

	property _User;

	function model() {

		var user = _User.new();

		var result = user.validate();

		writeDump(result.getErrors());
		abort;

	}

	function form() {

		var user = _User.new();

		var editForm = createForm("user.edit", {
			user = user
		});

		editForm.age.setValue(3);

		var result = editForm.validate();

		writeDump(result.getErrors())
		abort;

	}

}