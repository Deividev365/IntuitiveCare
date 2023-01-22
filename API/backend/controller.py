from flask import Flask, jsonify, request as requestflask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from flask_cors import CORS
from requests import request


app = Flask(__name__)

CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@localhost/intuitivecare'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

