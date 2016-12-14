function [x0,y0,x1,y1,x2,y2,x3,y3] = arrangefinalpoints(Ro,Co,finalpoints)

%% Set initializations.
x0 = double(Co*.25);
y0 = double(Ro*.25);

x1 = double(Co*.75);
y1 = double(Ro*.25);

x2 = double(Co*.75);
y2 = double(Ro*.75);

x3 = double(Co*.25);
y3 = double(Ro*.75);

%% Formation of the final points Based on Sorting and Identifying the points.

X = finalpoints(:,1);
X= sort(X,'ascend');
Y= zeros(length(X));
for i = 1: size(finalpoints,1)
   if(finalpoints(i,1)==X(1))
       Y(1)= finalpoints(i,2);
   end
   if(finalpoints(i,1)==X(2))
       Y(2)= finalpoints(i,2);
   end
   
   if(finalpoints(i,1)==X(3))
       Y(3) = finalpoints(i,2);
   end
   if(finalpoints(i,1)== X(4))
       Y(4) = finalpoints(i,2);
   end

end
   
    if(Y(1)<Y(2))
        x0 = X(1);
        y0 = Y(1);
        x3= X(2);
        y3= Y(2);
    elseif(Y(1)> Y(2))
        x0 = X(2);
        y0 = Y(2);
        x3 = X(1);
        y3 = Y(1);
    end
    
    if(Y(3)>Y(4))
        x2= X(3);
        y2= Y(3);
        x1= X(4);
        y1= Y(4);
    elseif(Y(4)> Y(3))
        x2= X(4);
        y2= Y(4);
        x1= X(3);
        y1= Y(3);
    end

end