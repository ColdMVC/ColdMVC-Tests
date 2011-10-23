/**
 * @extends coldmvc.Model
 * @persistent true
 */
component  {

	property id;

	/**
	 * @required { "message": "Please enter a first name." }
	 */
	property firstName;

	/**
	 * @required
	 */
	property lastName;

	/**
	 * @required
	 * @email
	 */
	property email;

	/**
	 * @required
	 */
	property gender;

	/**
	 * @required
	 * @date
	 */
	property birthDate;

	/**
	 * @range { "min": 18, "max": 25 }
	 */
	property age;

}