<script setup lang="ts">
import type { GetProductData } from "~/model/model";

const props = defineProps<{
  product: GetProductData;
}>();
</script>

<template>
  <v-card elevation="4" class="pa-4">
    <div class="d-flex align-center mb-2">
      <v-icon color="grey" class="mr-2">mdi-clipboard-text</v-icon>
      <span class="text-subtitle-2 font-weight-medium">商品詳細</span>
    </div>

    <v-table density="compact">
      <tbody>
        <tr>
          <td class="text-caption font-weight-medium">在庫数</td>
          <td class="text-caption">{{ props.product.stock_quantity }}</td>
        </tr>
        <tr>
          <td class="text-caption font-weight-medium">登録日</td>
          <td class="text-caption">
            {{ new Date(props.product.created_at).toLocaleDateString() }}
          </td>
        </tr>
      </tbody>
    </v-table>
  </v-card>
</template>
