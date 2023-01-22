<template>
  <div class= 'container mt-5'>
    <p class="text-center">Registros na Tabela</p>

    <div v-for="api_relatorio_cadop in api_relatorio_cadop" v-bind:key="api_relatorio_cadop.registro_ans">
    <table class="table">
        <thead>
              <tr>
                <th scope="col">Registro ANS</th>
                <th scope="col">CNPJ</th>
                <th scope="col">Razao Social</th>
                <th scope="col">Nome Fantasia</th>
                <th scope="col">Modalidade</th>
                <th scope="col">Logradouro</th>
                <th scope="col">Numero</th>
                <th scope="col">Complemento</th>
                <th scope="col">Bairro</th>
                <th scope="col">Cidade</th>
                <th scope="col">UF</th>
                <th scope="col">CEP</th>
                <th scope="col">DDD</th>
                <th scope="col">Telefone</th>
                <th scope="col">Fax</th>
                <th scope="col">Endereço Eletronico</th>
                <th scope="col">Representante</th>
                <th scope="col">Cargo do Representante</th>
                <th scope="col">Data do Registro na ANS</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">{{api_relatorio_cadop.registro_ANS}}</th>
                <td>{{api_relatorio_cadop.cnpj}}</td>
                <td style="word-wrap: break-word;">{{api_relatorio_cadop.razao_social}}</td>
                <td>{{api_relatorio_cadop.nome_fantasia}}</td>
                <td>{{api_relatorio_cadop.modalidade}}</td>
                <td>{{api_relatorio_cadop.logradouro}}</td>
                <td>{{api_relatorio_cadop.numero}}</td>
                <td>{{api_relatorio_cadop.complemento}}</td>
                <td>{{api_relatorio_cadop.bairro}}</td>
                <td>{{api_relatorio_cadop.cidade}}</td>
                <td>{{api_relatorio_cadop.uf}}</td>
                <td>{{api_relatorio_cadop.cep}}</td>
                <td>{{api_relatorio_cadop.ddd}}</td>
                <td>{{api_relatorio_cadop.telefone}}</td>
                <td>{{api_relatorio_cadop.fax}}</td>
                <td>{{api_relatorio_cadop.endereco_eletronico}}</td>
                <td>{{api_relatorio_cadop.representante}}</td>
                <td>{{api_relatorio_cadop.cargo_representante}}</td>
                <td>{{api_relatorio_cadop.data_registro_ANS}}</td>
              </tr>
            </tbody>
          </table>
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
        get_db(){
            fetch('http://127.0.0.1:5000/', {
                method: "GET",
                headers:{"Content-Type":"application/json"

                }
            })
            .then(resp => resp.json())
            .then(data => {
                this.api_relatorio_cadop.push(...data),
                console.log(data)
            })
            .catch(error => {
                console.log(error)
            })
        }
    },
    created(){
        this.get_db()
    }

}
</script>

<style>

</style>