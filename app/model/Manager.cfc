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
	 * @fieldtype one-to-one
	 * @cfc app.model.Team
	 * @mappedby manager
	 */
	property myTeam;

}