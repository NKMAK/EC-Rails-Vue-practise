<script setup lang="ts">
import { gainProduct } from "~/service/product/gainProduct";
import ProductCard from "./_components/ProductCard.vue";
import type { GetProductData } from "~/model/model";
const gainProductRef = ref<GetProductData[] | null>();
// サンプル商品データ

onMounted(async () => {
  const response = await gainProduct(10, 0);
  gainProductRef.value = response;
});
</script>

<template>
  <v-container class="pa-2">
    <v-card elevation="4">
      <v-row dense justify="center">
        <v-col
          v-for="(card, i) in gainProductRef || []"
          :key="card.id"
          cols="12"
          sm="6"
          md="4"
          lg="3"
          class="pa-3 pb-6 pt-6"
        >
          <ProductCard v-if="gainProductRef" :product="gainProductRef[i]" />
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>
