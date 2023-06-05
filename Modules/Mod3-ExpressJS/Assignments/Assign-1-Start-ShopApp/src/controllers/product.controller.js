import productService from "../services/product.service.js";
import productDetailService from "../services/productDetail.service.js";

class ProductController {
  getAllProducts(req, res) {
    // const { storeId, status } = req.query;
    const allProducts = productService.getAllProducts();
    const { storeId, status } = req.query;
    let filterProducts = allProducts;

    if ( storeId && status ) {
        filterProducts = allProducts.filter((product) => {
            if(product.storeId === +storeId && product.status === status){
                return product;
            }
        })

    } else if(storeId && !status) {
        console.log("allProducts: ",  allProducts);
        filterProducts = allProducts.filter((product) => {
            return product.storeId === +storeId;
        })
    } else if(!storeId && status) {
        filterProducts = allProducts.filter((product) => {
            return product.status === status;
        })
    }

    for (const product of filterProducts) {
        product.productDetail = productDetailService.getProductDetailById(
            product.productDetailId
        );
    }

    return res.status(200).json({
      data: filterProducts
    });
  }
  getProductById(req, res) {
    const { productId } = req.params;
    const product = productService.getProductById(+productId);
    product.productDetail = productDetailService.getProductDetailById(
      product.productDetailId
    );
    return res.status(200).json({
      data: product,
    });
  }
}

export default new ProductController();