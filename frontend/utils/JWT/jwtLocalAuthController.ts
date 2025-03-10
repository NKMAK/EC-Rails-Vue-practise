import { jwtDecode } from "jwt-decode";
import { getAccessToken } from "../cokkie/getAccessToken";

export const jwtLocalAuthController = () => {
  //トークンが有効であればtrueを返す
  const jwtToken = getAccessToken();
  if (jwtToken == null) return false;

  try {
    const decoded = jwtDecode(jwtToken);

    if (decoded.exp == null) return false;

    return Date.now() < decoded.exp * 1000;
  } catch (error) {
    console.error("JWTのデコードに失敗しました:", error);
    return false;
  }
};
