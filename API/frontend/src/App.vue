<template>
<MyNavbar></MyNavbar>
<router-view></router-view>
</template>

<script>
import MyNavbar from './components/MyNavbar.vue'



export default {
  name: 'App',
  components: {
    MyNavbar
}
}
</script>

<style>

</style>
