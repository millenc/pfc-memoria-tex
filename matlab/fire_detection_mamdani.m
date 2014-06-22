% M�todo de Mamdani aplicado a la determinaci�n de riesgos de incendios.
% Par�metros:
% temp: Temperatura (�C).
% smoke: Humo (ppm).
% light: Luz (lux).
% humidity: Humedad (ppm).
% distance: Distancia (m).
%
% Valores devueltos:
% B: Conjunto de salida.
% dc: Valor defusificado centroide.
% db: Valor defusificado bisector.
% dm: Valor defusificado media de m�ximos.
% ds: Valor defusificado menor de m�ximos.
% dl: Valor defusificado mayor de m�ximos.

function [B, dc, db, dm, ds, dl] = fire_detection_mamdani(temp, smoke, light, humidity, distance)
    % A�adir dependencias al path
    addpath('./lang_variables');
    addpath('../functions');

    % Universo de salida
    x_threat = threat.get_x();

    % Reglas
    R = fire_detection_rules();

    % Premisa
    fact = [temp,smoke,light,humidity,distance];

    % Aplicar m�todo de Mamdani
    B = mamdani(R, fact, x_threat);

    % Defusificar
    dc = round(defuzz(x_threat, B, 'centroid'));
    db = round(defuzz(x_threat, B, 'bisector'));
    dm = round(defuzz(x_threat, B, 'mom'));
    ds = round(defuzz(x_threat, B, 'som'));
    dl = round(defuzz(x_threat, B, 'lom'));
end

