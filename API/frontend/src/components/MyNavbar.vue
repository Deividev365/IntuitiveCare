<template>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <router-link class = "navbar-home" to = "/">Home</router-link>
      </li>
      <li class="nav-item">
        <router-link class = "nav-link" to = "/database">Banco de Dados</router-link>
      </li>
      
      <li class="nav-item">
        <router-link class = "nav-link" to = "/query">Consulta</router-link>
      </li>
    </ul>
  </div>
</nav>
</template>

<script>
export default {

}
</script>

<style>

</style>