import type { LoginData, SignupData } from "~/model/model";

const baseUrl = "http://localhost:8000/api/"; //TODO envファイルに記述
export const login = async (loginData: LoginData): Promise<boolean> => {
  try {
    const response = await fetch(baseUrl + "login", {
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
    });
    const data = await response.json();
    console.log(data);
    return true;
  } catch {
    return false;
  }
};

export const signup = async (signupData: SignupData): Promise<boolean> => {
  try {
    const response = await fetch(baseUrl + "signup", {
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

export const helthCheck = async () => {
  const response = await fetch(baseUrl + "up");
  console.log(response);
};
