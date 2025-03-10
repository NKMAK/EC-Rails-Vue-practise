<script setup lang="ts">
import { ref, computed } from "vue";
import type { SignupData } from "../../../model/model";
import { validationRules } from "../_function/validation";

const emit = defineEmits<{
  (e: "signupEvent", data: SignupData): void;
}>();

const name = ref("");
const email = ref("");
const password = ref("");
const confirmPassword = ref("");
const showPassword = ref(false);

const confirmPasswordRule = computed(() => {
  return (v: string) => v === password.value || "パスワードが一致しません";
});

const signup = () => {
  emit("signupEvent", {
    name: name.value,
    email: email.value,
    password: password.value,
  });
};
</script>

<template>
  <v-card-text>
    <v-form @submit.prevent="signup">
      <v-text-field
        v-model="name"
        label="ユーザー名"
        prepend-icon="mdi-account"
        required
        :rules="[validationRules.required]"
      />

      <v-text-field
        v-model="email"
        label="メールアドレス"
        prepend-icon="mdi-email"
        type="email"
        required
        :rules="[validationRules.required, validationRules.email]"
      />

      <v-text-field
        v-model="password"
        label="パスワード"
        prepend-icon="mdi-lock"
        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
        :type="showPassword ? 'text' : 'password'"
        required
        :rules="[validationRules.required]"
        @click:append="showPassword = !showPassword"
      />

      <v-text-field
        v-model="confirmPassword"
        label="パスワード（確認）"
        prepend-icon="mdi-lock-check"
        :type="showPassword ? 'text' : 'password'"
        required
        :rules="[validationRules.required, confirmPasswordRule]"
      />

      <v-btn type="submit" color="primary" block class="mt-4"> 新規登録 </v-btn>
    </v-form>
  </v-card-text>
</template>
