import type { GetProductData } from "~/model/model";
interface ProductResponseData {
  product_data: GetProductData[];
  total: number;
}

export const gainProduct = async (
  limit: number,
  offset: number,
  pageChange: boolean
): Promise<ProductResponseData> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const urlString = `${runtimeConfig.public.baseApiUrl}productList?product[limit]=${limit}&product[offset]=${offset}`;
    const token = useCookie("access_token");

    const requestHeaders: HeadersInit = {
      "Content-Type": "application/json",
    };

    if (token) {
      requestHeaders["Cookie"] = "access_token=" + `${token.value}`;
    }

    if (pageChange) {
      const data = await $fetch<ProductResponseData>(urlString, {
        method: "GET",
        headers: requestHeaders,
        credentials: "include",
      });

      return { product_data: data.product_data, total: data.total };
    } else {
      const { data, error } = await useFetch<ProductResponseData>(urlString, {
        method: "GET",
        headers: requestHeaders,
        credentials: "include",
      });

      return {
        product_data: data.value!.product_data,
        total: data.value!.total,
      };
    }
  } catch (e) {
    return { product_data: [], total: 0 };
  }
};
