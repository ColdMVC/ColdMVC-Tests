<cfif find("Test", test)>

	<cfset test = createObject("component", "test." & test) />

	<cfoutput>
	#test.runTestRemote()#
	</cfoutput>

<cfelse>

	<cfset runner = new mxunit.runner.DirectoryTestSuite() />

	<cfset class = "test.#test#" />
	<cfset path = replace(class, ".", "/", "all") />
	<cfset results = runner.run(expandPath("/" & path), class, true) />

	<cfoutput>
	#results.getHTMLResults()#
	</cfoutput>

</cfif>