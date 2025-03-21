interface Response {
  success: boolean;
  text: string;
}

export const purchaseCart = async (): Promise<Response> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const response = await fetch(runtimeConfig.public.baseApiUrl + "purchase", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    });
    const data: Response = await response.json();

    return data;
  } catch {
    return { success: false, text: "unexpected error" };
  }
};
