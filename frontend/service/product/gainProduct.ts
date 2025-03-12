import type { GetProductData } from "~/model/model";

export const gainProduct = async (
  limit: number,
  offset: number
): Promise<GetProductData[] | null> => {
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
    return data.product_data;
  } catch (e) {
    return null;
  }
};
