export const getAccessToken = (): string | null => {
  const cookies = document.cookie.split(";");
  for (let cookie of cookies) {
    const [name, value] = cookie.trim().split("=");
    if (name === "access_token") {
      return value;
    }
  }
  return null;
};
