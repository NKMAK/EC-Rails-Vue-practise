import type { GetProductData } from "~/model/model";

export const getDisplayImageUrl = (product: GetProductData): string => {
  if (!product.product_images || product.product_images.length === 0) {
    return "/images/no-image.png";
  }

  return product.product_images[0].image.url;
};
