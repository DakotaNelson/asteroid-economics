function PV = mining_model( initial_supply, sale_quantity, return_cost )
%mining_model Summary of this function goes here
%   Detailed explanation goes here


    %initial_supply = 1000 * 1000; % kg of precious metal
    storage_cost = 1000; % dollars per kg per year
    years = floor(initial_supply / sale_quantity);% how long it takes to sell it all
    last_amt = mod(initial_supply,sale_quantity);
    discount_rate = .04; % used for FV
    current_price = 40000; % current cost of gold, USD
    current_market = 4000 * 1000; % world gold market for a year, in kg
    
    P = zeros(1,years);
    price_modifier = market_price(sale_quantity/current_market);
    last_price_modifier = market_price(last_amt/current_market);
    for i= 1:years
        I =  price_modifier * current_price * sale_quantity; % income
        % note that market_price expects input in [0-1] and returns the
        % same, so current_market and current_price are required to
        % make the input and output scale correctly
        E = (initial_supply - (sale_quantity*i))*storage_cost; % expenses
        P(i) = I-E; % profit for that year
    end
    
    P(years+1) = last_price_modifier * current_price * last_amt;
    
    yearly_PV = calc_pv(P, discount_rate);
    return_cost = (return_cost*initial_supply);
    
    PV = sum(yearly_PV)- return_cost;

    function pv = calc_pv(fv, i)
        % calculate PV given an array of FVs and an interest rate i
        pv = zeros(1,length(fv));
        for n = 1:length(fv)
            pv(n) = fv(n) ./ (1+i).^n;
        end
    end
end

