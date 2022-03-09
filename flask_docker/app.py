# -*- coding: utf-8 -*-
"""
Created on Thu Feb 17 20:20:50 2022
@author: gilbe
"""
from flask import Flask, jsonify, request
import json
from elasticsearch import Elasticsearch

# es = elastic_test.connect_elasticsearch()
es = Elasticsearch([{'host': 'localhost', 'port': 9200, 'scheme':'http'}])

response = ''

app = Flask(__name__)

@app.route('/test', methods = ['GET', 'POST'])

def nameRoute():
    
    global request_data
    
    if(request.method == 'POST'):
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        print(request_data['id'])
        result = es.get(index='azuretemp', id=request_data['id'])
        print(result['_source']['Items']['unitPrice'])
        print(result['_source']['Items']['currencyCode'])
        price = result['_source']['Items']['unitPrice']
        currency = result['_source']['Items']['currencyCode']
        return jsonify({'unitPrice': price,
                        'currency': currency})
        # return jsonify({'Nombres_utilisateurs': request_data['Nombres_utilisateurs']})
    else:
        # return jsonify({'Nombres_utilisateurs': request_data['Nombres_utilisateurs']})
        return ''
if __name__=="__main__":
    app.run(debug=True, port=5000)
