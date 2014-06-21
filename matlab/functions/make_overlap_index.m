% Construcci�n de �ndice de solapamiento
% M: Una funci�n de agregaci�n.
% Go: Una funci�n de solapamiento
% O: Valor devuelto, el �ndice de solapamiento construido a partir de M y
% Go.
function O = make_overlap_index( M , Go )

    function o = overlap_index( A , B )
        o = M(arrayfun(Go,A,B));
    end

    O = @overlap_index;
end

