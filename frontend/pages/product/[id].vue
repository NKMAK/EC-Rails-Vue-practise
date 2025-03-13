<script setup lang="ts">
import { gainOneProduct } from "~/service/product/gainOneProduct";

const route = useRoute();

console.log(route.params.id);
onMounted(async () => {
  const res = await gainOneProduct(Number(route.params.id));
  console.log(res);
});
</script>

<template>test</template>
