% Funci�n de pertenencia lineal.
% Par�metros:
% first: Primer punto del rango (eje x).
% last: �ltimo punto del rango (eje x).
% value: Punto en el que se quiere calcular el valor de la funci�n de pertenencia (eje x).
% r: Par�metro opcional. Si tiene valor 'r' se calcula la funci�n de
% pertenencia "inversa" (de 1 a 0).
%
% Valor devuelto:
% u = valor de la funci�n de pertenencia en el punto "value"

function u = lineal(first, last, value, r)
    if value >= first && value <= last
        u = (value - first)/(last - first);
        if(nargin == 4 && r == 'r')
            u = 1 - u;
        end
    else
        u = 0;
    end
end