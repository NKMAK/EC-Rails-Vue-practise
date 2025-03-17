<script setup lang="ts">
import type { GetProductData } from "../../../model/model";
import { addCart } from "~/service/cart/addCart";
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

const onClickAddCart = async () => {
  const res = await addCart({ productId: props.product.id, quanity: 1 });
  if (res.sucess) {
    alert("カートに追加しました。");
  } else {
    alert("カートに追加できませんでした。" + res.text);
  }
};
</script>

<template>
  <v-card elevation="4" class="pa-4">
    <h1 class="text-h4 font-weight-medium mb-2">
      {{ props.product.title }}
    </h1>

    <div class="mt-2 mb-6">
      <span class="text-h4 font-weight-bold">{{ priceRef }}</span>
      <v-chip
        :color="props.product.stock_quantity > 0 ? 'success' : 'error'"
        variant="elevated"
        class="ml-4"
        size="small"
      >
        {{ props.product.stock_quantity > 0 ? "在庫あり" : "在庫なし" }}
      </v-chip>
    </div>

    <div class="mb-6">
      <p class="text-body-1">
        {{ props.product.description || "商品の説明はありません。" }}
      </p>
    </div>

    <v-divider class="mb-6"></v-divider>

    <div>
      <v-btn
        color="primary"
        size="x-large"
        rounded="pill"
        block
        :disabled="props.product.stock_quantity <= 0"
        variant="flat"
        class="mb-4"
        @click="onClickAddCart"
      >
        <v-icon left class="mr-2">mdi-cart</v-icon>
        カートに追加
      </v-btn>

      <v-btn
        variant="outlined"
        color="primary"
        size="large"
        rounded="pill"
        block
        @click="$router.back()"
      >
        <v-icon left class="mr-2">mdi-arrow-left</v-icon>
        戻る
      </v-btn>
    </div>
  </v-card>
</template>
