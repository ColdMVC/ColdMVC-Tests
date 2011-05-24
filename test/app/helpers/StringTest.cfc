/**
 * @extends mxunit.framework.TestCase
 */
component {

	function beforeTests() {

		coldmvc = {
			string = new coldmvc.app.helpers.String()
		};

	}

	public function testSingularizeProducts() {

		assertEqualsCase(coldmvc.string.singularize("products"), "product");

	}

	public function testSingularizeCategories() {

		assertEqualsCase(coldmvc.string.singularize("categories"), "category");

	}

	public function testSingularizePeople() {

		assertEqualsCase(coldmvc.string.singularize("people"), "person");

	}

	public function testSingularizeWomen() {

		assertEqualsCase(coldmvc.string.singularize("women"), "woman");

	}

	public function testSingularizeCamelCase() {

		assertEqualsCase(coldmvc.string.singularize("productCategories"), "productCategory");

	}

	public function testSingularizeUnderscore() {

		assertEqualsCase(coldmvc.string.singularize("product_categories"), "product_category");

	}

	public function testSingularizeHyphen() {

		assertEqualsCase(coldmvc.string.singularize("product-categories"), "product-category");

	}

	public function testPluralizeProducts() {

		assertEqualsCase(coldmvc.string.pluralize("product"), "products");

	}

	public function testPluralizeCategories() {

		assertEqualsCase(coldmvc.string.pluralize("category"), "categories");

	}

	public function testPluralizePeople() {

		assertEqualsCase(coldmvc.string.pluralize("person"), "people");

	}

	public function testPluralizeWomen() {

		assertEqualsCase(coldmvc.string.pluralize("woman"), "women");

	}

	public function testPluralizeCamelCase() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory"), "productCategories");

	}

	public function testPluralizeUnderscore() {

		assertEqualsCase(coldmvc.string.pluralize("product_category"), "product_categories");

	}

	public function testPluralizeHyphen() {

		assertEqualsCase(coldmvc.string.pluralize("product-category"), "product-categories");

	}

	public function testPluralizeProductsWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("product", 0), "products");

	}

	public function testPluralizeCategoriesWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("category", 0), "categories");

	}

	public function testPluralizePeopleWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("person", 0), "people");

	}

	public function testPluralizeWomenWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("woman", 0), "women");

	}

	public function testPluralizeCamelCaseWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory", 0), "productCategories");

	}

	public function testPluralizeUnderscoreWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("product_category", 0), "product_categories");

	}

	public function testPluralizeHyphenWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("product-category", 0), "product-categories");

	}

	public function testPluralizeProductsWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("product", 1), "product");

	}

	public function testPluralizeCategoriesWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("category", 1), "category");

	}

	public function testPluralizePeopleWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("person", 1), "person");

	}

	public function testPluralizeWomenWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("woman", 1), "woman");

	}

	public function testPluralizeCamelCaseWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory", 1), "productCategory");

	}

	public function testPluralizeUnderscoreWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("product_category", 1), "product_category");

	}

	public function testPluralizeHyphenWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("product-category", 1), "product-category");

	}

	public function testPluralizeProductsWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("product", 2), "products");

	}

	public function testPluralizeCategoriesWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("category", 2), "categories");

	}

	public function testPluralizePeopleWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("person", 2), "people");

	}

	public function testPluralizeWomenWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("woman", 2), "women");

	}

	public function testPluralizeCamelCaseWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory", 2), "productCategories");

	}

	public function testPluralizeUnderscoreWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("product_category", 2), "product_categories");

	}

	public function testPluralizeHyphenWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("product-category", 2), "product-categories");

	}

	public function testCapitalizeSingleWord() {

		assertEqualsCase(coldmvc.string.capitalize("foo"), "Foo");

	}

	public function testCapitalizeCamelCase() {

		assertEqualsCase(coldmvc.string.capitalize("fooBar"), "Foobar");

	}

	public function testCapitalizeUnderscore() {

		assertEqualsCase(coldmvc.string.capitalize("foo_bar"), "Foo Bar");

	}

	public function testCapitalizeHyphen() {

		assertEqualsCase(coldmvc.string.capitalize("foo-bar"), "Foo Bar");

	}

	public function testCapitalizePhrase() {

		assertEqualsCase(coldmvc.string.capitalize("foo of bar"), "Foo of Bar");

	}

	public function testCamelizeSingleWord() {

		assertEqualsCase(coldmvc.string.camelize("foo"), "foo");

	}

	public function testCamelizeCamelCase() {

		assertEqualsCase(coldmvc.string.camelize("fooBar"), "fooBar");

	}

	public function testCamelizePascalCase() {

		assertEqualsCase(coldmvc.string.camelize("FooBar"), "fooBar");

	}

	public function testCamelizeUnderscore() {

		assertEqualsCase(coldmvc.string.camelize("foo_bar"), "fooBar");

	}

	public function testCamelizeHyphen() {

		assertEqualsCase(coldmvc.string.camelize("foo-bar"), "fooBar");

	}

	public function testCamelizePhrase() {

		assertEqualsCase(coldmvc.string.camelize("foo of bar"), "fooOfBar");

	}

	public function testPascalizeSingleWord() {

		assertEqualsCase(coldmvc.string.pascalize("foo"), "Foo");

	}

	public function testPascalizePascalCase() {

		assertEqualsCase(coldmvc.string.pascalize("FooBar"), "FooBar");

	}

	public function testPascalizeCamelCase() {

		assertEqualsCase(coldmvc.string.pascalize("fooBar"), "FooBar");

	}

	public function testPascalizeUnderscore() {

		assertEqualsCase(coldmvc.string.pascalize("foo_bar"), "FooBar");

	}

	public function testPascalizeHyphen() {

		assertEqualsCase(coldmvc.string.pascalize("foo-bar"), "FooBar");

	}

	public function testPascalizePhrase() {

		assertEqualsCase(coldmvc.string.pascalize("foo of bar"), "FooOfBar");

	}

	public function testUpperfirstSingleWord() {

		assertEqualsCase(coldmvc.string.upperfirst("foo"), "Foo");

	}

	public function testUpperfirstPascalCase() {

		assertEqualsCase(coldmvc.string.upperfirst("FooBar"), "FooBar");

	}

	public function testUpperfirstCamelCase() {

		assertEqualsCase(coldmvc.string.upperfirst("fooBar"), "FooBar");

	}

	public function testUpperfirstUpperUnderscore() {

		assertEqualsCase(coldmvc.string.upperfirst("Foo_Bar"), "Foo_Bar");

	}

	public function testUpperfirstLowerUnderscore() {

		assertEqualsCase(coldmvc.string.upperfirst("foo_bar"), "Foo_bar");

	}

	public function testUpperfirstUpperHyphen() {

		assertEqualsCase(coldmvc.string.upperfirst("Foo-Bar"), "Foo-Bar");

	}

	public function testUpperfirstLowerHyphen() {

		assertEqualsCase(coldmvc.string.upperfirst("foo-bar"), "Foo-bar");

	}

	public function testUpperfirstUpperPhrase() {

		assertEqualsCase(coldmvc.string.upperfirst("Foo Of Bar"), "Foo Of Bar");

	}

	public function testUpperfirstLowerPhrase() {

		assertEqualsCase(coldmvc.string.upperfirst("foo of bar"), "Foo of bar");

	}

	public function testLowerfirstSingleWord() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo"), "foo");

	}

	public function testLowerfirstPascalCase() {

		assertEqualsCase(coldmvc.string.lowerfirst("FooBar"), "fooBar");

	}

	public function testLowerfirstCamelCase() {

		assertEqualsCase(coldmvc.string.lowerfirst("fooBar"), "fooBar");

	}

	public function testLowerfirstUpperUnderscore() {

		assertEqualsCase(coldmvc.string.lowerfirst("Foo_Bar"), "foo_Bar");

	}

	public function testLowerfirstLowerUnderscore() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo_bar"), "foo_bar");

	}

	public function testLowerfirstUpperHyphen() {

		assertEqualsCase(coldmvc.string.lowerfirst("Foo-Bar"), "foo-Bar");

	}

	public function testLowerfirstLowerHyphen() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo-bar"), "foo-bar");

	}

	public function testLowerfirstUpperPhrase() {

		assertEqualsCase(coldmvc.string.lowerfirst("Foo Of Bar"), "foo Of Bar");

	}

	public function testLowerfirstLowerPhrase() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo of bar"), "foo of bar");

	}

	public function testHumanizeSingleWord() {

		assertEqualsCase(coldmvc.string.humanize("foo"), "Foo");

	}

	public function testHumanizePascalCase() {

		assertEqualsCase(coldmvc.string.humanize("FooBar"), "Foobar");

	}

	public function testHumanizeCamelCase() {

		assertEqualsCase(coldmvc.string.humanize("fooBar"), "Foobar");

	}

	public function testHumanizeUpperUnderscore() {

		assertEqualsCase(coldmvc.string.humanize("Foo_Bar"), "Foo bar");

	}

	public function testHumanizeLowerUnderscore() {

		assertEqualsCase(coldmvc.string.humanize("foo_bar"), "Foo bar");

	}

	public function testHumanizeUpperHyphen() {

		assertEqualsCase(coldmvc.string.humanize("Foo-Bar"), "Foo bar");

	}

	public function testHumanizeLowerHyphen() {

		assertEqualsCase(coldmvc.string.humanize("foo-bar"), "Foo bar");

	}

	public function testHumanizeUpperPhrase() {

		assertEqualsCase(coldmvc.string.humanize("Foo Of Bar"), "Foo of bar");

	}

	public function testHumanizeLowerPhrase() {

		assertEqualsCase(coldmvc.string.humanize("foo of bar"), "Foo of bar");

	}

	public function testUnderscoreSingleWord() {

		assertEqualsCase(coldmvc.string.underscore("foo"), "foo");

	}

	public function testUnderscorePascalCase() {

		assertEqualsCase(coldmvc.string.underscore("FooBar"), "foo_bar");

	}

	public function testUnderscoreCamelCase() {

		assertEqualsCase(coldmvc.string.underscore("fooBar"), "foo_bar");

	}

	public function testUnderscoreUpperUnderscore() {

		assertEqualsCase(coldmvc.string.underscore("Foo_Bar"), "foo_bar");

	}

	public function testUnderscoreLowerUnderscore() {

		assertEqualsCase(coldmvc.string.underscore("foo_bar"), "foo_bar");

	}

	public function testUnderscoreUpperHyphen() {

		assertEqualsCase(coldmvc.string.underscore("Foo-Bar"), "foo_bar");

	}

	public function testUnderscoreLowerHyphen() {

		assertEqualsCase(coldmvc.string.underscore("foo-bar"), "foo_bar");

	}

	public function testUnderscoreUpperPhrase() {

		assertEqualsCase(coldmvc.string.underscore("Foo Of Bar"), "foo_of_bar");

	}

	public function testUnderscoreLowerPhrase() {

		assertEqualsCase(coldmvc.string.underscore("foo of bar"), "foo_of_bar");

	}

	public function testUncamelizeSingleWord() {

		assertEqualsCase(coldmvc.string.uncamelize("foo"), "Foo");

	}

	public function testUncamelizePascalCase() {

		assertEqualsCase(coldmvc.string.uncamelize("FooBar"), "Foo bar");

	}

	public function testUncamelizeCamelCase() {

		assertEqualsCase(coldmvc.string.uncamelize("fooBar"), "Foo bar");

	}

	public function testUncamelizeUpperUncamelize() {

		assertEqualsCase(coldmvc.string.uncamelize("Foo_Bar"), "Foo bar");

	}

	public function testUncamelizeLowerUncamelize() {

		assertEqualsCase(coldmvc.string.uncamelize("foo_bar"), "Foo bar");

	}

	public function testUncamelizeUpperHyphen() {

		assertEqualsCase(coldmvc.string.uncamelize("Foo-Bar"), "Foo bar");

	}

	public function testUncamelizeLowerHyphen() {

		assertEqualsCase(coldmvc.string.uncamelize("foo-bar"), "Foo bar");

	}

	public function testUncamelizeUpperPhrase() {

		assertEqualsCase(coldmvc.string.uncamelize("Foo Of Bar"), "Foo of bar");

	}

	public function testUncamelizeLowerPhrase() {

		assertEqualsCase(coldmvc.string.uncamelize("foo of bar"), "Foo of bar");

	}

	public function testPropercaseSingleWord() {

		assertEqualsCase(coldmvc.string.propercase("foo"), "Foo");

	}

	public function testPropercaseCamelCase() {

		assertEqualsCase(coldmvc.string.propercase("fooBar"), "Foo Bar");

	}

	public function testPropercasePascalCase() {

		assertEqualsCase(coldmvc.string.propercase("FooBar"), "Foo Bar");

	}

	public function testPropercaseUnderscore() {

		assertEqualsCase(coldmvc.string.propercase("foo_bar"), "Foo Bar");

	}

	public function testPropercaseHyphen() {

		assertEqualsCase(coldmvc.string.propercase("foo-bar"), "Foo Bar");

	}

	public function testPropercasePhrase() {

		assertEqualsCase(coldmvc.string.propercase("foo of bar"), "Foo of Bar");

	}

	public function testSingularOrPluralOne() {

		assertEqualsCase(coldmvc.string.singularOrPlural(1, "foo", "bar", "baz"), "foo");

	}

	public function testSingularOrPluralThree() {

		assertEqualsCase(coldmvc.string.singularOrPlural(3, "foo", "bar", "baz"), "bar");

	}

	public function testSingularOrPluralZero() {

		assertEqualsCase(coldmvc.string.singularOrPlural(0, "foo", "bar", "baz"), "baz");

	}

	public function testSingularOrPluralZeroDefault() {

		assertEqualsCase(coldmvc.string.singularOrPlural(0, "foo", "bar"), "bar");

	}

	public function testSingularOrPluralTwoDefault() {

		assertEqualsCase(coldmvc.string.singularOrPlural(3, "product"), "products");

	}

}