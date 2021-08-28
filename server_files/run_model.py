from flask import Flask,request,jsonify
from Predict_Model import *
app = Flask(__name__)


@app.route("/predict",methods=['POST'])

def predict():
    input_json = request.get_json()
    arr = input_json["input"]
    if arr[0]=="True":
        arr[0]=True
    elif arr[0]=="False":
        arr[0]=False
    if arr[1]=="True":
        arr[1]=True
    elif arr[1]=="False":
        arr[1]=False
    print("Input array: ",arr)
    intent = predict_class([arr])[0]
    return intent

app.run( debug=False)