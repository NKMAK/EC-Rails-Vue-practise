export const validationRules = {
  required: (v: string) => !!v || "必須項目です",
  email: (v: string) =>
    /.+@.+\..+/.test(v) || "有効なメールアドレスを入力してください",
};
