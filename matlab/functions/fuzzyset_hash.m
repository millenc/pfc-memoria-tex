% Hash de conjuntos difusos
% Devuelve:
%
% fh: Puntero a una funci�n que implementa una tabla hash de conjuntos
% difusos con par�metros:
%   mf: Funci�n de pertenencia del conjunto.
%   x: Universo de referencia.
% Si el conjunto se ha calculado previamente, se devuelve dicho valor
% precalculado. En caso contrario, se aplica la funci�n de pertenencia mf
% al universo de referencia x.
function fh = fuzzyset_hash()
    hash = struct;

    function fs = get_fuzzy_set( mf , x )
        f_key = strrep(func2str(mf),'.','');
        if(isfield(hash, f_key) == 0)
            fs = arrayfun(mf, x);
            hash.(f_key) = fs;
        else
            fs = getfield(hash, f_key);
        end
    end

    fh = @get_fuzzy_set;
end