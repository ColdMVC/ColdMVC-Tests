/**
 * @extends test.Base
 */
component {

	function beforeTests() {

		super.beforeTests();

		seed();

	}

	function testModelMissingMethodSimple() {

		var team = _Team.new();
		team.name("Twins");

		assertEqualsCase(team.name(), "Twins");

	}

	function testModelPropSimple() {

		var team = _Team.new();
		team.prop("name", "Twins");

		assertEqualsCase(team.prop("name"), "Twins");

	}

	function testModelPropOneToOne() {

		var manager = _Manager.new();

		manager.prop("team", 1);

		assertEqualsCase(manager.prop("team").prop("name"), "Cubs");

	}

	function testModelPropOneToOneEmpty() {

		var manager = _Manager.new();
		var team = manager.prop("team");

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertFalse(team.exists());

	}

	function testModelPropManyToOne() {

		var team = _Team.new();

		team.prop("city", 1);

		assertEqualsCase(team.prop("city").prop("name"), "Boston");

	}

	function testModelPropManyToOneEmpty() {

		var team = _Team.new();
		var city = team.prop("city");

		assertTrue(isInstanceOf(city, "app.model.City"));
		assertFalse(city.exists());

	}

	function testModelPropOneToManyList() {

		var city = _City.new();

		city.prop("teams", "3, 1, 2");

		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].prop("name"), "Red Sox");
		assertEqualsCase(teams[2].prop("name"), "Cubs");
		assertEqualsCase(teams[3].prop("name"), "Mets");

	}

	function testModelPropOneToManyArray() {

		var city = _City.new();

		city.prop("teams", [ 3, 1, 2 ]);

		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].prop("name"), "Red Sox");
		assertEqualsCase(teams[2].prop("name"), "Cubs");
		assertEqualsCase(teams[3].prop("name"), "Mets");

	}

	function testModelPropOneToManyEmpty() {

		var city = _City.new();
		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 0);

	}

	function testModelPropManyToManyList() {

		var player = _Player.new();

		player.prop("positions", "4, 6");

		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 2);
		assertEqualsCase(positions[1].prop("name"), "First Base");
		assertEqualsCase(positions[2].prop("name"), "Third Base");

	}

	function testModelPropManyToManyArray() {

		var player = _Player.new();

		player.prop("positions", [ 4, 6 ]);

		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 2);
		assertEqualsCase(positions[1].prop("name"), "First Base");
		assertEqualsCase(positions[2].prop("name"), "Third Base");

	}

	function testModelPropManyToManyEmpty() {

		var player = _Player.new();
		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 0);

	}

	function testModelPopulateSimple() {

		var team = _Team.new();

		team.populate({
			name = "Twins"
		});

		assertEqualsCase(team.name(), "Twins");

	}

	function testModelPopulateOneToOne() {

		var manager = _Manager.new();

		manager.populate({
			team = 1
		});

		assertEqualsCase(manager.team().name(), "Cubs");

	}

	function testModelPopulateManyToOne() {

		var team = _Team.new();

		team.populate({
			city = 1
		});

		assertEqualsCase(team.city().name(), "Boston");

	}

	function testModelPopulateOneToManyList() {

		var city = _City.new();

		city.populate({
			teams = "3, 1, 2"
		});

		var teams = city.teams();

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Red Sox");
		assertEqualsCase(teams[2].name(), "Cubs");
		assertEqualsCase(teams[3].name(), "Mets");

	}

	function testModelPopulateOneToManyArray() {

		var city = _City.new();

		city.populate({
			teams = [ 3, 1, 2 ]
		});

		var teams = city.teams();

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Red Sox");
		assertEqualsCase(teams[2].name(), "Cubs");
		assertEqualsCase(teams[3].name(), "Mets");

	}

}
