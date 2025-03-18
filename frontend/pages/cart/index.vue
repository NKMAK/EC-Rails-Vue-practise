<script setup lang="ts">
import type { Cart, CartItem } from "~/model/model";
import { gainCart } from "~/service/cart/gainCart";
import NoCart from "./_components/NoCart.vue";
import CartItems from "./_components/CartItems.vue";
import OrderSummary from "./_components/OrderSummary.vue";

const { data: cart } = useAsyncData<Cart | null>("cart", () => gainCart());

const getCartItems = (): CartItem[] => {
  return cart.value?.cart_items || [];
};
</script>

<template>
  <v-container class="max-w-screen-xl mx-auto">
    <v-row>
      <v-col cols="12">
        <h1 class="text-h4 mb-6 font-medium text-gray-800">
          ショッピングカート
        </h1>
      </v-col>
    </v-row>

    <NoCart v-if="!cart || getCartItems().length === 0" />

    <v-row v-else>
      <CartItems :cartItems="getCartItems()" />
      <OrderSummary :cart="cart" />
    </v-row>
  </v-container>
</template>
