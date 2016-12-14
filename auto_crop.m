function [x0, y0, x1, y1, x2, y2, x3, y3] = auto_crop ( f )

%% Reading the Image and necessary Initializations.
f= im2double(f);
I = f;

fixedSize = 1000;
imHeight = size(I,1);
imWidth = size(I,2);
imDiag = sqrt(imWidth^2 + imHeight^2);
% Taking Blue Channel.
blueChannel= I(:,:,3);


%% Removal of the Text that is present in the image to reduce noise while finding the corners
filledImage = imfill(blueChannel);

%% Detection of top 20 Dominant Lines in the Image.
BW = edge(filledImage,'canny',[],5);
[H,T,R] = hough(BW);
P = houghpeaks(H,20,'Threshold',0,'NHoodSize',[ceil(fixedSize/4)+1,51]);

theta =  T(P(:,2));
% rho = R(P(:,1));


%% Find Four Pairs of Angles and Theta Values.
fourPoints = zeros(4,2);
[th1,th2] = findperpendicularpair(theta+90);
fourPoints(1:2,1:2)= findEqualPairOfTheta(th1,P);
fourPoints(3:4,1:2)= findEqualPairOfTheta(th2,P);

%% Find the Point of intersections between the above four points.
%% Find Points of intersection.
newarr = fourPoints(1:2,1:2);
newarr2  = fourPoints(3:4,1:2);
count =1;
finalpoints= zeros(2,2);
d = imDiag;
for k = 1:size(newarr,1)
    finalrho1 = newarr(k,1) - d ;
    finalthet1= newarr(k,2) - 90;
    
    for l = 1:size(newarr2,1)
        finalrho2 = newarr2(l,1)-d;
        finalthet2= newarr2(l,2)-90;
        
        A = inv([cosd(finalthet1) sind(finalthet1) ; cosd(finalthet2) sind(finalthet2)]);
        RhValues = [finalrho1;finalrho2];
        
        values= A*RhValues;
        finalpoints(count,1) = round(values(1));
        finalpoints(count,2)  = round(values(2));
        count= count+1;
    end
end
%% Arrange the four points obtained.
[R,C]= size(BW);
[x0,y0,x1,y1,x2,y2,x3,y3] = arrangefinalpoints(R,C,finalpoints);

end


