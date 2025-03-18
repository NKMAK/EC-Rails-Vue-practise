<script setup lang="ts">
import { gainProduct } from "~/service/product/gainProduct";
import ProductCard from "./_components/ProductCard.vue";

const currentPageRef = ref(1);
const itemsPerPage = 12;
const isPageChangeRef = ref(false);
const offset = computed(() => (currentPageRef.value - 1) * itemsPerPage);

const { data: productResponse } = useAsyncData(
  "products",
  () => gainProduct(itemsPerPage, offset.value, isPageChangeRef.value),
  {
    watch: [offset],
  }
);

const gainProductRef = computed(
  () => productResponse.value?.product_data || []
);
const totalProductCntRef = computed(() => productResponse.value?.total || 0);
const totalPages = computed(() =>
  Math.ceil(totalProductCntRef.value / itemsPerPage)
);

const handlePageChange = (page: number) => {
  isPageChangeRef.value = true;
  currentPageRef.value = page;
};
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
          <ProductCard :product="card" />
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
