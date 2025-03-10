export const refreshToken = async (uuid: string) => {
  const runtimeConfig = useRuntimeConfig();
  try {
    const response = await fetch(
      runtimeConfig.public.baseApiUrl + "refresh-token",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          user: {
            user_uuid: uuid,
          },
        }),
        credentials: "include",
      }
    );
    const data = await response.json();
    console.log(data);
    return true;
  } catch {
    return false;
  }
};
