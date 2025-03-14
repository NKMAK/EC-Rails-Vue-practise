<script setup lang="ts">
import { gainOneProduct } from "~/service/product/gainOneProduct";
import type { GetProductData } from "../../model/model";
import ImageSlider from "./_components/ImageSlider.vue";
import MainInfo from "./_components/MainInfo.vue";
import SubInfo from "./_components/SubInfo.vue";
const route = useRoute();
const productRef = ref<GetProductData | null>(null);
const priseRef = ref<string>("");

const res = await gainOneProduct(Number(route.params.id));
productRef.value = res;
priseRef.value = Intl.NumberFormat("ja-JP", {
  style: "currency",
  currency: "JPY",
}).format(Number(productRef.value!.price));
</script>

<template>
  <div v-if="productRef" class="product-detail">
    <v-container>
      <v-row>
        <ImageSlider :productImages="productRef.product_images"></ImageSlider>

        <v-col cols="12" md="6" class="product-info d-flex flex-column">
          <MainInfo :product="productRef"></MainInfo>
          <v-divider class="my-6"></v-divider>
          <SubInfo :product="productRef"></SubInfo>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>
