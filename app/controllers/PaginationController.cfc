/**
 * @accessors true
 */
component {

	property _User;

	function placeholder() {

		params.tableSorter = createTableSorter(["firstName", "lastName", "email"]);

		var query = _User.createQuery(params.tableSorter.getOptions());

		params.paginator = createPaginator(query, {
			max = 5
		});

	}

	function static() {

		params.tableSorter = createTableSorter(["firstName", "lastName", "email"]);

		var query = _User.createQuery(params.tableSorter.getOptions());

		params.paginator = createPaginator(query, {
			max = 5
		});

	}

	function wildcard() {

		params.tableSorter = createTableSorter(["firstName", "lastName", "email"]);

		var query = _User.createQuery(params.tableSorter.getOptions());

		params.paginator = createPaginator(query, {
			max = 5
		});

	}

}