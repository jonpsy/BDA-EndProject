import pandas as pd
import pickle
def load_files():
	model = pickle.load(open("../model/Pickle_RL_Model.pkl","rb"))
	return model

model = load_files()
def predict_class(arr):
	prediction = model.predict(arr)
	return prediction
