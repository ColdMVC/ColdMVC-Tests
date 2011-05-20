/**
 * @extends test.Base
 */
component {

	function beforeTests() {

		super.beforeTests();

		var dao = beanFactory.getBean("dao");

		_City = dao.new("City");
		_Manager = dao.new("Manager");
		_Player = dao.new("Player");
		_Position = dao.new("Position");
		_Team = dao.new("Team");

		seed();

	}

	function testQueryHQL() {

		var q = _Team.createQuery();
		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team");

	}

	function testQueryEq() {

		var q = _Team.createQuery();
		q.where(
			q.eq("name", "Red Sox")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team where team.name = :name");

	}

	function testQueryStartsWith() {

		var q = _Team.createQuery();
		q.where(
			q.startsWith("name", "Red Sox")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team where team.name like :name");

	}

	function testQueryLike() {

		var q = _Team.createQuery();
		q.where(
			q.like("name", "Sox")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team where team.name like :name");

	}

	function testQueryIsNotNull() {

		var q = _Team.createQuery();
		q.where(
			q.isNotNull("name")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team where team.name is not null");

	}

	function testQueryAndSimple() {

		var q = _Team.createQuery();
		q.where(
			q.and(
				q.eq("name", "Red Sox"),
				q.eq("abbreviation", "BOS")
			)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team where ( team.name = :name and team.abbreviation = :abbreviation )");

	}

	function testQueryOrSimple() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.eq("name", "Red Sox"),
				q.eq("name", "Yankees")
			)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team where ( team.name = :name or team.name = :name_2 )");

	}

	function testQueryGet() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.eq("name", "Red Sox"),
				q.eq("abbreviation", "BOS")
			)
		);

		var team = q.get();

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testQueryList() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.eq("name", "Cubs"),
				q.like("name", "Sox")
			)
		)
		.sort("name")
		.order("asc");

		var hql = q.getHQL();
		var teams = q.list();

		assertEqualsCase(hql, "select team from Team team where ( team.name = :name or team.name like :name_2 )");
		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Red Sox");
		assertEqualsCase(teams[3].name(), "White Sox");

	}

	function testQueryJoin() {

		var q = _Team.createQuery();
		q.join("city");
		q.where(
			q.eq("city.name", "Boston")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team team join team.city as city where city.name = :name");

	}

	function testQueryNestedOrs() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.or(
					q.like("name", "Red"),
					q.like("name", "White")
				),
				q.or(
					q.startsWith("abbreviation", "NY")
				)
			)
		)
		.sort("name")
		.order("asc");

		var hql = q.getHQL();
		var teams = q.list();

		assertEquals(arrayLen(teams), 4);
		assertEqualsCase(teams[1].name(), "Mets");
		assertEqualsCase(teams[2].name(), "Red Sox");
		assertEqualsCase(teams[3].name(), "White Sox");
		assertEqualsCase(teams[4].name(), "Yankees");

	}

	function testQueryNestedAndsAndOrs() {

		var q = _Team.createQuery();
		q.where(
			q.and(
				q.or(
					q.and(
						q.like("name", "Sox"),
						q.or(
							q.startsWith("name", "R"),
							q.isNull("name")
						)
					),
					q.or(
						q.eq("abbreviation", "COL")
					),
					q.or(
						q.eq("name", "Mets")
					)
				),
				q.neq("name", "Rockies")
			)

		)
		.orWhere(
			q.eq("name", "Cubs")
		)
		.sort("name")
		.order("asc");

		var hql = q.getHQL();
		var teams = q.list();

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	function testModelMissingMethodSimple() {

		var team = _Team.new();
		team.name("Twins");

		assertEqualsCase(team.name(), "Twins");

	}

	function testModelMissingMethodInvalid() {

		var team = _Team.new();
		team.foo("bar");

		assertEqualsCase(team.foo(), "");

	}

	function testModelPropSimple() {

		var team = _Team.new();
		team.prop("name", "Twins");

		assertEqualsCase(team.prop("name"), "Twins");

	}

	function testModelPropOneToOne() {

		var manager = _Manager.new();

		manager.prop("myTeam", 1);

		assertEqualsCase(manager.prop("myTeam").prop("name"), "Cubs");

	}

	function testModelPropOneToOneNull() {

		var manager = _Manager.new();
		var team = manager.getMyTeam();

		assertTrue(isNull(team));

		team = manager.prop("myTeam");

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertFalse(team.exists());

		team = manager.getMyTeam();

		assertTrue(isInstanceOf(team, "app.model.Team"));

	}

	function testModelPropOneToOneEmpty() {

		var manager = _Manager.new();
		manager.prop("myTeam", "");

		var team = manager.getMyTeam();

		assertTrue(isNull(team));

		manager.prop("myTeam", 1);
		team = manager.getMyTeam();

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertTrue(team.exists());

		manager.prop("myTeam", "");
		team = manager.getMyTeam();

		assertTrue(isNull(team));

		team = manager.prop("myTeam");

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
			myTeam = 1
		});

		assertEqualsCase(manager.myTeam().name(), "Cubs");

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

	function testGetSimple() {

		var city = _City.get(1);

		assertEqualsCase(city.name(), "Boston");

	}

	function testGetNotExists() {

		var city = _City.get(4);

		assertFalse(city.exists());
		assertEqualsCase(city.name(), "");

	}

	function testListSimple() {

		var cities = _City.list();

		assertEquals(arrayLen(cities), 3);

	}

	function testListSimpleOptions() {

		var teams = _Team.list({
			offset = 2,
			max = 3,
			sort = "name",
			order = "desc"
		});

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "White Sox");
		assertEqualsCase(teams[2].name(), "Rockies");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	function testOffsetSimple() {

		var teams = _Team.list({
			offset = 1
		});

		assertEquals(arrayLen(teams), 6);

	}

	function testOffsetTooLow() {

		var teams = _Team.list({
			offset = -1
		});

		assertEquals(arrayLen(teams), 6);

	}

	function testOffsetTooHigh() {

		var teams = _Team.list({
			offset = 8
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testOffsetZero() {

		var teams = _Team.list({
			offset = 0
		});

		assertEquals(arrayLen(teams), 6);

	}

	function testMaxSimple() {

		var teams = _Team.list({
			max = 1
		});

		assertEquals(arrayLen(teams), 1);

	}

	function testMaxTooLow() {

		var teams = _Team.list({
			max = -1
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testMaxTooHigh() {

		var teams = _Team.list({
			max = 8
		});

		assertEquals(arrayLen(teams), 6);

	}

	function testMaxZero() {

		var teams = _Team.list({
			max = 0
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testCountSimple() {

		var cities = _City.count();

		assertEquals(cities, 3);

	}

	function testCountBySimple() {

		var cities = _City.countByName("Boston");

		assertEquals(cities, 1);

	}

	function testCountBySimpleInvalid() {

		var cities = _City.countByName("Fargo");

		assertEquals(cities, 0);

	}

	function testCountByOperator() {

		var managers = _Manager.countByFirstNameStartsWith("T");

		assertEquals(managers, 2);

	}

	function testCountByOperatorInvalid() {

		var managers = _Manager.countByFirstNameStartsWith("X");

		assertEquals(managers, 0);

	}

	function testCountByOperatorWithOr() {

		var managers = _Manager.countByFirstNameStartsWithOrLastNameLike("T", "uad");

		assertEquals(managers, 3);

	}

	function testCountByOperatorInvalidWithOr() {

		var managers = _Manager.countByFirstNameStartsWithOrLastNameLike("X", "uad");

		assertEquals(managers, 1);

	}

	function testCountByRelationshipSingle() {

		var teams = _Team.countByCity(1);

		assertEquals(teams, 1);

	}

	function testCountByRelationshipSingleValidWithIsNullOperator() {

		var teams = _Team.countByCityOrCityIsNull(1);

		assertEquals(teams, 2);

	}

	public function testCountByRelationshipSingleInValidWithIsNullOperator() {

		var teams = _Team.countByManagerOrManagerIsNull(1);

		assertEquals(teams, 2);

	}

	function testCountByRelationshipSingleWithIsNullSecondOperator() {

		var teams = _Team.countByCityIsNullOrCity(1);

		assertEquals(teams, 2);

	}

	function testCountByRelationshipMultiple() {

		var teams = _Team.countByCity(2);

		assertEquals(teams, 2);

	}

	function testCountByRelationshipNone() {

		var teams = _Team.countByCity(4);

		assertEquals(teams, 0);

	}

	function testCountByRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.countByCity(city);

		assertEquals(teams, 1);

	}

	function testCountByRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.countByCity(city);

		assertEquals(teams, 2);

	}

	function testCountByRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.countByCity(city);

		assertEquals(teams, 0);

	}

	function testFindBySimple() {

		var team = _Team.findByName("Red Sox");

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testFindBySimpleIsNull() {

		var team = _Team.findByNameIsNull();

		assertFalse(team.exists());

	}

	function testFindBySimpleIsNotNullWithAnd() {

		var team = _Team.findByNameIsNotNullAndNameLike("Red");

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testFindBySimpleIsNullWithOr() {

		var team = _Team.findByNameIsNullOrNameLike("Red");

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testFindBySimpleNone() {

		var team = _Team.findByName("Twins");

		assertFalse(team.exists());
		assertEquals(team.id(), "");

	}

	function testFindAllBySimple() {

		var teams = _Team.findAllByName("Yankees");

		assertEquals(arrayLen(teams), 1);

	}

	function testFindAllBySimpleIsNull() {

		var teams = _Team.findAllByNameIsNull();

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllBySimpleIsNullWithAnd() {

		var teams = _Team.findAllByNameIsNullAndNameLike("Sox");

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllBySimpleIsNullWithOr() {

		var teams = _Team.findAllByNameIsNullOrNameLike("Sox");

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllBySimpleIsNotNull() {

		var teams = _Team.findAllByNameIsNotNull();

		assertEquals(arrayLen(teams), 6);

	}

	function testFindAllBySimpleIsNotNullWithAnd() {

		var teams = _Team.findAllByNameIsNotNullAndNameLike("Sox");

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllBySimpleIsNotNullWithOr() {

		var teams = _Team.findAllByNameIsNotNullOrNameLike("Sox");

		assertEquals(arrayLen(teams), 6);

	}

	function testFindAllBySimpleNone() {

		var teams = _Team.findAllByName("Twins");

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllBySimpleInValid() {

		var error = false;

		try {
			var teams = _Team.findAllByFoo("Bar");
		} catch (any e) {
			error = true;
		}

		assertTrue(error);

	}

	function testFindAllByRelationshipSingle() {

		var teams = _Team.findAllByCity(1);

		assertEquals(arrayLen(teams), 1);

	}

	function testFindByRelationshipWithAlias() {

		var manager = _Manager.findByMyTeam(3);

		assertTrue(manager.exists());
		assertEquals(manager.id(), 5);
		assertEqualsCase(manager.lastName(), "Francona");

	}

	function testFindAllByRelationshipMultiple() {

		var teams = _Team.findAllByCity(2);

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllByRelationshipNone() {

		var teams = _Team.findAllByCity(4);

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllByRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.findAllByCity(city);

		assertEquals(arrayLen(teams), 1);

	}

	function testFindAllByRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.findAllByCity(city);

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllByRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.findAllByCity(city);

		assertEquals(arrayLen(teams), 0);

	}

	function testFindWhereSimple() {

		var team = _Team.findWhere({
			name = "Red Sox"
		});

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testFindWhereSimpleNone() {

		var team = _Team.findWhere({
			name = "Twins"
		});

		assertFalse(team.exists());
		assertEquals(team.id(), "");

	}

	function testFindAllWhereSimple() {

		var teams = _Team.findAllWhere({
			name = "Yankees"
		});

		assertEquals(arrayLen(teams), 1);

	}

	function testFindAllWhereSimpleNone() {

		var teams = _Team.findAllWhere({
			name = "Twins"
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllWhereRelationshipSingle() {

		var teams = _Team.findAllWhere({
			city = 1
		});

		assertEquals(arrayLen(teams), 1);

	}

	function testFindAllWhereRelationshipMultiple() {

		var teams = _Team.findAllWhere({
			city = 2
		});

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllWhereRelationshipNone() {

		var teams = _Team.findAllWhere({
			city = 4
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllWhereRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.findAllWhere({
			city = city
		});

		assertEquals(arrayLen(teams), 1);

	}

	function testFindAllWhereRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.findAllWhere({
			city = city
		});

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllWhereRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.findAllWhere({
			city = city
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testFindWhereSimpleOperator() {

		var team = _Team.findWhere({
			name = [ "startsWith", "R" ]
		});

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testFindWhereSimpleOperatorNone() {

		var team = _Team.findWhere({
			name = [ "startsWith", "T" ]
		});

		assertFalse(team.exists());
		assertEquals(team.id(), "");

	}

	function testFindAllWhereSimpleOperator() {

		var teams = _Team.findAllWhere({
			name = [ "like" , "Sox" ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	function testFindAllWhereSimpleOperatorNone() {

		var teams = _Team.findAllWhere({
			name = [ "like" , "win" ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	function testFindAllWhereRelationshipOperatorSingle() {

		var teams = _Team.findAllWhere({
			city = [ "notEqual", 1 ]
		});

		assertEquals(arrayLen(teams), 4);

	}

	function testFindAllWhereRelationshipOperatorMultiple() {

		var teams = _Team.findAllWhere({
			city = [ "isNotNull" ]
		});

		assertEquals(arrayLen(teams), 5);

	}

	function testGetAllSimple() {

		var teams = _Team.getAll("3,1,8,2");

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Red Sox");
		assertEqualsCase(teams[2].name(), "Cubs");
		assertEqualsCase(teams[3].name(), "Mets");

	}

	function testGetAllWithOptions() {

		var teams = _Team.getAll("3,1,8,2", {
			sort = "name",
			order = "asc"
		});

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	function testGetAllSimpleArray() {

		var teams = _Team.getAll([3,1,8,2]);

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Red Sox");
		assertEqualsCase(teams[2].name(), "Cubs");
		assertEqualsCase(teams[3].name(), "Mets");

	}

	function testGetAllArrayWithOptions() {

		var teams = _Team.getAll([3,1,8,2], {
			sort = "name",
			order = "asc"
		});

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	function testFindWhereNestedSimple() {

		var manager = _Manager.findWhere({
			"myTeam.CITY.NaMe" = "Boston"
		});

		assertTrue(manager.exists());
		assertEquals(manager.id(), 5);
		assertEqualsCase(manager.lastName(), "Francona");

	}

	function testFindWhereNestedSimpleNone() {

		var manager = _Manager.findWhere({
			"myTeam.city.name" = "Minneapolis"
		});

		assertFalse(manager.exists());
		assertEquals(manager.id(), "");

	}

	function testFindAllWhereNestedSimple() {

		var managers = _Manager.findAllWhere({
			"myTeam.city.name" = "New York"
		});

		assertEquals(arrayLen(managers), 2);

	}

	function testFindAllWhereNestedSimpleNone() {

		var managers = _Manager.findAllWhere({
			"myTeam.city.name" = "Minneapolis"
		});

		assertEquals(arrayLen(managers), 0);

	}

	function testFindWhereNestedRelationshipSimple() {

		var manager = _Manager.findWhere({
			"myTeam.city" = "1"
		});

		assertTrue(manager.exists());
		assertEquals(manager.id(), 5);
		assertEqualsCase(manager.lastName(), "Francona");

	}

	function testFindAllWhereNestedRelationshipSingle() {

		var managers = _Manager.findAllWhere({
			"myTeam.city" = "1"
		});

		assertEquals(arrayLen(managers), 1);

	}

	function testFindAllWhereNestedRelationshipMultiple() {

		var managers = _Manager.findAllWhere({
			"manager.myTeam.city" = "2"
		});

		assertEquals(arrayLen(managers), 2);

	}

	function testFindAllWhereNestedRelationshipNone() {

		var managers = _Manager.findAllWhere({
			"myTeam.city.id" = "4"
		});

		assertEquals(arrayLen(managers), 0);

	}

	function testFindSimple() {

		var team = _Team.find("from Team team where name = :name", {
			name = "Red Sox"
		});

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	function testFindAllSimple() {

		var managers = _Manager.findAll("from Manager manager where firstName = :firstName", {
			firstName = "Terry"
		});

		assertEquals(arrayLen(managers), 2);

	}

	function testCountWhereSimple() {

		var teams = _Team.countWhere({
			name = "Yankees"
		});

		assertEquals(teams, 1);

	}

	function testCountWhereSimpleNone() {

		var teams = _Team.countWhere({
			name = "Twins"
		});

		assertEquals(teams, 0);

	}

	function testCountWhereRelationshipSingle() {

		var teams = _Team.countWhere({
			city = 1
		});

		assertEquals(teams, 1);

	}

	function testCountWhereRelationshipMultiple() {

		var teams = _Team.countWhere({
			city = 2
		});

		assertEquals(teams, 2);

	}

	function testCountWhereRelationshipNone() {

		var teams = _Team.countWhere({
			city = 4
		});

		assertEquals(teams, 0);

	}

	function testCountWhereRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.countWhere({
			city = city
		});

		assertEquals(teams, 1);

	}

	function testCountWhereRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.countWhere({
			city = city
		});

		assertEquals(teams, 2);

	}

	function testCountWhereRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.countWhere({
			city = city
		});

		assertEquals(teams, 0);

	}

}