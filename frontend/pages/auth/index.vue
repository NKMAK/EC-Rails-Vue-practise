<script setup lang="ts">
import { ref } from "vue";
import LoginForm from "./_components/LoginForm.vue";
import SignupForm from "./_components/SignupForm.vue";
import type { LoginData, SignupData } from "./_models/model";

const tab = ref("login");

const handleLogin = (loginData: LoginData) => {
  console.log("ログイン処理", loginData);
};

const handleRegister = (registerData: SignupData) => {
  console.log("新規登録処理", registerData);
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
