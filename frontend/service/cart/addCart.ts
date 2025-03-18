import type { RequestAddCartModel } from "~/model/model";

interface Response {
  success: boolean;
  text: string;
}

export const addCart = async (
  params: RequestAddCartModel
): Promise<Response> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const response = await fetch(runtimeConfig.public.baseApiUrl + "addCart", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        product: {
          product_id: params.productId,
          quantity: params.quanity,
        },
      }),
      credentials: "include",
    });
    const data: Response = await response.json();

    return data;
  } catch {
    return { success: false, text: "unexpected error" };
  }
};
