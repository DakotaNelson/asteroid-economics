function res = mining_model( sale_quantity, return_cost )
%mining_model Summary of this function goes here
%   Detailed explanation goes here

    initial_supply = 500000; % kg of precious metal
    storage_cost = 1000; % dollars per kg per year
    years = floor(initial_supply / sale_quantity); % how long it takes to sell it all
    discount_rate = .04; % used for FV
    
    for i= 1:years
        I = market_price(sale_quantity) * sale_quantity; % income
        E = (initial_supply - (sale_quantity*i))*storage_cost; % expenses
        P(i) = I-E; % profit for that year
    end

    final_P = calc_pv(P, discount_rate)-(return_cost*initial_supply);
    res = final_P;

    function res = market_price(q)
        res = q;
    end

    function sum = calc_pv(fv, i)
        % calculate PV given an array of FVs and an interest rate i
        sum = 0;
        for n = 1:size(fv)
            pv = fv(n) / (1+i)^n;
            sum = sum + pv;
        end
    end
end

