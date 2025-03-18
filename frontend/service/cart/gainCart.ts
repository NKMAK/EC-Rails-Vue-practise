import type { Cart } from "~/model/model";

interface CartResponse {
  cart: Cart;
  success: boolean;
}

export const gainCart = async (): Promise<Cart | null> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const url = `${runtimeConfig.public.baseApiUrl}getCart`;
    const token = useCookie("access_token");
    const requestHeaders: HeadersInit = {
      "Content-Type": "application/json",
    };

    if (token) {
      requestHeaders["Cookie"] = "access_token=" + `${token.value}`;
    }

    const { data, error } = await useFetch<CartResponse>(url, {
      method: "get",
      headers: requestHeaders,

      credentials: "include",
    });

    return data.value!.cart;
  } catch (e) {
    return null;
  }
};
