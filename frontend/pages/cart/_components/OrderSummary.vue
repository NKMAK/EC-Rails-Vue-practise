<script setup lang="ts">
import type { Cart } from "~/model/model";
import { purchaseCart } from "~/service/cart/purchaseCart";

const props = defineProps<{
  cart: Cart;
}>();

const proceedToCheckout = async () => {
  const { success, text } = await purchaseCart();
  alert(success);
  if (success) {
    alert("ok");
    return navigateTo("/home");
  }
};
</script>
<template>
  <v-col cols="12" md="4">
    <v-card class="rounded-lg" elevation="2">
      <v-card-title class="text-lg font-medium pb-0">注文サマリー</v-card-title>
      <v-card-text>
        <div class="d-flex justify-space-between mb-4">
          <span class="text-body-1"
            >小計 ({{ props.cart.cart_items.length }}点):</span
          >
          <span class="text-h6"
            >¥{{ Number(props.cart.total_price).toLocaleString() }}</span
          >
        </div>
        <div class="d-flex justify-space-between mb-4">
          <span class="text-body-1">送料:</span>
          <span class="text-h6">無料</span>
        </div>
        <v-divider class="my-3"></v-divider>
        <div class="d-flex justify-space-between mb-4">
          <span class="text-h6 font-weight-bold">合計:</span>
          <span class="text-h5 font-weight-bold text-primary">
            ¥{{ Number(props.cart.total_price).toLocaleString() }}
          </span>
        </div>
        <v-btn
          block
          color="primary"
          size="large"
          class="text-none font-medium letter-spacing-1"
          @click="proceedToCheckout"
        >
          注文を確定する
        </v-btn>
        <v-btn block variant="text" class="mt-3" to="/home">
          ショッピングを続ける
        </v-btn>
      </v-card-text>
    </v-card>
  </v-col>
</template>
