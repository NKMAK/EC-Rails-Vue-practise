import type { ProductData } from "~/model/model";

export const registProduct = async (
  productData: ProductData
): Promise<boolean> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const response = await fetch(runtimeConfig.public.baseApiUrl + "product", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        product: {
          title: productData.title,
          description: productData.description,
          price: productData.price,
          stock_quantity: productData.stock_quantity,
          active: productData.active,
        },
      }),
      credentials: "include",
    });
    const data = await response.json();
    console.log(data);
    return true;
  } catch {
    return false;
  }
};
