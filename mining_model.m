function res = mining_model( q, e0 )
%mining_model Summary of this function goes here
%   Detailed explanation goes here

    initial_supply = 500000;

    years = initial_supply / q;

    for i= 1:years
        I = calc_P(q) * q;
        E = (initial_supply - (q*i))*storage_cost;
        P[i] = I-E;
    end

    final_P = pvvar(P, years)-(return_cost*inital_supply);


    function res = calc_P(q)
        res = q;
    end
end

