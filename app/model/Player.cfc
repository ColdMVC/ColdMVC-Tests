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
	 * @column First_Name
	 */
	property firstName;

	/**
	 * @column Last_Name
	 */
	property lastName;

	/**
	 * @fieldtype many-to-one
	 * @cfc app.model.Team
	 * @fkcolumn Team_ID
	 */
	property team;

	/**
	 * @fieldtype many-to-many
	 * @cfc app.model.Position
	 * @linktable Player_Position
	 * @fkcolumn Player_ID
	 * @inversejoincolumn Position_ID
	 * @lazy true
	 * @cascade all
	 */
	property positions;

}