for i = 1:1:500 % quantity sold per year
    profit(i) = mining_model(i*1000,10000);
end

plot(profit)
hold on;
refline(0,0)
hold off;

%%
[quantity,cost] = meshgrid(100:1:500,1:1:30);
for i = 100:1:500 % quantity sold per year
    for j = 1:1:30 % cost to return
        profit(i,j) = mining_model(i*1000,j*1000);
    end
end

contour(profit)