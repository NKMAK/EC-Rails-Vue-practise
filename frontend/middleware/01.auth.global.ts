import { jwtLocalAuthController } from "~/utils/JWT/jwtLocalAuthController";

export default defineNuxtRouteMiddleware(async (to, from) => {
  const publicPages = ["/", "/auth"];
  if (publicPages.includes(to.path)) {
    return;
  }
  const resFlag = await jwtLocalAuthController();
  if (!resFlag) {
    return navigateTo("/auth");
  }
});
