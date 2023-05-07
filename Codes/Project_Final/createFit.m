function [fitresult, gof] = createFit(t, v)

[xData, yData] = prepareCurveData( t, v );
ft = fittype( 'fourier8' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8.5679799643358];
[fitresult, gof] = fit( xData, yData, ft, opts );

end

