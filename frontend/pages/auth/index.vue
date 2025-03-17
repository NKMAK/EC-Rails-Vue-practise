<script setup lang="ts">
import { ref } from "vue";
import LoginForm from "./_components/LoginForm.vue";
import SignupForm from "./_components/SignupForm.vue";
import type { LoginData, SignupData } from "../../model/model";
import { signup } from "~/service/auth/signup";
import { login } from "~/service/auth/login";

onMounted(() => {});

const tab = ref("login");

const handleLogin = async (loginData: LoginData) => {
  console.log("ログイン処理", loginData);
  const res = await login(loginData);
  if (res) {
    navigateTo("/home");
  }
};

const handleRegister = async (signupData: SignupData) => {
  console.log("新規登録処理", signupData);
  const res = await signup(signupData);
  if (res) {
    navigateTo("/home");
  }
};
</script>

<template>
  <v-row class="justify-center">
    <v-col md="5" sm="9">
      <v-card class="my-4 text-center">
        <v-tabs v-model="tab">
          <v-tab value="login">ログイン</v-tab>
          <v-tab value="register">新規登録</v-tab>
        </v-tabs>

        <v-window v-model="tab">
          <v-window-item value="login">
            <LoginForm @loginEvent="handleLogin" />
          </v-window-item>

          <v-window-item value="register">
            <SignupForm @signupEvent="handleRegister" />
          </v-window-item>
        </v-window>
      </v-card>
    </v-col>
  </v-row>
</template>
