import { jwtDecode, type JwtPayload } from "jwt-decode";
import { getAccessToken } from "../cookie/getAccessToken";
import { refreshToken } from "~/service/auth/refreshToken";

interface CustomJwtPayload extends JwtPayload {
  user_uuid: string;
}

export const jwtLocalAuthController = async (): Promise<boolean> => {
  //トークンが有効であればtrueを返す
  const jwtToken = getAccessToken();
  if (jwtToken == null) return false;

  try {
    const decoded = jwtDecode<CustomJwtPayload>(jwtToken);

    if (decoded.exp == null) return false;

    if (Date.now() < decoded.exp * 1000) {
      return true;
    } else {
      const resFlag = await refreshToken(decoded.user_uuid);
      return resFlag;
    }
  } catch (error) {
    console.error("ログイン処理に失敗しました:", error);
    return false;
  }
};
