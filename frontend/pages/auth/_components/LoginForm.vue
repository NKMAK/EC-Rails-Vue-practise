<script setup lang="ts">
import { ref } from "vue";
import type { LoginData } from "../../../model/model";
import { validationRules } from "../_function/validation";

const emit = defineEmits<{
  (e: "loginEvent", data: LoginData): void;
}>();

const email = ref("");
const password = ref("");
const showPassword = ref(false);

const login = () => {
  emit("loginEvent", {
    email: email.value,
    password: password.value,
  });
};
</script>

<template>
  <v-card-text>
    <v-form @submit.prevent="login">
      <v-text-field
        v-model="email"
        label="メールアドレス"
        prepend-icon="mdi-email"
        type="email"
        :rules="[validationRules.required, validationRules.email]"
      />

      <v-text-field
        v-model="password"
        label="パスワード"
        prepend-icon="mdi-lock"
        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
        :type="showPassword ? 'text' : 'password'"
        :rules="[validationRules.required]"
        @click:append="showPassword = !showPassword"
      />

      <v-btn type="submit" color="primary" block class="mt-4"> ログイン </v-btn>
    </v-form>
  </v-card-text>
</template>
