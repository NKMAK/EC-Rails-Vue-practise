<script setup lang="ts">
import type { ProductImageData } from "~/model/model";

const props = defineProps<{
  productImages: ProductImageData[];
}>();
</script>

<template>
  <v-col cols="12" md="6" class="product-images">
    <v-card elevation="4">
      <v-carousel>
        <v-carousel-item
          v-for="(image, i) in props.productImages || []"
          :key="image.id"
          :src="`http://localhost:8000/${image.image.url}`"
        ></v-carousel-item>
      </v-carousel>
    </v-card>
  </v-col>
</template>
