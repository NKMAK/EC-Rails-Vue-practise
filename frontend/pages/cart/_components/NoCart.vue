<template>
  <v-row>
    <v-col cols="12">
      <v-card class="rounded-lg" elevation="2">
        <v-card-text class="text-center py-8">
          <v-icon size="x-large" class="mb-4">mdi-cart-outline</v-icon>
          <h3 class="text-h5 mb-2">カートは空です</h3>
          <p class="text-body-1">商品を追加してください</p>
          <v-btn color="primary" class="mt-4" to="/home">
            ショッピングを続ける
          </v-btn>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>
