function [fitresult, gof] = createFit_cdamp(t, i)

[xData, yData] = prepareCurveData( t, i );

ft = fittype( 'a*exp(-b*x)+c*x*exp(-b*x)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
%opts.Display = 'Off';
opts.StartPoint = [0.197117046466842 0.374638887225915 0.960456314540204];
[fitresult, gof] = fit( xData, yData, ft, opts );

