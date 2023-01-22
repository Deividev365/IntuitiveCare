from flask import Flask, jsonify, request as requestflask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from flask_cors import CORS
from requests import request

app = Flask(__name__)
CORS(app)

with app.app_context():
    
    app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root@localhost:3306/intuitivecare"
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
ma = Marshmallow(app)

class api_relatorio_cadop(db.Model):
    __tablename__ = 'api_relatorio_cadop'
    registro_ANS = db.Column(db.Integer, primary_key = True )
    cnpj = db.Column(db.String(255))
    razao_social = db.Column(db.String(255))
    nome_fantasia = db.Column(db.String(255))
    modalidade = db.Column(db.String(255))
    logradouro = db.Column(db.String(255))
    numero = db.Column(db.String(255))
    complemento = db.Column(db.String(255))
    bairro = db.Column(db.String(255))
    cidade = db.Column(db.String(255))
    uf = db.Column(db.String(2))
    cep = db.Column(db.String(8))
    ddd = db.Column(db.String(2))
    telefone =db.Column(db.String(9))
    fax = db.Column(db.String(9))
    endereco_eletronico = db.Column(db.String(255))
    representante = db.Column(db.String(255))
    cargo_representante = db.Column(db.String(255))
    data_registro_ANS = db.Column(db.Date)

class api_relatorio_cadop_Schema(ma.Schema):
    class Meta:
        fields = ('registro_ANS', 'cnpj','razao_social', 'nome_fantasia', 'modalidade', 'logradouro', 'numero', 'complemento', 'bairro', 'cidade', 'uf', 'cep',
        'ddd', 'telefone', 'fax', 'endereco_eletronico','representante', 'cargo_representante', 'data_registro_ANS')


relacao_schema = api_relatorio_cadop_Schema()
relacao_schema = api_relatorio_cadop_Schema(many = True)


    
@app.route('/', methods= ['GET'])
def get_db():
    all_db = api_relatorio_cadop.query.all()
    results = relacao_schema.dump(all_db)
    return jsonify(results)



if __name__ == "__main__":
    app.run(debug=True)