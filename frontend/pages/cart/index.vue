<script setup lang="ts">
import { gainCart } from "~/service/cart/gainCart";

onMounted(async () => {
  const test = await gainCart();
  console.log(test);
});
</script>
<template>test</template>
