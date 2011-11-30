/**
 * @accessors true
 */
component {

	property _User;

	function placeholder() {

		params.sorter = createSorter(["firstName", "lastName", "email"]);

		var query = _User.createQuery(params.sorter.getOptions());

		params.paginator = createPaginator(query, {
			max = 5
		});

	}

	function static() {

		params.sorter = createSorter(["firstName", "lastName", "email"]);

		var query = _User.createQuery(params.sorter.getOptions());

		params.paginator = createPaginator(query, {
			max = 5
		});

	}

	function wildcard() {

		params.sorter = createSorter(["firstName", "lastName", "email"]);

		var query = _User.createQuery(params.sorter.getOptions());

		params.paginator = createPaginator(query, {
			max = 5
		});

	}

}