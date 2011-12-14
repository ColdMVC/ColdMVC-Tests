/**
 * @extends mxunit.framework.TestCase
 */
component {

	public void function testSectionsIsAStruct() {

		var ini = getIni("config");
		var sections = ini.getSections();

		assertIsStruct(sections);

	}

	public void function testSectionsHasCorrectKeyCount() {

		var ini = getIni("config");
		var sections = ini.getSections();

		assertEquals(4, structCount(sections));

	}

	public void function testSimpleSectionIsAStruct() {

		var ini = getIni("config");
		var section = ini.getSection("production");

		assertIsStruct(section);

	}

	public void function testSimpleSectionHasCorrectKeyCount() {

		var ini = getIni("config");
		var section = ini.getSection("production");

		assertEquals(3, structCount(section));

	}

	public void function testInheritedSectionIsAStruct() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertIsStruct(section);

	}

	public void function testInheritedSectionHasCorrectKeyCount() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals(13, structCount(section));

	}

	public void function testInheritedSectionHasCorrectKeys() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals("true", section["development"]);
		assertEquals("development", section["environment"]);
		assertIsArray(section["array"]);
		assertEquals(3, arrayLen(section["array"]));
		assertIsStruct(section["struct"]);
		assertEquals(2, structCount(section["struct"]));
		assertEquals("true", section["yes"]);
		assertIsStruct(section["nested"]);
		assertTrue(3, structCount(section["nested"]));
		assertEquals("1", section["nested.foo"]);
		assertEquals("2", section["nested.bar"]);
		assertIsStruct(section["nested.baz"]);
		assertEquals(1, structCount(section["nested.baz"]));
		assertEquals("true", section["staging"]);
		assertEquals("true", section["testing"]);
		assertEquals("true", section["production"]);
		assertEquals("staging", section["foo"]);

	}

	public void function testPartiallyInheritedSectionHasCorrectKeyCount() {

		var ini = getIni("config");
		var section = ini.getSection("testing");

		assertEquals(5, structCount(section));

	}

	public void function testNestedPropertyExists() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "nested"));

	}

	public void function testNestedPropertyIsAStruct() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertIsStruct(section["nested"]);

	}

	public void function testNestedPropertyHasCorrectKeyCount() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals(3, structCount(section["nested"]));

	}

	public void function testNestedPropertyHasCorrectKeyValues() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals("1", section["nested"]["foo"]);
		assertEquals("2", section["nested"]["bar"]);

	}

	public void function testNestedPropertyHasCorrectKeys() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section["nested"], "foo"));
		assertTrue(structKeyExists(section["nested"], "bar"));

	}

	public void function testNestedPropertyStillExists() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "nested.foo"));
		assertTrue(structKeyExists(section, "nested.bar"));

	}

	public void function testJSONStructExists() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "struct"));

	}

	public void function testJSONStructIsAStruct() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertIsStruct(section["struct"]);

	}

	public void function testJSONStructHasCorrectKeyCount() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals(2, structCount(section["struct"]));

	}

	public void function testJSONStructHasCorrectKeys() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section["struct"], "1"));
		assertTrue(structKeyExists(section["struct"], "0"));

	}

	public void function testJSONStructHasCorrectKeyValues() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals(section["struct"]["1"], "yes");
		assertEquals(section["struct"]["0"], "no");

	}

	public void function testJSONArrayExists() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "array"));

	}

	public void function testJSONArrayIsAnArray() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertIsArray(section["array"]);

	}

	public void function testJSONStringIsABoolean() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals(section["yes"], "true");

	}

	public void function testInheritedValueExists() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "production"));

	}

	public void function testInheritedValueIsCorrect() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals("true", section["production"]);

	}

	public void function testOverriddenValueExists() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "environment"));

	}

	public void function testOverriddenValueIsCorrect() {

		var ini = getIni("config");
		var section = ini.getSection("development");

		assertEquals("development", section["environment"]);

	}

	public void function testSuper() {

		request.debug = true;
		var ini = getIni("super", "default");
		var section = ini.getSection("development");

		assertIsStruct(section);
		assertEquals(5, structCount(section));
		assertTrue(structKeyExists(section, "foo"));
		assertIsStruct(section["foo"]);
		assertTrue(structKeyExists(section["foo"], "default"));
		assertTrue(structKeyExists(section["foo"], "production"));
		assertTrue(structKeyExists(section["foo"], "development"));
		assertEquals("true", section["foo"]["default"]);
		assertEquals("true", section["foo"]["production"]);
		assertEquals("true", section["foo"]["development"]);
		assertTrue(structKeyExists(section, "foo.default"));
		assertTrue(structKeyExists(section, "foo.production"));
		assertTrue(structKeyExists(section, "foo.development"));
		assertEquals("true", section["foo.default"]);
		assertEquals("true", section["foo.production"]);
		assertEquals("true", section["foo.development"]);

	}

	private any function getIni(required string name, string super="") {

		return new coldmvc.config.Ini(expandPath("/test/config/#arguments.name#.ini"), arguments.super);

	}

}