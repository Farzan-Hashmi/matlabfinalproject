function HitRatePlot(white_black_hit_rates, minority)
%This function plots 2 bubble charts for the white_black_hit_rates
%and white_hispanic_hit_rates output from HitRate.m

bubblechart(white_black_hit_rates.(3), white_black_hit_rates.(5), white_black_hit_rates.searches_in_district)
bubblesize([5 20])
set(gca,'xtick',linspace(0,1,11),'ytick',linspace(0,1,11))
xlabel('White Hit Rate')
ytitle = sprintf('%s Hit Rate', minority);
ylabel(ytitle);
bubblelegend('Number of searches','Location','eastoutside')
hold on
plot([0 1], [0,1])
axis square
hold off


