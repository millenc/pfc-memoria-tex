% M�todo de Mamdani.
% Par�metros:
% R: Conjunto de reglas.
% fact: Premisa. Vector de valores de entradas escalares. El valor para el
% antecedente i-�simo debe estar en la posici�n fact(i).
% y: Universo de salida
%
% Devuelve:
% B = Conjunto de salida.

function B = mamdani( R, fact, y)

n = length(R);
B = zeros(length(R), length(y));

% Evaluar cada regla
for i=1:n
  % Evaluar cada antecedente
  u = zeros(1,length(R(i).A));
  for j=1:length(R(i).A)
      u(j) = R(i).A{j}(fact(j));
  end
  
  % Obtener el valor del conjunto difuso de salida para esta regla truncando el consecuente con
  % el m�nimo de los grados de pertenencia de cada antecedente.
  B(i,:) = min(arrayfun(R(i).B, y),min(u)); 
end

% Obtener el conjunto de salida agregando todos los consecuentes obtenidos utilizando el m�ximo
B = max(B,[],1);

end