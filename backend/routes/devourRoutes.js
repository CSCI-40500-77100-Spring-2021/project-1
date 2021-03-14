import { addNewUser, getUsers, getUserWithID, updateUser, deleteUser } from '../controllers/userControllers'; // import all controllers

const routes = (app) => {
	app.route('/users')
	// GET endpoint
		.get(getUsers)
	// POST endpoint
		.post(addNewUser); // executing addnewUser in Users folder

	app.route('/users/:UserId')
	// GET specific player
		.get(getUserWithID)
	// UPDATE specific player
		.put(updateUser)
	// DELETE specific player
		.delete(deleteUser);
}

export default routes;

