/**
* @extends coldmvc.Model
* @persistent true
*/
component  {

	/**
	 * @fieldtype id
	 * @generator native
	 * @column ID
	 */
	property id;

	/**
	 * @column Name
	 */
	property name;

	/**
	 * @fieldtype one-to-many
	 * @cfc app.model.Team
	 * @fkcolumn City_ID
	 */
	property teams;

}