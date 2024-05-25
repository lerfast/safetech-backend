import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import json

def run_analysis(input_data):
    # Convertir datos de entrada JSON a DataFrame
    df = pd.DataFrame(input_data)

    # Dividir datos en características (X) y etiqueta (y)
    X = df.drop('target', axis=1)
    y = df['target']

    # Dividir los datos en conjuntos de entrenamiento y prueba
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Crear y entrenar el modelo
    model = LinearRegression()
    model.fit(X_train, y_train)

    # Hacer predicciones
    predictions = model.predict(X_test)

    # Calcular métricas de evaluación
    results = {
        'coefficients': model.coef_.tolist(),
        'intercept': model.intercept_.tolist(),
        'predictions': predictions.tolist(),
        'actual': y_test.tolist()
    }

    return json.dumps(results)
