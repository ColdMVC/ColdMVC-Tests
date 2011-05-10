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
	 * @fieldtype one-to-many
	 * @cfc app.model.Player
	 * @fkcolumn Player_ID
	 */
	property players;

	/**
	 * @fieldtype one-to-one
	 * @cfc app.model.Manager
	 * @fkcolumn Manager_ID
	 */
	property manager;

	/**
	 * @fieldtype many-to-one
	 * @cfc app.model.City
	 * @fkcolumn City_ID
	 */
	property city;

}