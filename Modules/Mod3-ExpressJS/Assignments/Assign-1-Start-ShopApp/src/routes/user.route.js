import express from "express";
import userController from "../controllers/user.controller.js";

const userRouter = express.Router();

userRouter.get("/", userController.getUsers);
userRouter.get("/:userId", userController.getUserById);

export default userRouter;

