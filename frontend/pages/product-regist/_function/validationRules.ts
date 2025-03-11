export const validationRules = {
  required: (value: any) => !!value || "必須項目です",
  price: (value: number) =>
    value > 0 || "価格は0より大きい値を入力してください",
  stockQuantity: (value: number) =>
    value >= 0 || "在庫数は0以上を入力してください",
};
