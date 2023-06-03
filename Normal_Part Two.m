s = abs(randn * 3);
num = 2;
x(1) = (rand -0.5)*s*2;
x(2) = (rand -0.5)*s*2;
sigmatwo = ((x(1) - mean(x))^2) / (num-1) + ((x(2)-mean(x))^2)/(num-1);
while num <= ceil(sigmatwo * 10.51)
    num = num + 1;
    x(num) = (rand -0.5)*s*2;
    sigmatwo = 0;
    for j = 1:num
        sigmatwo = sigmatwo + ((x(j)-mean(x))^2)/(num-1);
    end
end
Counter = 0;
upper = 100 + 1.96* sigmatwo / sqrt(num);
lower = 100 - 1.96* sigmatwo / sqrt(num);
for i = 1:5000
    rand=0;
    for j = 1:num 
       rand = rand + (randn * sigmatwo + 100)/num;
    end
   if(lower < rand && rand < upper)
       Counter = Counter + 1;
   end
end
disp(Counter * 100 / 5000);