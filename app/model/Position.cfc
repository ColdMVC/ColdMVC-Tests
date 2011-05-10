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
	 * @column Abbreviation
	 */
	property abbreviation;

	/**
	 * @fieldtype many-to-many
	 * @cfc Player
	 * @linktable Player_Position
	 * @fkcolumn Position_ID
	 * @inversejoincolumn Player_ID
	 * @lazy true
	 * @cascade all
	 */
	property players;

}