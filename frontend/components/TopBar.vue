<script setup lang="ts">
const drawer = ref(false);
</script>

<template>
  <div>
    <v-app-bar :elevation="2">
      <template v-slot:prepend>
        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      </template>
      <v-app-bar-title>
        <NuxtLink to="/home" class="text-decoration-none color-black"
          >デモ：文章検索ECサイト</NuxtLink
        >
      </v-app-bar-title>
    </v-app-bar>

    <v-navigation-drawer v-model="drawer" temporary>
      <v-divider></v-divider>

      <v-list>
        <v-list-item>
          <NuxtLink to="/home">ホーム</NuxtLink>
        </v-list-item>
        <v-list-item>
          <NuxtLink to="/product-regist">商品登録</NuxtLink>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>
