<cfparam name="directory" default="false" />

<cfif directory>

	<cfset runner = new mxunit.runner.DirectoryTestSuite() />

	<cfset class = "test.#test#" />
	<cfset path = replace(class, ".", "/", "all") />
	<cfset results = runner.run(expandPath("/" & path), class, true) />

	<cfoutput>
	#results.getHTMLResults()#
	</cfoutput>

<cfelse>

	<cfset test = createObject("component", "test." & test) />

	<cfoutput>
	#test.runTestRemote()#
	</cfoutput>

</cfif>