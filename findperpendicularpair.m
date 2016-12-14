function [th1,th2] = findperpendicularpair(thetaValues)
%%% Finding two angles which are perpendicular to each other.
th1=0;
th2=0;
flag=0;
len = length(thetaValues(:));
for i = 1:len
    th1 = thetaValues(i);
    for j = 1:len
        th2 = thetaValues(j);
        diff = abs(th1 - th2);
        if(diff >= 85 & diff <=95)
            flag=1;
            break;
        end
    end
    
   if(flag==1)
       return;
   end
end

end