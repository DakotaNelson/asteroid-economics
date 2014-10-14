for i = 1:1:500 % quantity sold per year
    profit(i) = mining_model(i*1000,10000);
end

plot(profit)
hold on;
refline(0,0)