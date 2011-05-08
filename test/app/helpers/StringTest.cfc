/**
 * @extends mxunit.framework.TestCase
 */
component {

	function beforeTests() {

		coldmvc = {
			string = new coldmvc.app.helpers.String()
		};

	}

	function testSingularizeProducts() {

		assertEqualsCase(coldmvc.string.singularize("products"), "product");

	}

	function testSingularizeCategories() {

		assertEqualsCase(coldmvc.string.singularize("categories"), "category");

	}

	function testSingularizePeople() {

		assertEqualsCase(coldmvc.string.singularize("people"), "person");

	}

	function testSingularizeWomen() {

		assertEqualsCase(coldmvc.string.singularize("women"), "woman");

	}

	function testSingularizeCamelCase() {

		assertEqualsCase(coldmvc.string.singularize("productCategories"), "productCategory");

	}

	function testSingularizeUnderscore() {

		assertEqualsCase(coldmvc.string.singularize("product_categories"), "product_category");

	}

	function testSingularizeHyphen() {

		assertEqualsCase(coldmvc.string.singularize("product-categories"), "product-category");

	}

	function testPluralizeProducts() {

		assertEqualsCase(coldmvc.string.pluralize("product"), "products");

	}

	function testPluralizeCategories() {

		assertEqualsCase(coldmvc.string.pluralize("category"), "categories");

	}

	function testPluralizePeople() {

		assertEqualsCase(coldmvc.string.pluralize("person"), "people");

	}

	function testPluralizeWomen() {

		assertEqualsCase(coldmvc.string.pluralize("woman"), "women");

	}

	function testPluralizeCamelCase() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory"), "productCategories");

	}

	function testPluralizeUnderscore() {

		assertEqualsCase(coldmvc.string.pluralize("product_category"), "product_categories");

	}

	function testPluralizeHyphen() {

		assertEqualsCase(coldmvc.string.pluralize("product-category"), "product-categories");

	}

	function testPluralizeProductsWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("product", 0), "products");

	}

	function testPluralizeCategoriesWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("category", 0), "categories");

	}

	function testPluralizePeopleWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("person", 0), "people");

	}

	function testPluralizeWomenWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("woman", 0), "women");

	}

	function testPluralizeCamelCaseWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory", 0), "productCategories");

	}

	function testPluralizeUnderscoreWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("product_category", 0), "product_categories");

	}

	function testPluralizeHyphenWithZeroCount() {

		assertEqualsCase(coldmvc.string.pluralize("product-category", 0), "product-categories");

	}

	function testPluralizeProductsWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("product", 1), "product");

	}

	function testPluralizeCategoriesWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("category", 1), "category");

	}

	function testPluralizePeopleWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("person", 1), "person");

	}

	function testPluralizeWomenWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("woman", 1), "woman");

	}

	function testPluralizeCamelCaseWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory", 1), "productCategory");

	}

	function testPluralizeUnderscoreWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("product_category", 1), "product_category");

	}

	function testPluralizeHyphenWithOneCount() {

		assertEqualsCase(coldmvc.string.pluralize("product-category", 1), "product-category");

	}

	function testPluralizeProductsWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("product", 2), "products");

	}

	function testPluralizeCategoriesWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("category", 2), "categories");

	}

	function testPluralizePeopleWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("person", 2), "people");

	}

	function testPluralizeWomenWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("woman", 2), "women");

	}

	function testPluralizeCamelCaseWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("productCategory", 2), "productCategories");

	}

	function testPluralizeUnderscoreWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("product_category", 2), "product_categories");

	}

	function testPluralizeHyphenWithMultipleCount() {

		assertEqualsCase(coldmvc.string.pluralize("product-category", 2), "product-categories");

	}

	function testCapitalizeSingleWord() {

		assertEqualsCase(coldmvc.string.capitalize("foo"), "Foo");

	}

	function testCapitalizeCamelCase() {

		assertEqualsCase(coldmvc.string.capitalize("fooBar"), "Foobar");

	}

	function testCapitalizeUnderscore() {

		assertEqualsCase(coldmvc.string.capitalize("foo_bar"), "Foo Bar");

	}

	function testCapitalizeHyphen() {

		assertEqualsCase(coldmvc.string.capitalize("foo-bar"), "Foo Bar");

	}

	function testCapitalizePhrase() {

		assertEqualsCase(coldmvc.string.capitalize("foo of bar"), "Foo of Bar");

	}

	function testCamelizeSingleWord() {

		assertEqualsCase(coldmvc.string.camelize("foo"), "foo");

	}

	function testCamelizeCamelCase() {

		assertEqualsCase(coldmvc.string.camelize("fooBar"), "fooBar");

	}

	function testCamelizePascalCase() {

		assertEqualsCase(coldmvc.string.camelize("FooBar"), "fooBar");

	}

	function testCamelizeUnderscore() {

		assertEqualsCase(coldmvc.string.camelize("foo_bar"), "fooBar");

	}

	function testCamelizeHyphen() {

		assertEqualsCase(coldmvc.string.camelize("foo-bar"), "fooBar");

	}

	function testCamelizePhrase() {

		assertEqualsCase(coldmvc.string.camelize("foo of bar"), "fooOfBar");

	}

	function testPascalizeSingleWord() {

		assertEqualsCase(coldmvc.string.pascalize("foo"), "Foo");

	}

	function testPascalizePascalCase() {

		assertEqualsCase(coldmvc.string.pascalize("FooBar"), "FooBar");

	}

	function testPascalizeCamelCase() {

		assertEqualsCase(coldmvc.string.pascalize("fooBar"), "FooBar");

	}

	function testPascalizeUnderscore() {

		assertEqualsCase(coldmvc.string.pascalize("foo_bar"), "FooBar");

	}

	function testPascalizeHyphen() {

		assertEqualsCase(coldmvc.string.pascalize("foo-bar"), "FooBar");

	}

	function testPascalizePhrase() {

		assertEqualsCase(coldmvc.string.pascalize("foo of bar"), "FooOfBar");

	}

	function testUpperfirstSingleWord() {

		assertEqualsCase(coldmvc.string.upperfirst("foo"), "Foo");

	}

	function testUpperfirstPascalCase() {

		assertEqualsCase(coldmvc.string.upperfirst("FooBar"), "FooBar");

	}

	function testUpperfirstCamelCase() {

		assertEqualsCase(coldmvc.string.upperfirst("fooBar"), "FooBar");

	}

	function testUpperfirstUpperUnderscore() {

		assertEqualsCase(coldmvc.string.upperfirst("Foo_Bar"), "Foo_Bar");

	}

	function testUpperfirstLowerUnderscore() {

		assertEqualsCase(coldmvc.string.upperfirst("foo_bar"), "Foo_bar");

	}

	function testUpperfirstUpperHyphen() {

		assertEqualsCase(coldmvc.string.upperfirst("Foo-Bar"), "Foo-Bar");

	}

	function testUpperfirstLowerHyphen() {

		assertEqualsCase(coldmvc.string.upperfirst("foo-bar"), "Foo-bar");

	}

	function testUpperfirstUpperPhrase() {

		assertEqualsCase(coldmvc.string.upperfirst("Foo Of Bar"), "Foo Of Bar");

	}

	function testUpperfirstLowerPhrase() {

		assertEqualsCase(coldmvc.string.upperfirst("foo of bar"), "Foo of bar");

	}

	function testLowerfirstSingleWord() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo"), "foo");

	}

	function testLowerfirstPascalCase() {

		assertEqualsCase(coldmvc.string.lowerfirst("FooBar"), "fooBar");

	}

	function testLowerfirstCamelCase() {

		assertEqualsCase(coldmvc.string.lowerfirst("fooBar"), "fooBar");

	}

	function testLowerfirstUpperUnderscore() {

		assertEqualsCase(coldmvc.string.lowerfirst("Foo_Bar"), "foo_Bar");

	}

	function testLowerfirstLowerUnderscore() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo_bar"), "foo_bar");

	}

	function testLowerfirstUpperHyphen() {

		assertEqualsCase(coldmvc.string.lowerfirst("Foo-Bar"), "foo-Bar");

	}

	function testLowerfirstLowerHyphen() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo-bar"), "foo-bar");

	}

	function testLowerfirstUpperPhrase() {

		assertEqualsCase(coldmvc.string.lowerfirst("Foo Of Bar"), "foo Of Bar");

	}

	function testLowerfirstLowerPhrase() {

		assertEqualsCase(coldmvc.string.lowerfirst("foo of bar"), "foo of bar");

	}

	function testHumanizeSingleWord() {

		assertEqualsCase(coldmvc.string.humanize("foo"), "Foo");

	}

	function testHumanizePascalCase() {

		assertEqualsCase(coldmvc.string.humanize("FooBar"), "Foobar");

	}

	function testHumanizeCamelCase() {

		assertEqualsCase(coldmvc.string.humanize("fooBar"), "Foobar");

	}

	function testHumanizeUpperUnderscore() {

		assertEqualsCase(coldmvc.string.humanize("Foo_Bar"), "Foo bar");

	}

	function testHumanizeLowerUnderscore() {

		assertEqualsCase(coldmvc.string.humanize("foo_bar"), "Foo bar");

	}

	function testHumanizeUpperHyphen() {

		assertEqualsCase(coldmvc.string.humanize("Foo-Bar"), "Foo bar");

	}

	function testHumanizeLowerHyphen() {

		assertEqualsCase(coldmvc.string.humanize("foo-bar"), "Foo bar");

	}

	function testHumanizeUpperPhrase() {

		assertEqualsCase(coldmvc.string.humanize("Foo Of Bar"), "Foo of bar");

	}

	function testHumanizeLowerPhrase() {

		assertEqualsCase(coldmvc.string.humanize("foo of bar"), "Foo of bar");

	}

	function testUnderscoreSingleWord() {

		assertEqualsCase(coldmvc.string.underscore("foo"), "foo");

	}

	function testUnderscorePascalCase() {

		assertEqualsCase(coldmvc.string.underscore("FooBar"), "foo_bar");

	}

	function testUnderscoreCamelCase() {

		assertEqualsCase(coldmvc.string.underscore("fooBar"), "foo_bar");

	}

	function testUnderscoreUpperUnderscore() {

		assertEqualsCase(coldmvc.string.underscore("Foo_Bar"), "foo_bar");

	}

	function testUnderscoreLowerUnderscore() {

		assertEqualsCase(coldmvc.string.underscore("foo_bar"), "foo_bar");

	}

	function testUnderscoreUpperHyphen() {

		assertEqualsCase(coldmvc.string.underscore("Foo-Bar"), "foo_bar");

	}

	function testUnderscoreLowerHyphen() {

		assertEqualsCase(coldmvc.string.underscore("foo-bar"), "foo_bar");

	}

	function testUnderscoreUpperPhrase() {

		assertEqualsCase(coldmvc.string.underscore("Foo Of Bar"), "foo_of_bar");

	}

	function testUnderscoreLowerPhrase() {

		assertEqualsCase(coldmvc.string.underscore("foo of bar"), "foo_of_bar");

	}

	function testUncamelizeSingleWord() {

		assertEqualsCase(coldmvc.string.uncamelize("foo"), "Foo");

	}

	function testUncamelizePascalCase() {

		assertEqualsCase(coldmvc.string.uncamelize("FooBar"), "Foo bar");

	}

	function testUncamelizeCamelCase() {

		assertEqualsCase(coldmvc.string.uncamelize("fooBar"), "Foo bar");

	}

	function testUncamelizeUpperUncamelize() {

		assertEqualsCase(coldmvc.string.uncamelize("Foo_Bar"), "Foo bar");

	}

	function testUncamelizeLowerUncamelize() {

		assertEqualsCase(coldmvc.string.uncamelize("foo_bar"), "Foo bar");

	}

	function testUncamelizeUpperHyphen() {

		assertEqualsCase(coldmvc.string.uncamelize("Foo-Bar"), "Foo bar");

	}

	function testUncamelizeLowerHyphen() {

		assertEqualsCase(coldmvc.string.uncamelize("foo-bar"), "Foo bar");

	}

	function testUncamelizeUpperPhrase() {

		assertEqualsCase(coldmvc.string.uncamelize("Foo Of Bar"), "Foo of bar");

	}

	function testUncamelizeLowerPhrase() {

		assertEqualsCase(coldmvc.string.uncamelize("foo of bar"), "Foo of bar");

	}

}