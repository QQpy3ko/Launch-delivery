<template>
  <div>
    <p>{{ message }}</p>
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      message: new Date
    }
  },
   components: {
    MenuItems
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
