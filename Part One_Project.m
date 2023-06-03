% for part I project
sigma = 0.3;
%Sigma is Standard deviation
num = 1;
%Num is Calculated number
Counter = 0;
upper = 100 + 1.96* sigma / sqrt(num);
lower = 100 - 1.96* sigma / sqrt(num);
for i = 1:5000
    rand=0;
    for j = 1:num 
       rand = rand + (randn * sigma + 100)/num;
    end
   if(lower < rand && rand < upper)
       Counter = Counter + 1;
   end
end
disp(Counter * 100 / 5000);