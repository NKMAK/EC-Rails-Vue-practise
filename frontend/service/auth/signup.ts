import type { SignupData } from "~/model/model";

export const signup = async (signupData: SignupData): Promise<boolean> => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const response = await fetch(runtimeConfig.public.baseApiUrl + "signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user: {
          username: signupData.name,
          email: signupData.email,
          password: signupData.password,
        },
      }),
    });
    const data = await response.json();
    console.log(data);
    return true;
  } catch {
    return false;
  }
};
