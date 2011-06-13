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

	public function testQueryHQL() {

		var q = _Team.createQuery();
		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team");

		var teams = q.list();

		assertTrue(arrayLen(teams), 6);

	}

	public function testQueryEq() {

		var q = _Team.createQuery();
		q.where(
			q.eq("name", "Red Sox")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryStartsWith() {

		var q = _Team.createQuery();
		q.where(
			q.startsWith("name", "R")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) like :name");

		var teams = q.list();

		assertTrue(arrayLen(teams), 2);

	}

	public function testQueryLike() {

		var q = _Team.createQuery();
		q.where(
			q.like("name", "Sox")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) like :name");

		var teams = q.list();

		assertTrue(arrayLen(teams), 2);

	}

	public function testQueryIsNotNull() {

		var q = _Team.createQuery();
		q.where(
			q.isNotNull("name")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where team.name is not null");

		var teams = q.list();

		assertTrue(arrayLen(teams), 6);

	}

	public function testQueryInList() {

		var q = _Team.createQuery();

		q.where(
			q.in("name", "Red Sox, Cubs")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) in (:name)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 2);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Red Sox");

	}

	public function testQueryInArray() {

		var q = _Team.createQuery();

		q.where(
			q.in("name", ["Red Sox", "Cubs"])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) in (:name)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 2);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Red Sox");

	}

	public function testQueryIDInList() {

		var q = _Team.createQuery();

		q.where(
			q.in("id", "3,1")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.id) in (:id)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 2);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Red Sox");

	}

	public function testQueryIDInArray() {

		var q = _Team.createQuery();

		q.where(
			q.in("id", [ 3, 1 ])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.id) in (:id)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 2);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Red Sox");

	}

	public function testQueryNotInList() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("name", "Red Sox, Cubs")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) not in (:name)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 4);
		assertEqualsCase(teams[1].prop("name"), "Mets");
		assertEqualsCase(teams[2].prop("name"), "White Sox");
		assertEqualsCase(teams[3].prop("name"), "Yankees");
		assertEqualsCase(teams[4].prop("name"), "Rockies");

	}

	public function testQueryNotInArray() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("name", ["Red Sox", "Cubs"])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) not in (:name)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 4);
		assertEqualsCase(teams[1].prop("name"), "Mets");
		assertEqualsCase(teams[2].prop("name"), "White Sox");
		assertEqualsCase(teams[3].prop("name"), "Yankees");
		assertEqualsCase(teams[4].prop("name"), "Rockies");

	}

	public function testQueryIDNotInList() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("id", "3,1")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.id) not in (:id)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 4);
		assertEqualsCase(teams[1].prop("name"), "Mets");
		assertEqualsCase(teams[2].prop("name"), "White Sox");
		assertEqualsCase(teams[3].prop("name"), "Yankees");
		assertEqualsCase(teams[4].prop("name"), "Rockies");

	}

	public function testQueryIDNotInArray() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("id", [ 3, 1 ])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.id) not in (:id)");

		var teams = q.list();

		assertEquals(arrayLen(teams), 4);
		assertEqualsCase(teams[1].prop("name"), "Mets");
		assertEqualsCase(teams[2].prop("name"), "White Sox");
		assertEqualsCase(teams[3].prop("name"), "Yankees");
		assertEqualsCase(teams[4].prop("name"), "Rockies");

	}

	public function testQueryInListEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.in("name", "")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 0");

		var teams = q.list();

		assertEquals(arrayLen(teams), 0);

	}

	public function testQueryInArrayEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.in("name", [""])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 0");

		var teams = q.list();

		assertEquals(arrayLen(teams), 0);

	}

	public function testQueryIDInListEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.in("id", "")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 0");

		var teams = q.list();

		assertEquals(arrayLen(teams), 0);

	}

	public function testQueryIDInArrayEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.in("id", [])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 0");

		var teams = q.list();

		assertEquals(arrayLen(teams), 0);

	}

	public function testQueryNotInListEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("name", "")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 1");

		var teams = q.list();

		assertEquals(arrayLen(teams), 6);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Mets");
		assertEqualsCase(teams[3].prop("name"), "Red Sox");
		assertEqualsCase(teams[4].prop("name"), "White Sox");
		assertEqualsCase(teams[5].prop("name"), "Yankees");
		assertEqualsCase(teams[6].prop("name"), "Rockies");

	}

	public function testQueryNotInArrayEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("name", [""])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 1");

		var teams = q.list();

		assertEquals(arrayLen(teams), 6);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Mets");
		assertEqualsCase(teams[3].prop("name"), "Red Sox");
		assertEqualsCase(teams[4].prop("name"), "White Sox");
		assertEqualsCase(teams[5].prop("name"), "Yankees");
		assertEqualsCase(teams[6].prop("name"), "Rockies");

	}

	public function testQueryIDNotInListEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("id", "")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 1");

		var teams = q.list();

		assertEquals(arrayLen(teams), 6);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Mets");
		assertEqualsCase(teams[3].prop("name"), "Red Sox");
		assertEqualsCase(teams[4].prop("name"), "White Sox");
		assertEqualsCase(teams[5].prop("name"), "Yankees");
		assertEqualsCase(teams[6].prop("name"), "Rockies");

	}

	public function testQueryIDNotInArrayEmpty() {

		var q = _Team.createQuery();

		q.where(
			q.notIn("id", [])
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where 1 = 1");

		var teams = q.list();

		assertEquals(arrayLen(teams), 6);
		assertEqualsCase(teams[1].prop("name"), "Cubs");
		assertEqualsCase(teams[2].prop("name"), "Mets");
		assertEqualsCase(teams[3].prop("name"), "Red Sox");
		assertEqualsCase(teams[4].prop("name"), "White Sox");
		assertEqualsCase(teams[5].prop("name"), "Yankees");
		assertEqualsCase(teams[6].prop("name"), "Rockies");

	}

	public function testQueryAndSimple() {

		var q = _Team.createQuery();
		q.where(
			q.and(
				q.eq("name", "Red Sox"),
				q.eq("abbreviation", "BOS")
			)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name and lower(team.abbreviation) = :abbreviation )");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryOrSimple() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.eq("name", "Red Sox"),
				q.eq("name", "Yankees")
			)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name or lower(team.name) = :name_2 )");

		var teams = q.list();

		assertTrue(arrayLen(teams), 2);

	}

	public function testQueryGet() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.eq("name", "Red Sox"),
				q.eq("abbreviation", "BOS")
			)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name or lower(team.abbreviation) = :abbreviation )");

		var team = q.get();

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testQueryGetNotExists() {

		var q = _Team.createQuery();
		q.where(
			q.eq("name", "Marlins")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name");

		var team = q.get();

		assertFalse(team.exists());
		assertTrue(isInstanceOf(team, "app.model.Team"));

	}

	public function testQueryList() {

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

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name or lower(team.name) like :name_2 )");
		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Red Sox");
		assertEqualsCase(teams[3].name(), "White Sox");

	}

	public function testQueryListOptions() {

		var q = _Team.createQuery();
		q.where(
			q.or(
				q.eq("name", "Cubs"),
				q.like("name", "Sox")
			)
		);

		var hql = q.getHQL();

		var teams = q.list({
			sort = "name",
			order = "asc",
			max = "2"
		});

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name or lower(team.name) like :name_2 )");
		assertEquals(arrayLen(teams), 2);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Red Sox");

	}

	public function testQuerySort() {

		var q = _Team.createQuery();
		q.innerJoin("city");
		q.sort("city.name desc, team.name");
		q.order("desc");

		var hql = q.getHQL();

		var teams = q.list();

		assertEqualsCase(hql, "select team from Team as team inner join team.city as city");
		assertEquals(arrayLen(teams), 5);
		assertEqualsCase(teams[1].name(), "Yankees");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "White Sox");
		assertEqualsCase(teams[4].name(), "Cubs");
		assertEqualsCase(teams[5].name(), "Red Sox");


	}

	public function testQueryJoin() {

		var q = _Team.createQuery();
		q.join("city");
		q.where(
			q.eq("city.name", "Boston")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team join team.city as city where lower(city.name) = :name");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryLeftJoin() {

		var q = _Team.createQuery();
		q.leftJoin("city");

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team left join team.city as city");

		var teams = q.list();

		assertTrue(arrayLen(teams), 6);

	}

	public function testQueryInnerJoin() {

		var q = _Team.createQuery();
		q.innerJoin("city");

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team inner join team.city as city");

		var teams = q.list();

		assertTrue(arrayLen(teams), 5);

	}

	public function testQueryJoinAlias() {

		var q = _Team.createQuery();
		q.join("city", "c");
		q.where(
			q.eq("c.name", "Boston")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team join team.city as c where lower(c.name) = :name");

		var team = q.get();

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testQuerySelect() {

		var q = _Team.createQuery();
		q.select("city");
		q.innerJoin("team.city", "city");

		var hql = q.getHQL();

		assertEqualsCase(hql, "select city from Team as team inner join team.city as city");

		var cities = q.list();

		assertTrue(arrayLen(cities), 3);

	}

	public function testQueryCount() {

		var q = _Team.createQuery();
		q.select("city");
		q.innerJoin("team.city", "city");

		var hql = q.getHQL();

		assertEqualsCase(hql, "select city from Team as team inner join team.city as city");

		var count = q.count();

		assertTrue(count, 3);

		var cities = q.list();

		assertTrue(arrayLen(cities), 3);

	}

	public function testQueryGroupBy() {

		var q = _City.createQuery();
		q.select("city.id, count(team.id)");
		q.innerJoin("city.teams", "team");
		q.sort("city.id");
		q.groupBy("city.id");

		var hql = q.getHQL();

		assertEqualsCase(hql, "select city.id, count(team.id) from City as city inner join city.teams as team group by city.id");

		var cities = q.list();

		assertTrue(arrayLen(cities), 3);
		assertEquals(cities[1][1], 1);
		assertEquals(cities[1][2], 1);
		assertEquals(cities[2][1], 2);
		assertEquals(cities[2][2], 2);
		assertEquals(cities[3][1], 3);
		assertEquals(cities[3][2], 2);

	}

	public function testQueryNestedOrs() {

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

		assertEqualsCase(hql, "select team from Team as team where ( ( lower(team.name) like :name or lower(team.name) like :name_2 ) or ( lower(team.abbreviation) like :abbreviation ) )");

		var teams = q.list();

		assertEquals(arrayLen(teams), 4);
		assertEqualsCase(teams[1].name(), "Mets");
		assertEqualsCase(teams[2].name(), "Red Sox");
		assertEqualsCase(teams[3].name(), "White Sox");
		assertEqualsCase(teams[4].name(), "Yankees");

	}

	public function testQueryNestedAndsAndOrs() {

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

		assertEqualsCase(hql, "select team from Team as team where ( ( ( lower(team.name) like :name and ( lower(team.name) like :name_2 or team.name is null ) ) or ( lower(team.abbreviation) = :abbreviation ) or ( lower(team.name) = :name_3 ) ) and lower(team.name) != :name_4 ) or lower(team.name) = :name_5");

		var teams = q.list();

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	public function testQueryWhereArray() {

		var q = _Team.createQuery();

		var clauses = [];
		arrayAppend(clauses, q.eq("name", "Red Sox"));
		arrayAppend(clauses, q.eq("abbreviation", "BOS"));

		q.where(clauses);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name and lower(team.abbreviation) = :abbreviation");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryWhereMultiple() {

		var q = _Team.createQuery();

		q.where(
			q.eq("name", "Red Sox"),
			q.eq("abbreviation", "BOS")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name and lower(team.abbreviation) = :abbreviation");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryAndWhereMultiple() {

		var q = _Team.createQuery();

		q.andWhere(
			q.eq("name", "Red Sox"),
			q.eq("abbreviation", "BOS")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name and lower(team.abbreviation) = :abbreviation");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryOrWhereMultiple() {

		var q = _Team.createQuery();

		q.orWhere(
			q.eq("name", "Red Sox"),
			q.eq("abbreviation", "BOS")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name or lower(team.abbreviation) = :abbreviation");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryAndWhereNoWhere() {

		var q = _Team.createQuery();

		q.andWhere(
			q.eq("name", "Red Sox")
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryAndWhereNoWhereArray() {

		var q = _Team.createQuery();

		var clauses = [];
		arrayAppend(clauses, q.eq("name", "Red Sox"));
		arrayAppend(clauses, q.eq("abbreviation", "BOS"));

		q.andWhere(clauses);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name and lower(team.abbreviation) = :abbreviation");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryOrWhereNoWhereArray() {

		var q = _Team.createQuery();

		var clauses = [];
		arrayAppend(clauses, q.eq("name", "Red Sox"));
		arrayAppend(clauses, q.eq("name", "White Sox"));

		q.orWhere(clauses);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name or lower(team.name) = :name_2");

		var teams = q.list();

		assertTrue(arrayLen(teams), 2);

	}

	public function testQueryAndWhereArray() {

		var q = _Team.createQuery();

		q.where(q.eq("name", "Red Sox"));

		var clauses = [];
		arrayAppend(clauses, q.eq("abbreviation", "BOS"));
		arrayAppend(clauses, q.like("name", "Red"));

		q.andWhere(clauses);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name and lower(team.abbreviation) = :abbreviation and lower(team.name) like :name_2");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryOrWhereArray() {

		var q = _Team.createQuery();

		q.where(q.eq("name", "Red Sox"));

		var clauses = [];
		arrayAppend(clauses, q.eq("abbreviation", "BOS"));
		arrayAppend(clauses, q.like("name", "Red"));

		q.orWhere(clauses);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where lower(team.name) = :name or lower(team.abbreviation) = :abbreviation or lower(team.name) like :name_2");

		var teams = q.list();

		assertTrue(arrayLen(teams), 1);

	}

	public function testQueryAndArray() {

		var q = _Team.createQuery();

		var clauses = [];
		arrayAppend(clauses, q.eq("name", "Red Sox"));
		arrayAppend(clauses, q.eq("abbreviation", "BOS"));

		q.where(
			q.and(clauses)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name and lower(team.abbreviation) = :abbreviation )");

		var team = q.get();

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testQueryOrArray() {

		var q = _Team.createQuery();

		var clauses = [];
		arrayAppend(clauses, q.eq("name", "Red Sox"));
		arrayAppend(clauses, q.eq("abbreviation", "BOS"));

		q.where(
			q.or(clauses)
		);

		var hql = q.getHQL();

		assertEqualsCase(hql, "select team from Team as team where ( lower(team.name) = :name or lower(team.abbreviation) = :abbreviation )");

		var team = q.get();

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testModelMissingMethodSimple() {

		var team = _Team.new();
		team.name("Twins");

		assertEqualsCase(team.name(), "Twins");

	}

	public function testModelMissingMethodInvalid() {

		var team = _Team.new();
		team.foo("bar");

		assertEqualsCase(team.foo(), "");

	}

	public function testModelPropSimple() {

		var team = _Team.new();
		team.prop("name", "Twins");

		assertEqualsCase(team.prop("name"), "Twins");

	}

	public function testModelPropOneToOne() {

		var manager = _Manager.new();

		manager.prop("myTeam", 1);

		assertEqualsCase(manager.prop("myTeam").prop("name"), "Cubs");

	}

	public function testModelPropOneToOneNull() {

		var manager = _Manager.new();
		var team = manager.getMyTeam();

		assertTrue(isNull(team));

		team = manager.prop("myTeam");

		assertTrue(isInstanceOf(team, "app.model.Team"));
		assertFalse(team.exists());

		team = manager.getMyTeam();

		assertTrue(isInstanceOf(team, "app.model.Team"));

	}

	public function testModelPropOneToOneEmpty() {

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

	public function testModelPropManyToOne() {

		var team = _Team.new();

		team.prop("city", 1);

		assertEqualsCase(team.prop("city").prop("name"), "Boston");

	}

	public function testModelPropManyToOneNull() {

		var team = _Team.new();
		var city = team.getCity();

		assertTrue(isNull(city));

		city = team.prop("city");

		assertTrue(isInstanceOf(city, "app.model.City"));
		assertFalse(city.exists());

		city = team.getCity();

		assertTrue(isInstanceOf(city, "app.model.City"));

	}

	public function testModelPropManyToOneEmpty() {

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

	public function testModelPropOneToManyList() {

		var city = _City.new();

		city.prop("teams", "3, 1, 2");

		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].prop("name"), "Red Sox");
		assertEqualsCase(teams[2].prop("name"), "Cubs");
		assertEqualsCase(teams[3].prop("name"), "Mets");

	}

	public function testModelPropOneToManyArray() {

		var city = _City.new();

		city.prop("teams", [ 3, 1, 2 ]);

		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].prop("name"), "Red Sox");
		assertEqualsCase(teams[2].prop("name"), "Cubs");
		assertEqualsCase(teams[3].prop("name"), "Mets");

	}

	public function testModelPropOneToManyNull() {

		var city = _City.new();
		var teams = city.prop("teams");

		assertEquals(arrayLen(teams), 0);

		teams = city.getTeams();

		assertEquals(arrayLen(teams), 0);

	}

	public function testModelPropOneToManyEmpty() {

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

	public function testModelPropManyToManyList() {

		var player = _Player.new();

		player.prop("positions", "4, 6");

		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 2);
		assertEqualsCase(positions[1].prop("name"), "First Base");
		assertEqualsCase(positions[2].prop("name"), "Third Base");

	}

	public function testModelPropManyToManyArray() {

		var player = _Player.new();

		player.prop("positions", [ 4, 6 ]);

		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 2);
		assertEqualsCase(positions[1].prop("name"), "First Base");
		assertEqualsCase(positions[2].prop("name"), "Third Base");

	}

	public function testModelPropManyToManyNull() {

		var player = _Player.new();
		var positions = player.prop("positions");

		assertEquals(arrayLen(positions), 0);

		positions = player.getPositions();

		assertEquals(arrayLen(positions), 0);

	}

	public function testModelPropManyToManyEmpty() {

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

	public function testModelPopulateSimple() {

		var team = _Team.new();

		team.populate({
			name = "Twins"
		});

		assertEqualsCase(team.name(), "Twins");

	}

	public function testModelPopulateOneToOne() {

		var manager = _Manager.new();

		manager.populate({
			myTeam = 1
		});

		assertEqualsCase(manager.myTeam().name(), "Cubs");

	}

	public function testModelPopulateManyToOne() {

		var team = _Team.new();

		team.populate({
			city = 1
		});

		assertEqualsCase(team.city().name(), "Boston");

	}

	public function testModelPopulateOneToManyList() {

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

	public function testModelPopulateOneToManyArray() {

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

	public function testGetSimple() {

		var city = _City.get(1);

		assertEqualsCase(city.name(), "Boston");

	}

	public function testGetNotExists() {

		var city = _City.get(4);

		assertFalse(city.exists());
		assertEqualsCase(city.name(), "");

	}

	public function testExistsSimple() {

		var result = _City.exists(1);

		assertTrue(result);

	}

	public function testExistsNotExists() {

		var result = _City.exists(4);

		assertFalse(result);

	}

	public function testListSimple() {

		var cities = _City.list();

		assertEquals(arrayLen(cities), 3);

	}

	public function testListSimpleOptions() {

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

	public function testListSort() {

		var teams = _Team.list({
			sort = "team.city.name desc, team.name",
			order = "desc"
		});

		assertEquals(arrayLen(teams), 5);
		assertEqualsCase(teams[1].name(), "Yankees");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "White Sox");
		assertEqualsCase(teams[4].name(), "Cubs");
		assertEqualsCase(teams[5].name(), "Red Sox");

	}

	public function testOffsetSimple() {

		var teams = _Team.list({
			offset = 1
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testOffsetTooLow() {

		var teams = _Team.list({
			offset = -1
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testOffsetTooHigh() {

		var teams = _Team.list({
			offset = 8
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testOffsetZero() {

		var teams = _Team.list({
			offset = 0
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testMaxSimple() {

		var teams = _Team.list({
			max = 1
		});

		assertEquals(arrayLen(teams), 1);

	}

	public function testMaxTooLow() {

		var teams = _Team.list({
			max = -1
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testMaxTooHigh() {

		var teams = _Team.list({
			max = 8
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testMaxZero() {

		var teams = _Team.list({
			max = 0
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testCountSimple() {

		var cities = _City.count();

		assertEquals(cities, 3);

	}

	public function testCountBySimple() {

		var cities = _City.countByName("Boston");

		assertEquals(cities, 1);

	}

	public function testCountBySimpleInvalid() {

		var cities = _City.countByName("Fargo");

		assertEquals(cities, 0);

	}

	public function testCountByOperator() {

		var managers = _Manager.countByFirstNameStartsWith("T");

		assertEquals(managers, 2);

	}

	public function testCountByOperatorInvalid() {

		var managers = _Manager.countByFirstNameStartsWith("X");

		assertEquals(managers, 0);

	}

	public function testCountByOperatorWithOr() {

		var managers = _Manager.countByFirstNameStartsWithOrLastNameLike("T", "uad");

		assertEquals(managers, 3);

	}

	public function testCountByOperatorInvalidWithOr() {

		var managers = _Manager.countByFirstNameStartsWithOrLastNameLike("X", "uad");

		assertEquals(managers, 1);

	}

	public function testCountByRelationshipSingle() {

		var teams = _Team.countByCity(1);

		assertEquals(teams, 1);

	}

	public function testCountByRelationshipSingleValidWithIsNullOperator() {

		var teams = _Team.countByCityOrCityIsNull(1);

		assertEquals(teams, 2);

	}

	public function testCountByRelationshipSingleInValidWithIsNullOperator() {

		var teams = _Team.countByManagerOrManagerIsNull(1);

		assertEquals(teams, 2);

	}

	public function testCountByRelationshipSingleWithIsNullSecondOperator() {

		var teams = _Team.countByCityIsNullOrCity(1);

		assertEquals(teams, 2);

	}

	public function testCountByRelationshipMultiple() {

		var teams = _Team.countByCity(2);

		assertEquals(teams, 2);

	}

	public function testCountByRelationshipNone() {

		var teams = _Team.countByCity(4);

		assertEquals(teams, 0);

	}

	public function testCountByRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.countByCity(city);

		assertEquals(teams, 1);

	}

	public function testCountByRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.countByCity(city);

		assertEquals(teams, 2);

	}

	public function testCountByRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.countByCity(city);

		assertEquals(teams, 0);

	}

	public function testFindBySimple() {

		var team = _Team.findByName("Red Sox");

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testFindBySimpleIsNull() {

		var team = _Team.findByNameIsNull();

		assertFalse(team.exists());

	}

	public function testFindBySimpleIsNotNullWithAnd() {

		var team = _Team.findByNameIsNotNullAndNameLike("Red");

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testFindBySimpleIsNullWithOr() {

		var team = _Team.findByNameIsNullOrNameLike("Red");

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testFindBySimpleNone() {

		var team = _Team.findByName("Twins");

		assertFalse(team.exists());
		assertEquals(team.id(), "");

	}

	public function testFindAllBySimple() {

		var teams = _Team.findAllByName("Yankees");

		assertEquals(arrayLen(teams), 1);

	}

	public function testFindAllBySimpleIsNull() {

		var teams = _Team.findAllByNameIsNull();

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllBySimpleIsNullWithAnd() {

		var teams = _Team.findAllByNameIsNullAndNameLike("Sox");

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllBySimpleIsNullWithOr() {

		var teams = _Team.findAllByNameIsNullOrNameLike("Sox");

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllBySimpleIsNotNull() {

		var teams = _Team.findAllByNameIsNotNull();

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllBySimpleIsNotNullWithAnd() {

		var teams = _Team.findAllByNameIsNotNullAndNameLike("Sox");

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllBySimpleIsNotNullWithOr() {

		var teams = _Team.findAllByNameIsNotNullOrNameLike("Sox");

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllBySimpleNone() {

		var teams = _Team.findAllByName("Twins");

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllBySimpleInValid() {

		var error = false;

		try {
			var teams = _Team.findAllByFoo("Bar");
		} catch (any e) {
			error = true;
		}

		assertTrue(error);

	}

	public function testFindAllByRelationshipSingle() {

		var teams = _Team.findAllByCity(1);

		assertEquals(arrayLen(teams), 1);

	}

	public function testFindByRelationshipWithAlias() {

		var manager = _Manager.findByMyTeam(3);

		assertTrue(manager.exists());
		assertEquals(manager.id(), 5);
		assertEqualsCase(manager.lastName(), "Francona");

	}

	public function testFindAllByRelationshipMultiple() {

		var teams = _Team.findAllByCity(2);

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllByRelationshipNone() {

		var teams = _Team.findAllByCity(4);

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllByRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.findAllByCity(city);

		assertEquals(arrayLen(teams), 1);

	}

	public function testFindAllByRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.findAllByCity(city);

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllByRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.findAllByCity(city);

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindWhereSimple() {

		var team = _Team.findWhere({
			name = "Red Sox"
		});

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testFindWhereSimpleNone() {

		var team = _Team.findWhere({
			name = "Twins"
		});

		assertFalse(team.exists());
		assertEquals(team.id(), "");

	}

	public function testFindAllWhereSimple() {

		var teams = _Team.findAllWhere({
			name = "Yankees"
		});

		assertEquals(arrayLen(teams), 1);

	}

	public function testFindAllWhereSimpleNone() {

		var teams = _Team.findAllWhere({
			name = "Twins"
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereRelationshipSingle() {

		var teams = _Team.findAllWhere({
			city = 1
		});

		assertEquals(arrayLen(teams), 1);

	}

	public function testFindAllWhereRelationshipMultiple() {

		var teams = _Team.findAllWhere({
			city = 2
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereRelationshipNone() {

		var teams = _Team.findAllWhere({
			city = 4
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.findAllWhere({
			city = city
		});

		assertEquals(arrayLen(teams), 1);

	}

	public function testFindAllWhereRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.findAllWhere({
			city = city
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.findAllWhere({
			city = city
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindWhereSimpleOperator() {

		var team = _Team.findWhere({
			name = [ "startsWith", "R" ]
		});

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testFindWhereSimpleOperatorNone() {

		var team = _Team.findWhere({
			name = [ "startsWith", "T" ]
		});

		assertFalse(team.exists());
		assertEquals(team.id(), "");

	}

	public function testFindAllWhereSimpleOperator() {

		var teams = _Team.findAllWhere({
			name = [ "like" , "Sox" ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereSimpleOperatorNone() {

		var teams = _Team.findAllWhere({
			name = [ "like" , "win" ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereRelationshipOperatorSingle() {

		var teams = _Team.findAllWhere({
			city = [ "notEqual", 1 ]
		});

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllWhereRelationshipOperatorMultiple() {

		var teams = _Team.findAllWhere({
			city = [ "isNotNull" ]
		});

		assertEquals(arrayLen(teams), 5);

	}

	public function testFindAllByInSimple() {

		var teams = _Team.findAllByIDIn("1, 2");

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllByInSimpleEmpty() {

		var teams = _Team.findAllByIDIn("");

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllByInArray() {

		var teams = _Team.findAllByIDIn([ 1, 2 ]);

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllByInArrayEmpty() {

		var teams = _Team.findAllByIDIn([]);

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllByInSimpleString() {

		var teams = _Team.findAllByNameIn("Red Sox, Yankees");

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllByInSimpleStringEmpty() {

		var teams = _Team.findAllByNameIn("");

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllByInArrayString() {

		var teams = _Team.findAllByNameIn([ "Red Sox", "Yankees" ]);

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllByInArrayStringEmpty() {

		var teams = _Team.findAllByNameIn([]);

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllByNotInSimple() {

		var teams = _Team.findAllByIDNotIn("1, 2");

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllByNotInSimpleEmpty() {

		var teams = _Team.findAllByIDNotIn("");

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllByNotInArray() {

		var teams = _Team.findAllByIDNotIn([ 1, 2 ]);

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllByNotInArrayEmpty() {

		var teams = _Team.findAllByIDNotIn([]);

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllByNotInSimpleString() {

		var teams = _Team.findAllByNameNotIn("Red Sox, Yankees");

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllByNotInSimpleStringEmpty() {

		var teams = _Team.findAllByNameNotIn("");

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllByNotInArrayString() {

		var teams = _Team.findAllByNameNotIn([ "Red Sox", "Yankees" ]);

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllByNotInArrayStringEmpty() {

		var teams = _Team.findAllByNameNotIn([]);

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereInSimple() {

		var teams = _Team.findAllWhere({
			id = [ "in", "1, 2" ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereInSimpleEmpty() {

		var teams = _Team.findAllWhere({
			id = [ "in", "" ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereInArray() {

		var teams = _Team.findAllWhere({
			id = [ "in", [ 1, 2 ] ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereInArrayEmpty() {

		var teams = _Team.findAllWhere({
			id = [ "in", [] ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereInSimpleString() {

		var teams = _Team.findAllWhere({
			name = [ "in", "Red Sox, Yankees" ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereInStringEmpty() {

		var teams = _Team.findAllWhere({
			name = [ "in", "" ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereInArrayString() {

		var teams = _Team.findAllWhere({
			name = [ "in", [ "Red Sox", "Yankees" ] ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereInArrayStringEmpty() {

		var teams = _Team.findAllWhere({
			name = [ "in", [] ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereNotInSimple() {

		var teams = _Team.findAllWhere({
			id = [ "notIn", "1, 2" ]
		});

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllWhereNotInSimpleEmpty() {

		var teams = _Team.findAllWhere({
			id = [ "notIn", "" ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereNotInArray() {

		var teams = _Team.findAllWhere({
			id = [ "notIn", [ 1, 2 ] ]
		});

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllWhereNotInArrayEmpty() {

		var teams = _Team.findAllWhere({
			id = [ "notIn", [] ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereNotInSimpleString() {

		var teams = _Team.findAllWhere({
			name = [ "notIn", "Red Sox, Yankees" ]
		});

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllWhereNotInSimpleStringEmpty() {

		var teams = _Team.findAllWhere({
			name = [ "notIn", "" ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereNotInArrayString() {

		var teams = _Team.findAllWhere({
			name = [ "notIn", [ "Red Sox", "Yankees" ] ]
		});

		assertEquals(arrayLen(teams), 4);

	}

	public function testFindAllWhereNotInArrayStringEmpty() {

		var teams = _Team.findAllWhere({
			name = [ "notIn", [] ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereInRelationshipSimple() {

		var teams = _Team.findAllWhere({
			city = [ "in", "1, 2" ]
		});

		assertEquals(arrayLen(teams), 3);

	}

	public function testFindAllWhereInRelationshipSimpleEmpty() {

		var teams = _Team.findAllWhere({
			city = [ "in", "" ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereInRelationshipArray() {

		var teams = _Team.findAllWhere({
			city = [ "in", [ 1, 2 ] ]
		});

		assertEquals(arrayLen(teams), 3);

	}

	public function testFindAllWhereInRelationshipArrayEmpty() {

		var teams = _Team.findAllWhere({
			city = [ "in", [] ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereInRelationshipSimpleString() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "in", "Boston, New York" ]
		});

		assertEquals(arrayLen(teams), 3);

	}

	public function testFindAllWhereInRelationshipSimpleStringEmpty() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "in", "" ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereInRelationshipArrayString() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "in", [ "Boston", "New York" ] ]
		});

		assertEquals(arrayLen(teams), 3);

	}

	public function testFindAllWhereInRelationshipArrayStringEmpty() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "in", [] ]
		});

		assertEquals(arrayLen(teams), 0);

	}

	public function testFindAllWhereNotInRelationshipSimple() {

		var teams = _Team.findAllWhere({
			city = [ "notIn", "1, 2" ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereNotInRelationshipSimpleEmpty() {

		var teams = _Team.findAllWhere({
			city = [ "notIn", "" ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereNotInRelationshipArray() {

		var teams = _Team.findAllWhere({
			city = [ "notIn", [ 1, 2 ] ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereNotInRelationshipArrayEmpty() {

		var teams = _Team.findAllWhere({
			city = [ "notIn", [] ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereNotInRelationshipSimpleString() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "notIn", "Boston, New York" ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereNotInRelationshipSimpleStringEmpty() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "notIn", "" ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testFindAllWhereNotInRelationshipArrayString() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "notIn", [ "Boston", "New York" ] ]
		});

		assertEquals(arrayLen(teams), 2);

	}

	public function testFindAllWhereNotInRelationshipArrayStringEmpty() {

		var teams = _Team.findAllWhere({
			"city.name" = [ "notIn", [] ]
		});

		assertEquals(arrayLen(teams), 6);

	}

	public function testGetAllSimple() {

		var teams = _Team.getAll("3,1,8,2");

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Red Sox");
		assertEqualsCase(teams[2].name(), "Cubs");
		assertEqualsCase(teams[3].name(), "Mets");

	}

	public function testGetAllEmpty() {

		var teams = _Team.getAll("");

		assertEquals(arrayLen(teams), 0);

	}

	public function testGetAllWithOptions() {

		var teams = _Team.getAll("3,1,8,2", {
			sort = "name",
			order = "asc"
		});

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	public function testGetAllSimpleArray() {

		var teams = _Team.getAll([3,1,8,2]);

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Red Sox");
		assertEqualsCase(teams[2].name(), "Cubs");
		assertEqualsCase(teams[3].name(), "Mets");

	}

	public function testGetAllArrayWithOptions() {

		var teams = _Team.getAll([3,1,8,2], {
			sort = "name",
			order = "asc"
		});

		assertEquals(arrayLen(teams), 3);
		assertEqualsCase(teams[1].name(), "Cubs");
		assertEqualsCase(teams[2].name(), "Mets");
		assertEqualsCase(teams[3].name(), "Red Sox");

	}

	public function testFindWhereNestedSimple() {

		var manager = _Manager.findWhere({
			"myTeam.CITY.NaMe" = "Boston"
		});

		assertTrue(manager.exists());
		assertEquals(manager.id(), 5);
		assertEqualsCase(manager.lastName(), "Francona");

	}

	public function testFindWhereNestedSimpleNone() {

		var manager = _Manager.findWhere({
			"myTeam.city.name" = "Minneapolis"
		});

		assertFalse(manager.exists());
		assertEquals(manager.id(), "");

	}

	public function testFindAllWhereNestedSimple() {

		var managers = _Manager.findAllWhere({
			"myTeam.city.name" = "New York"
		});

		assertEquals(arrayLen(managers), 2);

	}

	public function testFindAllWhereNestedSimpleNone() {

		var managers = _Manager.findAllWhere({
			"myTeam.city.name" = "Minneapolis"
		});

		assertEquals(arrayLen(managers), 0);

	}

	public function testFindWhereNestedRelationshipSimple() {

		var manager = _Manager.findWhere({
			"myTeam.city" = "1"
		});

		assertTrue(manager.exists());
		assertEquals(manager.id(), 5);
		assertEqualsCase(manager.lastName(), "Francona");

	}

	public function testFindAllWhereNestedRelationshipSingle() {

		var managers = _Manager.findAllWhere({
			"myTeam.city" = "1"
		});

		assertEquals(arrayLen(managers), 1);

	}

	public function testFindAllWhereNestedRelationshipMultiple() {

		var managers = _Manager.findAllWhere({
			"manager.myTeam.city" = "2"
		});

		assertEquals(arrayLen(managers), 2);

	}

	public function testFindAllWhereNestedRelationshipNone() {

		var managers = _Manager.findAllWhere({
			"myTeam.city.id" = "4"
		});

		assertEquals(arrayLen(managers), 0);

	}

	public function testFindSimple() {

		var team = _Team.find("from Team team where name = :name", {
			name = "Red Sox"
		});

		assertTrue(team.exists());
		assertEquals(team.id(), 3);
		assertEqualsCase(team.name(), "Red Sox");

	}

	public function testFindAllSimple() {

		var managers = _Manager.findAll("from Manager manager where firstName = :firstName", {
			firstName = "Terry"
		});

		assertEquals(arrayLen(managers), 2);

	}

	public function testCountWhereSimple() {

		var teams = _Team.countWhere({
			name = "Yankees"
		});

		assertEquals(teams, 1);

	}

	public function testCountWhereSimpleNone() {

		var teams = _Team.countWhere({
			name = "Twins"
		});

		assertEquals(teams, 0);

	}

	public function testCountWhereRelationshipSingle() {

		var teams = _Team.countWhere({
			city = 1
		});

		assertEquals(teams, 1);

	}

	public function testCountWhereRelationshipMultiple() {

		var teams = _Team.countWhere({
			city = 2
		});

		assertEquals(teams, 2);

	}

	public function testCountWhereRelationshipNone() {

		var teams = _Team.countWhere({
			city = 4
		});

		assertEquals(teams, 0);

	}

	public function testCountWhereRelationshipObjectSingle() {

		var city = _Team.get(1);
		var teams = _Team.countWhere({
			city = city
		});

		assertEquals(teams, 1);

	}

	public function testCountWhereRelationshipObjectMultiple() {

		var city = _Team.get(2);
		var teams = _Team.countWhere({
			city = city
		});

		assertEquals(teams, 2);

	}

	public function testCountWhereRelationshipObjectNone() {

		var city = _Team.get(4);
		var teams = _Team.countWhere({
			city = city
		});

		assertEquals(teams, 0);

	}

}