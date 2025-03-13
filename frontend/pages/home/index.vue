<script setup lang="ts">
import { gainProduct } from "~/service/product/gainProduct";
import ProductCard from "./_components/ProductCard.vue";
import type { GetProductData } from "~/model/model";

const gainProductRef = ref<GetProductData[] | null>(null);
const totalProductCntRef = ref<number>(0);

const currentPageRef = ref<number>(1);
const itemsPerPage = 12;
const totalPages = computed(() =>
  Math.ceil(totalProductCntRef.value / itemsPerPage)
);

const fetchProducts = async (page: number = 1) => {
  const offset = (page - 1) * itemsPerPage;

  const { product, total } = await gainProduct(itemsPerPage, offset);
  gainProductRef.value = product;
  totalProductCntRef.value = total;
};

const handlePageChange = (page: number) => {
  currentPageRef.value = page;
  fetchProducts(page);
};

onMounted(() => {
  fetchProducts();
});
</script>

<template>
  <v-container class="pa-2">
    <v-card elevation="4" class="mb-4">
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

    <div class="d-flex justify-center mt-4">
      <v-pagination
        v-model="currentPageRef"
        :length="totalPages"
        :total-visible="7"
        @update:model-value="handlePageChange"
      ></v-pagination>
    </div>
  </v-container>
</template>
