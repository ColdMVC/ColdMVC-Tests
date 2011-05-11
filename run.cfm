<cfif structKeyExists(variables, "test") and variables.test neq "">

	<cfset test = createObject("component", "test." & test) />

	<cfoutput>
	#test.runTestRemote()#
	</cfoutput>

<cfelse>

	<cfset runner = new mxunit.runner.DirectoryTestSuite() />

	<cfset results = runner.run(directory=expandPath('/test'), recurse=true, componentPath="test") />

	<cfoutput>
	#results.getHTMLResults()#
	</cfoutput>

</cfif>

