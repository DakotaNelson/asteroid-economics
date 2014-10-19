% run this script to visualize the price/quantity curve for the gold market

for q = 0:100
    price(q+1) = market_price(q/100);
end

plot(0:.01:1,price);
axis([0 1 0 1]);
xlabel('Quantity Sold (% of current market)');
ylabel('Price per kg (% of current market)');