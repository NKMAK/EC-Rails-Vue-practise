import { jwtDecode, type JwtPayload } from "jwt-decode";
import { getAccessToken } from "../cokkie/getAccessToken";
import { refreshToken } from "~/service/auth/refreshToken";

interface CustomJwtPayload extends JwtPayload {
  user_uuid: string;
}

export const jwtLocalAuthController = async () => {
  //トークンが有効であればtrueを返す
  const jwtToken = getAccessToken();
  if (jwtToken == null) return false;
  console.log(jwtToken);
  try {
    const decoded = jwtDecode<CustomJwtPayload>(jwtToken);
    console.log(decoded);

    if (decoded.exp == null) return false;

    if (Date.now() < decoded.exp * 1000) {
      return true;
    } else {
      const resFlag = await refreshToken(decoded.user_uuid);
      return resFlag;
    }
  } catch (error) {
    console.error("JWTのデコードに失敗しました:", error);
    return false;
  }
};
