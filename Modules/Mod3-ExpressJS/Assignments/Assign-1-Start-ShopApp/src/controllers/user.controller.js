import userService from "../services/user.service.js"

class UserController {
    getUsers(req, res) {
        return res.status(200).json({
            data: userService.getAllUsers()
        })
    };
    getUserById(req, res) {
        const { userId } = req.params;
        return res.status(200).json({
            data: userService.getUserById(+userId)
        })
    };
}

export default new UserController;