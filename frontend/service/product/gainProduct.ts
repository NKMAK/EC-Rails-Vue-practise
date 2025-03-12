import type { GetProductData } from "~/model/model";
interface ProductResponseData {
  product: GetProductData[];
  total: number;
}

export const gainProduct = async (
  limit: number,
  offset: number
): Promise<ProductResponseData> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const url = new URL(
      runtimeConfig.public.baseApiUrl +
        "productList?" +
        `product[limit]=${limit}` +
        `&product[offset]=${offset}`
    );

    const response = await fetch(url, {
      method: "get",
      headers: {
        "Content-Type": "application/json",
      },

      credentials: "include",
    });
    const data = await response.json();
    console.log(data);
    return { product: data.product_data, total: data.total };
  } catch (e) {
    return { product: [], total: 0 };
  }
};
