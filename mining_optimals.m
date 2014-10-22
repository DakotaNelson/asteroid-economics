function res = mining_optimals()
    clf
    clear all
    
    options = optimoptions(@fminunc, 'Display', 'none', 'MaxFunEvals', 150000, 'TolFun', 1e-10, 'TolX', 1e-10) ;

    for initial_supply = 1:100 
        f = @(sale_quantity)mining_modelO(sale_quantity, initial_supply*500000);
        [x, fval] = fminsearch(f, initial_supply/10, options);
    
        pSales(initial_supply) = x;
        initial_supply
    end
    
    plot(5000:500000:50000000, pSales);
    
    xlabel('Initial Supply of Minerals in kg', 'FontSize', 30)
    ylabel('Optimal Sale Quantity in kg', 'FontSize', 30)
    
    title('The Effect of Initial Mineral Supply on Optimal Sale Quantity');
end
