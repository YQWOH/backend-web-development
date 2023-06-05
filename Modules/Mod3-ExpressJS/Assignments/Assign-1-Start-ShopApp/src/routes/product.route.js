import express from "express";
import productController from "../controllers/product.controller.js";

const productRouter = express.Router();

productRouter.get("", productController.getAllProducts);
productRouter.get("/:productId", productController.getProductById);

export default productRouter;