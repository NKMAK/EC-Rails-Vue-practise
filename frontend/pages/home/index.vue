<script setup lang="ts">
import ProductCard from "./_components/ProductCard.vue";

// サンプル商品データ
const sampleProduct = [
  {
    id: 1,
    title: "高級レザージャケット",
    price: "29800",
    product_images: [
      {
        id: 1,
        product_id: 1,
        image: {
          url: "http://localhost:8000/uploads/product_image/image/9/test1.jpeg",
        },
        display_order: 0,
      },
    ],
  },
  {
    id: 7,
    title: "あああ",
    description: "ええ",
    price: "123.0",
    stock_quantity: 3,
    active: true,
    created_at: "2025-03-11T00:54:37.924Z",
    updated_at: "2025-03-11T00:54:37.924Z",
    product_images: [
      {
        id: 1,
        product_id: 1,
        image: {
          url: "http://localhost:8000/uploads/product_image/image/10/test2.png",
        },
        display_order: 0,
      },
    ],
  },
];
</script>

<template>
  <v-container class="pa-2">
    <v-card elevation="4">
      <v-row dense justify="center">
        <v-col
          v-for="(card, i) in sampleProduct"
          :key="card.id"
          cols="12"
          sm="6"
          md="4"
          lg="3"
          class="pa-3 pb-6 pt-6"
        >
          <ProductCard :product="sampleProduct[i]" />
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>
