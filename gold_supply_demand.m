% graph gold supply, demand, and cost

% first, import gold_supply_demand.csv

Demand = Jewelry+Technology+Investment;
[hAx,hLine1,hLine2] = plotyy([Year,Year,Year],[Demand,Production,Demand-Production],Year,GoldPrice);

title('Production and Demand of Gold vs Gold Price')
ylabel(hAx(1),'Tons of Gold')
ylabel(hAx(2),'US Dollars per Ounce')
xlabel('Years')

legend('Gold Demand','Gold Supply','Unmet Demand (D-P)','Gold Price')