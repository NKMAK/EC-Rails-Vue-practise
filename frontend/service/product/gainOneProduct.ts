import type { GetProductData } from "~/model/model";

export const gainOneProduct = async (
  id: number
): Promise<GetProductData | null> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const url = `${runtimeConfig.public.baseApiUrl}productOneGet?id=${id}`;
    const token = useCookie("access_token");
    const requestHeaders: HeadersInit = {
      "Content-Type": "application/json",
    };

    if (token) {
      requestHeaders["Cookie"] = "access_token=" + `${token.value}`;
    }

    const { data, error } = await useFetch<GetProductData>(url, {
      method: "get",
      headers: requestHeaders,

      credentials: "include",
    });

    return data.value;
  } catch (e) {
    return null;
  }
};
