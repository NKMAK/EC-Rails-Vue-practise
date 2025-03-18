<script setup lang="ts">
import type { CartItem } from "~/model/model";

const props = defineProps<{
  cartItems: CartItem[];
}>();

const updateQuantity = (itemId: number, newQuantity: number) => {
  console.log(`商品ID ${itemId}の数量を${newQuantity}に更新`);
};

const removeItem = (itemId: number) => {
  console.log(`商品ID ${itemId}を削除`);
};
</script>

<template>
  <v-col cols="12" md="8">
    <v-card class="rounded-lg" elevation="2">
      <v-card-text>
        <v-list>
          <v-col v-for="(item, index) in props.cartItems" :key="item.id">
            <v-list-item class="pa-0">
              <v-row align="center">
                <v-col cols="3" sm="2" pt-8>
                  <v-img
                    v-if="item.product_images && item.product_images.length > 0"
                    :src="`http://localhost:8000${item.product_images[0].image.url}`"
                    :alt="item.product_title"
                    height="80"
                    class="rounded"
                    cover
                  ></v-img>
                </v-col>

                <v-col cols="6" sm="7">
                  <div class="d-flex flex-column">
                    <h3 class="text-subtitle-1 font-weight-bold mb-1">
                      {{ item.product_title }}
                    </h3>
                  </div>
                </v-col>

                <v-col cols="3" sm="2">
                  <v-select
                    v-model="item.quantity"
                    :items="[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
                    label="数量"
                    density="compact"
                    @update:model-value="updateQuantity(item.id, $event)"
                  ></v-select>
                </v-col>

                <v-col cols="9" sm="10">
                  <p class="text-right text-h6 font-weight-medium">
                    ¥{{ Number(item.price).toLocaleString() }}
                  </p>
                </v-col>

                <v-col cols="3" sm="2">
                  <v-btn
                    icon="mdi-delete-outline"
                    size="small"
                    color="grey"
                    variant="text"
                    aria-label="商品を削除"
                    @click="removeItem(item.id)"
                  ></v-btn>
                </v-col>
              </v-row>
            </v-list-item>
            <v-divider v-if="index < props.cartItems.length - 1"></v-divider>
          </v-col>
        </v-list>
      </v-card-text>
    </v-card>
  </v-col>
</template>
