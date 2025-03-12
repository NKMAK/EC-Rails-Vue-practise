import type { GetProductData } from "~/model/model";
const imgBaseUrl: string = "http://localhost:8000/";
export const getDisplayImageUrl = (product: GetProductData): string => {
  if (
    !product.product_images ||
    product.product_images.length === 0 ||
    product.product_images[0].image.url == null
  ) {
    return "/images/no-image.png";
  }

  return imgBaseUrl + product.product_images[0].image.url;
};
