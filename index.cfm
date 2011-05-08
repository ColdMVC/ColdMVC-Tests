<cfset filePath = expandPath("config.ini") />

<cfset testSuite = new mxunit.runner.DirectoryTestSuite() />

<cfset results = testSuite.run(directory=expandPath('/tests/test'), recurse=true, componentPath="tests.test") />

<cfoutput>
#results.getHTMLResults()#
</cfoutput>