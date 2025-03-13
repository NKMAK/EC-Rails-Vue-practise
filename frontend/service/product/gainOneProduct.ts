import type { GetProductData } from "~/model/model";

export const gainOneProduct = async (
  id: number
): Promise<GetProductData | null> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const url = new URL(
      runtimeConfig.public.baseApiUrl + "productOneGet?" + `id=${id}`
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
    return data;
  } catch (e) {
    return null;
  }
};
