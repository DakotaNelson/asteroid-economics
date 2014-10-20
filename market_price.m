function price = market_price(q)
    % this function takes the quantity of gold you wish to sell in a year,
    % as the percentage of the current world market (i.e. 0-1), and returns
    % the average price for that gold (again, as a percentage of current
    % price)
    
    q = 2*q - .5; % scale q appropriately
    price = (1/(exp(5*(q)) + 1)) + .0759;
end