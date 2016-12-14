function equalArr= findEqualPairOfTheta(checkTh,P)
%%% Finding the Rho and Theta values which have an equal pairs.
len = size(P,1);
equalArr= zeros(2,2);
flag=0;
for i = 1: len
    th1 = P(i,2);
    rho1= P(i,1);
    checkDiff= abs(th1- checkTh);
    if(checkDiff >=0 & checkDiff <=5)
        
        for j =  1: len
            newTh = P(j,2);
            newRho = P(j,1);
            diffTh = abs(newTh- th1);
            if(diffTh >= 0 && diffTh <= 5)
                rhoDiff = abs(newRho- rho1);
                if(rhoDiff > 100)
                    flag=1;
                    equalArr(1,1) = rho1;
                    equalArr(1,2) = checkTh;
                    equalArr(2,1) = newRho;
                    equalArr(2,2) = newTh;
                    break;
                end
            end
        end
        
        if(flag==1)
            return;
        end
    end
end


