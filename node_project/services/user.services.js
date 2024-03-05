const UserModel = require("../model/user.model");
const jwt = require("jsonwebtoken");

class UserService {
    static async registerUser(email, password) {
        try {
            // Register the user
            const createUser = new UserModel();
            createUser.email = email;
            createUser.password = password;
            return await createUser.save();
        } catch (error) {
            throw error;
        }
    }

    static async checkUser(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (err) {
            throw err;
        }
    }

    static async generateToken(tokenData, secretKey, jwt_expire) {
        return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
    }
}

module.exports = UserService;
