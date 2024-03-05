const UserService = require("../services/user.services")

exports.register = async(req, res, next)=>{
    try {
        const {email, password} = req.body;
        const successRes = await UserService.registerUser(email, password);

        res.json({status: 200, successs: "User Successfully Registered"});
    } catch (error) {
        throw error
    }
}


exports.login = async(req, res, next)=>{
    try {
        const {email, password} = req.body;
        //if user exist
        const user = await UserService.checkUser(email);

        //if user does not exist, throw error
        if(!user){
            throw new Error("User don't exist");
        }
    

        const isMatch = await user.comparePassword(password);
        if(isMatch ==false){
            throw new Error("Password Invalid");
        }

        let tokenData =  {_id: user._id, email: user.email};

        const token = await UserService.generateToken(tokenData, "secretKey", "1h")
        res.status(200).json({status:true, token:token})
    } catch (error) {
        throw error
    }
}