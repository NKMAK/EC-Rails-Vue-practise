<script setup lang="ts">
import type { GetProductData } from "../../../model/model";
import { getDisplayImageUrl } from "../_function/getDisplayImageUrl";
const props = defineProps<{
  product: GetProductData;
}>();

const priceRef = ref<string>("");

onMounted(() => {
  priceRef.value = Intl.NumberFormat("ja-JP", {
    style: "currency",
    currency: "JPY",
  }).format(Number(props.product.price));
});
</script>

<template>
  <v-card max-width="400" class="mx-auto" elevation="2">
    <v-img
      :src="getDisplayImageUrl(props.product)"
      height="200"
      cover
      class="bg-grey-lighten-2"
    >
      <template v-slot:placeholder>
        <v-row class="fill-height ma-0" align="center" justify="center">
          <v-progress-circular
            indeterminate
            color="grey-lighten-5"
          ></v-progress-circular>
        </v-row>
      </template>
    </v-img>

    <v-card-title class="text-truncate">
      {{ product.title }}
    </v-card-title>

    <v-card-text>
      <div class="text-h6 font-weight-bold">
        {{ priceRef }}
      </div>
    </v-card-text>
  </v-card>
</template>
