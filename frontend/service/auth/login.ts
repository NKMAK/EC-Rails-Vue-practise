import type { LoginData } from "~/model/model";

export const login = async (loginData: LoginData): Promise<boolean> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const response = await fetch(runtimeConfig.public.baseApiUrl + "login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user: {
          email: loginData.email,
          password: loginData.password,
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
