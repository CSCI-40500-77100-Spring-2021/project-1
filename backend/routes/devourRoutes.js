import { addNewUser, getUsers, getUserWithID } from '../controllers/userControllers'; // import all controllers

const routes = (app) => {
	app.route('/users')
	// GET endpoint
		.get(getUsers)
	// POST endpoint
		.post(addNewUser); // executing addnewUser in Users folder

	app.route('/users/:UserId')
		.get(getUserWithID)
}

export default routes;

