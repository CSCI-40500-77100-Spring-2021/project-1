import mongoose from 'mongoose';
//import { UserSchema } from '../models/userModel';
const User = require('../models/userModel');

//const User = mongoose.model('User', UserSchema);

// controllers are functions that interact with DB when we make a request to the API
// controller executes function in DB 

export const addNewUser = (req, res) => {
    let newUser = new User(req.body);

    newUser.save((err, User) => {
        if (err) {
            res.send(err);
        }
        res.json(User);
    });
};

export const getUsers = (req, res) => {

    User.find({},(err, User) => {
        if (err) {
            res.send(err);
        }
        res.json(User);
    });
};

export const getUserWithID = (req, res) => {
    User.findById(req.params.UserId,(err, User) => {
        if (err) {
            res.send(err);
        }
        res.json(User);
    });
};

export const updateUser = (req, res) => {
    User.findOneAndUpdate({ _id: req.params.UserId }, req.body, {new: true}, (err, User) => { 
    // _id: req.params.UserId - Find ID we want to update
    // req.body - then pass data we have in our body
    // findOneAndUpdate - updates data in DB 
    // {new:: true} - returns the updated user
        if (err) {
            res.send(err);
        }
        res.json(User);
    });
};

export const deleteUser = (req, res) => {
    User.remove({ _id: req.params.UserId },(err, User) => {
        if (err) {
            res.send(err);
        }
        res.json({ message: 'Successfully deleted the User'});
    });
};

