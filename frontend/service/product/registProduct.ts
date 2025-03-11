import type { ProductData } from "~/model/model";

export const registProduct = async (
  productData: ProductData
): Promise<boolean> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const formData = new FormData();

    Object.entries(productData).forEach(([key, value]) => {
      if (key === "images" && Array.isArray(value)) {
        value.forEach((image) => {
          formData.append("product[images][]", image);
        });
      } else {
        formData.append(`product[${key}]`, String(value));
      }
    });

    // リクエスト送信
    const response = await fetch(
      runtimeConfig.public.baseApiUrl + "productRegist",
      {
        method: "POST",
        body: formData,
        credentials: "include",
      }
    );

    const data = await response.json();
    console.log(data);
    return true;
  } catch {
    return false;
  }
};
