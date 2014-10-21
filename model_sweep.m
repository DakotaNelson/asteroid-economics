for i = 1:1:500 % quantity sold per year
    profit(i) = mining_model(i*1000,10000);
end

plot(profit)
hold on;
refline(0,0)
hold off;

%%

[quantity,cost] = meshgrid(100:1:5000,1:1:30);
for i = 100:1:500 % quantity sold per year
    for j = 1:1:30 % cost to return
        profit(i,j) = mining_model(500000, i*1000, j*1000);
    end
end

surf(profit)
ylabel('Quantity Sold per Year, in thousands of kg')
xlabel('Cost to Return, per kg, in thousands of USD')

%%
clf
clear all

% [quantity,initial_suppd(100:1:5000,1:1:30);
for i = 1:1:2000 % quantity returned per year
    for j = 1:1:100 % quantity sold per year
        profit(i,j) = mining_model(i*10000, j*10000, 10000);
    end
end

surf(profit)
ylabel('Quantity Returned, in hundreds of kg')
xlabel('Quantity Sold per Year, in hundreds of kg')

shading interp