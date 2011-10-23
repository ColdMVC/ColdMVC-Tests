<cfscript>
add("/pagination/placeholder/:page/:sort?/:order?", "pagination.placeholder", {
	defaults = {
		page = 1
	},
	requirements = {
		page = "\d+"
	}
});

add("/pagination/static", "pagination.static");

add("/pagination/wildcard/*", "pagination.wildcard", {
	defaults = {
		page = 1
	}
});
</cfscript>