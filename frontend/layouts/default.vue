<script setup lang="ts"></script>

<template>
  <v-app>
    <div id="layout">
      <p>test</p>
      <v-main>
        <slot />
      </v-main>
    </div>
  </v-app>
</template>

<style scoped>
header {
  background: #333;
  color: white;
}
footer {
  background: #f4f4f4;
  padding: 10px;
  text-align: center;
}
</style>
