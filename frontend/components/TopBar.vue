<script setup lang="ts">
const isDrawerRef = ref(false);
</script>

<template>
  <div>
    <v-app-bar :elevation="2">
      <template v-slot:prepend>
        <v-app-bar-nav-icon
          @click="isDrawerRef = !isDrawerRef"
        ></v-app-bar-nav-icon>
      </template>
      <v-app-bar-title>
        <NuxtLink to="/home" class="text-decoration-none color-black"
          >デモ：文章検索ECサイト</NuxtLink
        >
      </v-app-bar-title>
    </v-app-bar>
    <ClientOnly>
      <v-navigation-drawer v-model="isDrawerRef" temporary>
        <v-divider></v-divider>

        <v-list>
          <v-list-item>
            <NuxtLink to="/home">ホーム</NuxtLink>
          </v-list-item>
          <v-list-item>
            <NuxtLink to="/product-regist">商品登録</NuxtLink>
          </v-list-item>
          <v-list-item>
            <NuxtLink to="/cart">カート</NuxtLink>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>
    </ClientOnly>
  </div>
</template>
