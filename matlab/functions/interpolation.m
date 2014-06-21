% M�todo de interpolaci�n basado en reglas.
% Par�metros:
% R: Conjunto de reglas.
% fact: Premisa. Vector de conjuntos difusos que componen la premisa. El valor para el
% antecedente i-�simo debe estar en la posici�n fact(i).
% y: Universo de salida
% O: �ndice de solapamiento utilizado.
% T: T-norma utilizada.
% M: Operador de agregaci�n utilizado.
%
% Devuelve:
% Bp = Conjunto de salida.

function Bp = interpolation( R, fact, y, O , T, M )

n = length(R);
k=zeros(1,n);
K=zeros(n,length(y));
B=K;

for i=1:n
   % Calcular el grado de activaci�n de cada regla
   k(i) = matching_degree(R(i), fact, O, T);
   K(i,:) = k(i);
   
   % Calcular el conjunto de salida B para esta regla
   B(i,:) = arrayfun(R(i).B, y);
end

% Calcular el conjunto de salida agregando los conjuntos obtenidos en cada
% regla.
Bp = cellfun(M,num2cell(min(K,B),1));

end