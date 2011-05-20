/**
 * @extends coldmvc.app.test.MXUnit
 */
component {

	private function seed() {

		var cities = _City.count();

		if (cities == 0) {

			var boston = _City.findByName("Boston").populate({name = "Boston"});
			var chicago = _City.findByName("Chicago").populate({name = "Chicago"});
			var newYork = _City.findByName("New York").populate({name = "New York"});

			var cubs = _Team.findByName("Cubs").populate({name = "Cubs", abbreviation = "CHC"});
			var mets = _Team.findByName("Mets").populate({name = "Mets", abbreviation = "NYM"});
			var redSox = _Team.findByName("Red Sox").populate({name = "Red Sox", abbreviation = "BOS"});
			var whiteSox = _Team.findByName("White Sox").populate({name = "White Sox", abbreviation = "CHW"});
			var yankees = _Team.findByName("Yankees").populate({name = "Yankees", abbreviation = "NYY"});

			var joeGirardi = _Manager.findWhere({firstName = "Joe", lastName = "Girardi"}).populate({firstName = "Joe", lastName = "Girardi"});
			var mikeQuade = _Manager.findWhere({firstName = "Mike", lastName = "Quade"}).populate({firstName = "Mike", lastName = "Quade"});
			var ozzieGuillen = _Manager.findWhere({firstName = "Ozzie", lastName = "Guillen"}).populate({firstName = "Ozzie", lastName = "Guillen"});
			var terryCollins = _Manager.findWhere({firstName = "Terry", lastName = "Collins"}).populate({firstName = "Terry", lastName = "Collins"});
			var terryFrancona = _Manager.findWhere({firstName = "Terry", lastName = "Francona"}).populate({firstName = "Terry", lastName = "Francona"});
			var joeTorre = _Manager.findWhere({firstName = "Joe", lastName = "Torre"}).populate({firstName = "Joe", lastName = "Torre"});

			var startingPitcher = _Position.findWhere({abbreviation = "SP"}).populate({name = "Starting Pitcher", abbreviation = "SP"});
			var reliefPitcher = _Position.findWhere({abbreviation = "RP"}).populate({name = "Relief Pitcher", abbreviation = "RP"});
			var catcher = _Position.findWhere({abbreviation = "C"}).populate({name = "Catcher", abbreviation = "C"});
			var firstBase = _Position.findWhere({abbreviation = "1B"}).populate({name = "First Base", abbreviation = "1B"});
			var secondBase = _Position.findWhere({abbreviation = "2B"}).populate({name = "Second Base", abbreviation = "2B"});
			var thirdBase = _Position.findWhere({abbreviation = "3B"}).populate({name = "Third Base", abbreviation = "3B"});
			var shortStop = _Position.findWhere({abbreviation = "SS"}).populate({name = "Shortstop", abbreviation = "SS"});
			var leftField = _Position.findWhere({abbreviation = "LF"}).populate({name = "Left Field", abbreviation = "LF"});
			var centerField = _Position.findWhere({abbreviation = "CF"}).populate({name = "Center Field", abbreviation = "CF"});
			var rightField = _Position.findWhere({abbreviation = "RF"}).populate({name = "Right Field", abbreviation = "RF"});

			boston.teams([redSox]);
			chicago.teams([cubs, whiteSox]);
			newYork.teams([mets, yankees]);

			cubs.city(chicago);
			mets.city(newYork);
			redSox.city(boston);
			whiteSox.city(chicago);
			yankees.city(newYork);

			cubs.manager(mikeQuade);
			mets.manager(terryCollins);
			redSox.manager(terryFrancona);
			whiteSox.manager(ozzieGuillen);
			yankees.manager(joeGirardi);

			joeGirardi.team(yankees);
			mikeQuade.team(cubs);
			ozzieGuillen.team(whiteSox);
			terryCollins.team(mets);
			terryFrancona.team(redSox);

			startingPitcher.save(false);
			reliefPitcher.save(false);
			catcher.save(false);
			firstBase.save(false);
			secondBase.save(false);
			thirdBase.save(false);
			shortStop.save(false);
			leftField.save(false);
			centerField.save(false);
			rightField.save(false);

			joeGirardi.save(false);
			mikeQuade.save(false);
			ozzieGuillen.save(false);
			terryCollins.save(false);
			terryFrancona.save(false);
			joeTorre.save(false);

			cubs.save(false);
			mets.save(false);
			redSox.save(false);
			whiteSox.save(false);
			yankees.save(false);

			boston.save(false);
			chicago.save(false);
			newYork.save(false);

			ormFlush();

		}

	}

}
