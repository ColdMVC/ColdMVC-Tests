/**
 * @extends mxunit.framework.TestCase
 */
component {

	function beforeTests() {

		filePath = expandPath("/config/config.ini");
		ini = new coldmvc.app.util.Ini(filePath);

	}

	public function testSectionsIsAStruct() {

		var sections = ini.getSections();

		assertIsStruct(sections);

	}

	public function testSectionsHasCorrectKeyCount() {

		var sections = ini.getSections();

		assertEquals(structCount(sections), 4);

	}

	public function testSimpleSectionIsAStruct() {

		var section = ini.getSection("production");

		assertIsStruct(section);

	}

	public function testSimpleSectionHasCorrectKeyCount() {

		var section = ini.getSection("production");

		assertEquals(structCount(section), 3);

	}

	public function testInheritedSectionIsAStruct() {

		var section = ini.getSection("development");

		assertIsStruct(section);

	}

	public function testInheritedSectionHasCorrectKeyCount() {

		var section = ini.getSection("development");

		assertEquals(structCount(section), 13);

	}

	public function testInheritedSectionHasCorrectKeys() {

		var section = ini.getSection("development");

		assertEquals(section["development"], "true");
		assertEquals(section["environment"], "development");
		assertIsArray(section["array"]);
		assertTrue(arrayLen(section["array"]), 3);
		assertIsStruct(section["struct"]);
		assertTrue(structCount(section["struct"]), 2);
		assertEquals(section["yes"], "true");
		assertIsStruct(section["nested"]);
		assertTrue(structCount(section["nested"]), 3);
		assertEquals(section["nested.foo"], "1");
		assertEquals(section["nested.bar"], "2");
		assertIsStruct(section["nested.baz"]);
		assertTrue(structCount(section["nested.baz"]), 1);
		assertEquals(section["staging"], "true");
		assertEquals(section["testing"], "true");
		assertEquals(section["production"], "true");
		assertEquals(section["foo"], "staging");

	}

	public function testPartiallyInheritedSectionHasCorrectKeyCount() {

		var section = ini.getSection("testing");

		assertEquals(structCount(section), 5);

	}

	public function testNestedPropertyExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "nested"));

	}

	public function testNestedPropertyIsAStruct() {

		var section = ini.getSection("development");

		assertIsStruct(section["nested"]);

	}

	public function testNestedPropertyHasCorrectKeyCount() {

		var section = ini.getSection("development");

		assertEquals(structCount(section["nested"]), 3);

	}

	public function testNestedPropertyHasCorrectKeyValues() {

		var section = ini.getSection("development");

		assertEquals(section["nested"]["foo"], "1");
		assertEquals(section["nested"]["bar"], "2");

	}

	public function testNestedPropertyHasCorrectKeys() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section["nested"], "foo"));
		assertTrue(structKeyExists(section["nested"], "bar"));

	}

	public function testNestedPropertyStillExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "nested.foo"));
		assertTrue(structKeyExists(section, "nested.bar"));

	}

	public function testJSONStructExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "struct"));

	}

	public function testJSONStructIsAStruct() {

		var section = ini.getSection("development");

		assertIsStruct(section["struct"]);

	}

	public function testJSONStructHasCorrectKeyCount() {

		var section = ini.getSection("development");

		assertEquals(structCount(section["struct"]), 2);

	}

	public function testJSONStructHasCorrectKeys() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section["struct"], "1"));
		assertTrue(structKeyExists(section["struct"], "0"));

	}

	public function testJSONStructHasCorrectKeyValues() {

		var section = ini.getSection("development");

		assertEquals(section["struct"]["1"], "yes");
		assertEquals(section["struct"]["0"], "no");

	}

	public function testJSONArrayExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "array"));

	}

	public function testJSONArrayIsAnArray() {

		var section = ini.getSection("development");

		assertIsArray(section["array"]);

	}

	public function testJSONStringIsABoolean() {

		var section = ini.getSection("development");

		assertEquals(section["yes"], "true");

	}

	public function testInheritedValueExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "production"));

	}

	public function testInheritedValueIsCorrect() {

		var section = ini.getSection("development");

		assertEquals(section["production"], "true");

	}

	public function testOverriddenValueExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "environment"));

	}

	public function testOverriddenValueIsCorrect() {

		var section = ini.getSection("development");

		assertEquals(section["environment"], "development");

	}

}