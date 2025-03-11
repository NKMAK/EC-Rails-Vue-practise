<script setup lang="ts">
import { ref } from "vue";
import { validationRules } from "./_function/validationRules";
import type { ProductData } from "../../model/model";
import { registProduct } from "~/service/product/registProduct";

const product = ref<ProductData>({
  title: "",
  description: "",
  price: 0,
  stock_quantity: 0,
  active: true,
});

const submitForm = () => {
  registProduct(product.value);
};

const resetForm = () => {
  product.value = {
    title: "",
    description: "",
    price: 0,
    stock_quantity: 0,
    active: true,
  };
};
</script>

<template>
  <v-container>
    <v-card class="mx-auto mt-5" max-width="800">
      <v-card-title class="text-h5 font-weight-bold"> 商品登録 </v-card-title>

      <v-card-text>
        <v-form @submit.prevent="submitForm">
          <v-col cols="12">
            <v-text-field
              v-model="product.title"
              label="商品名"
              :rules="[validationRules.required]"
              variant="outlined"
              prepend-icon="mdi-shopping"
            ></v-text-field>
          </v-col>

          <v-col cols="12">
            <v-textarea
              v-model="product.description"
              label="商品説明"
              variant="outlined"
              rows="4"
              prepend-icon="mdi-text-box"
            ></v-textarea>
          </v-col>
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field
                v-model.number="product.price"
                label="価格"
                type="number"
                :rules="[validationRules.required, validationRules.price]"
                variant="outlined"
                prepend-icon="mdi-currency-jpy"
                suffix="円"
              ></v-text-field>
            </v-col>

            <v-col cols="12" md="6">
              <v-text-field
                v-model.number="product.stock_quantity"
                label="在庫数"
                type="number"
                :rules="[
                  validationRules.required,
                  validationRules.stockQuantity,
                ]"
                variant="outlined"
                prepend-icon="mdi-package-variant"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-col cols="12">
            <v-switch
              v-model="product.active"
              label="商品を公開する"
              color="success"
              hide-details
            ></v-switch>
          </v-col>

          <v-divider class="my-4"></v-divider>

          <v-row class="mt-2">
            <v-col class="d-flex justify-end">
              <v-btn
                color="error"
                variant="outlined"
                class="me-4"
                @click="resetForm"
              >
                リセット
              </v-btn>
              <v-btn color="primary" type="submit" variant="elevated">
                商品を登録
              </v-btn>
            </v-col>
          </v-row>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>
