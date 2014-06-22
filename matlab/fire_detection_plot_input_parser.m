% Parser de par�metros opcionales para las funciones fire_detection_mamdani_plot y fire_detection_interpolation_plot. 
% Par�metros opcionales:
% showTitle = true/false: Mostrar el t�tulo de la gr�fica
% showLegend = true/false: Mostrar la leyenda de la gr�fica.
% exportTikz = true/false: Exportar la gr�fica en formato tikz.

function p = fire_detection_plot_input_parser()
p = inputParser;
defaultShowTitle = true;
defaultShowLegend = true;
defaultExportTikz = false; 

addOptional(p,'showTitle',defaultShowTitle);
addOptional(p,'showLegend',defaultShowLegend);
addOptional(p,'exportTikz',defaultExportTikz);
end