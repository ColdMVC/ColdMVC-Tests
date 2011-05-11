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

	function testModelPropOneToOneNull() {

		var manager = _Manager.new();
		var team = manager.getTeam();

		assertTrue(isNull(team));

		team = manager.prop("team");

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertFalse(team.exists());

		team = manager.getTeam();

		assertTrue(isInstanceOf(team, "app.model.Team"));

	}

	function testModelPropOneToOneEmpty() {

		var manager = _Manager.new();
		manager.prop("team", "");

		var team = manager.getTeam();

		assertTrue(isNull(team));

		manager.prop("team", 1);
		team = manager.getTeam();

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertTrue(team.exists());

		manager.prop("team", "");
		team = manager.getTeam();

		assertTrue(isNull(team));

		team = manager.prop("team");

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertFalse(team.exists());

	}

	function testModelPropManyToOne() {

		var team = _Team.new();

		team.prop("city", 1);

		assertEqualsCase(team.prop("city").prop("name"), "Boston");

	}

	function testModelPropManyToOneNull() {

		var team = _Team.new();
		var city = team.getCity();

		assertTrue(isNull(city));

		city = team.prop("city");

		assertTrue(isInstanceOf(city, "app.model.City"));
		assertFalse(city.exists());

		city = team.getCity();

		assertTrue(isInstanceOf(city, "app.model.City"));

	}

	function testModelPropManyToOneEmpty() {

		var team = _Team.new();
		team.prop("city", "");

		var city = team.getCity();

		assertTrue(isNull(city));

		team.prop("city", 1);
		city = team.getCity();

		assertTrue(isInstanceOf(city, "app.model.City"));
		assertTrue(city.exists());

		team.prop("city", "");
		city = team.getCity();

		assertTrue(isNull(city));

		city = team.prop("city");

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

	function testModelPropOneToManyNull() {

		var city = _City.new();
		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 0);

		teams = city.getTeams();

		assertEquals(arrayLen(teams), 0);

	}

	function testModelPropOneToManyEmpty() {

		var city = _City.new();
		city.prop("teams", "");

		var teams = city.getTeams();

		assertEquals(arrayLen(teams), 0);

		city.prop("teams", [ 3, 1, 2 ]);
		teams = city.getTeams();

		assertEquals(arrayLen(teams), 3);

		city.prop("teams", "");
		teams = city.getTeams();

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

	function testModelPropManyToManyNull() {

		var player = _Player.new();
		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 0);

		positions = player.getPositions();

		assertEquals(arrayLen(positions), 0);

	}

	function testModelPropManyToManyEmpty() {

		var player = _Player.new();
		player.prop("positions", "");

		var positions = player.getPositions();

		assertEquals(arrayLen(positions), 0);

		player.prop("positions", [ 3, 1, 2 ]);
		positions = player.getPositions();

		assertEquals(arrayLen(positions), 3);

		player.prop("positions", "");
		positions = player.getPositions();

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
