<template>
    
  <div class= 'container mt-5'>
      <h1>Digite o que deseja pesquisar no Banco de dados</h1>
      <div>
          <form @submit="post_consulta" >
              <input type="text"
              class="form-control"
              placeholder="Digite o que deseja pesquisar:"
              v-model="consulta"
              >
              <button class="button-3" role="button">Pesquisar</button>           
          </form>
      </div>
      <div v-for="api_relatorio_cadop in api_relatorio_cadop" v-bind:key="api_relatorio_cadop.registro_ans">
      <p>Registro Ans da empresa: {{api_relatorio_cadop.registro_ans}}</p>
      <p>CNPJ da empresa: {{api_relatorio_cadop.cnpj}}</p>
      <p>Razao Social: {{api_relatorio_cadop.razao_social}}</p>
      <p>Nome Fantasia: {{api_relatorio_cadop.nome_fantasia}}</p>
      <p>Modalidade: {{api_relatorio_cadop.modalidade}}</p>
      <p>Logradouro: {{api_relatorio_cadop.logradouro}}</p>
      <p>Numero: {{api_relatorio_cadop.numero}}</p>
      <p>Complemento: {{api_relatorio_cadop.complemento}}</p>
      <p>Bairro: {{api_relatorio_cadop.bairro}}</p>
      <p>Cidade: {{api_relatorio_cadop.cidade}}</p>
      <p>UF: {{api_relatorio_cadop.uf}}</p>
      <p>CEP: {{api_relatorio_cadop.cep}}</p>
      <p>DDD: {{api_relatorio_cadop.ddd}}</p>
      <p>Telefone: {{api_relatorio_cadop.telefone}}</p>
      <p>Fax: {{api_relatorio_cadop.fax}}</p>
      <p>Endereco Eletronico: {{api_relatorio_cadop.endereco_eletronico}}</p>
      <p>Representante: {{api_relatorio_cadop.representante}}</p>
      <p>Cargo do Representante: {{api_relatorio_cadop.representante_cargo}}</p>
      <p>Data do Registro na ANS: {{api_relatorio_cadop.data_registroans}}</p>

      
      </div>
  </div>
</template>

<script>
export default {

    data(){
        return {
            api_relatorio_cadop:[],
            }

    },

    methods:{
        post_consulta(){
            fetch('http://127.0.0.1:5000/postconsulta', {
                method: "POST",
                headers:{"Content-Type":"application/json"
                },
                body: JSON.stringify({consulta:this.consulta})
                
            })
            .then(resp => resp.json())
            .then(data => {
                this.api_relatorio_cadop.length = 0
                this.api_relatorio_cadop.push(...data)
                this.$router.push({
                    name:'query'
                })
            })
            .catch(error => {
                console.log(error)
            })
        },
        

     
       
    },
    created(){
    },
    

}


</script>

<style>


/* CSS */
.button-3 {
  appearance: none;
  background-color: #2ea44f;
  border: 1px solid rgba(27, 31, 35, .15);
  border-radius: 6px;
  box-shadow: rgba(27, 31, 35, .1) 0 1px 0;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: -apple-system,system-ui,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji";
  font-size: 14px;
  font-weight: 600;
  line-height: 20px;
  padding: 6px 16px;
  position: relative;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: middle;
  white-space: nowrap;
}

.button-3:focus:not(:focus-visible):not(.focus-visible) {
  box-shadow: none;
  outline: none;
}

.button-3:hover {
  background-color: #2c974b;
}

.button-3:focus {
  box-shadow: rgba(46, 164, 79, .4) 0 0 0 3px;
  outline: none;
}

.button-3:disabled {
  background-color: #94d3a2;
  border-color: rgba(27, 31, 35, .1);
  color: rgba(255, 255, 255, .8);
  cursor: default;
}

.button-3:active {
  background-color: #298e46;
  box-shadow: rgba(20, 70, 32, .2) 0 1px 0 inset;
}

nav-item active {
  font-size: 25px;
}
</style>