export const getAccessToken = (): string | null => {
  const accessToken = useCookie("access_token");
  return accessToken.value || null;
};
