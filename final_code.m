clear;
clc;
lower_Limit = 80;
upper_Limit = 110;
peak_Location = 100;
pd = makedist('Triangular','a',lower_Limit,'b',peak_Location,'c',upper_Limit);
rng('default');
originalResistor = random(pd,1,20);
sigma = 0.7;
H1 = zeros(1,20);
H2 = zeros(1,20);
H3 = zeros(1,20);
H4 = zeros(1,20);
H5 = zeros(1,20);
power1 = zeros(1,20);
power2 = zeros(1,20);
power3 = zeros(1,20);
power4 = zeros(1,20);
power5 = zeros(1,20);
x0 = 10;
gama = 1;
I = 0.1;
noutz = sampsizepwr('z',[100 sigma],105,0.9);
nout = sampsizepwr('t',[100 sigma],105,0.9);
%%cauchy Error :
for i=1:1:20
   Errorcauchy= zeros(1,100);
   for k=1:1:100
       Errorcauchy(1,k) = originalResistor(1,i) + I*(x0+gama*tan(pi*(rand(1,1)-1/2)));
   end
    for j=1:1:500
        h_alfa = ttest(Errorcauchy,100,'Alpha',0.05);
        if(h_alfa==1)
            H5(1,i) =  H5(1,i)+1; 
        end        
    end
    power5(1,i) = H5(1,i) ./ 5000 ;
end
%% uniform Error :
sigma = 0.7;
power2 = zeros(1,20);
power4 = zeros(1,20);
H2 = zeros(1,20);
H4 = zeros(1,20);
for i=1:1:20
   Erroruniform= zeros(1,3);
   for k=1:1:3
       Erroruniform(1,k) = originalResistor(1,i) + unifrnd(-sqrt(6)/2,sqrt(6)/2);
   end
    for j=1:1:5000
        h_alfa = ttest(Erroruniform,100,'Alpha',0.05);
        if(h_alfa==1)
            H4(1,i) =  H4(1,i)+1; 
        end 
        Euniform_Resistor(1,i) = originalResistor(1,i) + unifrnd(-sqrt(8.4)/2,sqrt(8.4)/2);
        h_alfa = ztest(Euniform_Resistor(1,i),100,sigma,'Alpha',0.05);
        if(h_alfa==1)
           H2(1,i) =  H2(1,i)+1; 
        end
    end
    power4(1,i) = H4(1,i) ./ 5000 ;
    power2(1,i) = H2(1,i) ./ 5000 
end
  

%% uniform Error :
sigma = 0.3;
power2 = zeros(1,20);
power4 = zeros(1,20);
H2 = zeros(1,20);
H4 = zeros(1,20);
for i=1:1:20
   Erroruniform= zeros(1,3);
   for k=1:1:3
       Erroruniform(1,k) = originalResistor(1,i) + unifrnd(-sqrt(3.6)/2,sqrt(3.6)/2);
   end
    for j=1:1:5000
        h_alfa = ttest(Erroruniform,100,'Alpha',0.05);
        if(h_alfa==1)
            H4(1,i) =  H4(1,i)+1; 
        end 
        Euniform_Resistor(1,i) = originalResistor(1,i) + unifrnd(-sqrt(6)/2,sqrt(6)/2);
        h_alfa = ztest(Euniform_Resistor(1,i),100,sigma,'Alpha',0.05);
        if(h_alfa==1)
           H2(1,i) =  H2(1,i)+1; 
        end
    end
    power4(1,i) = H4(1,i) ./ 5000 ;
    power2(1,i) = H2(1,i) ./ 5000 
end
%% normal Error :
sigma = 0.3;
power1 = zeros(1,20);
power3 = zeros(1,20);
H1 = zeros(1,20);
H3 = zeros(1,20);
for i=1:1:20
   Errornormal= zeros(1,3);
   for k=1:1:3
       Errornormal(1,k) = originalResistor(1,i) + normrnd(0,sigma,1,1);
   end
    for j=1:1:5000
        Enormal_Resistor(1,i) = originalResistor(1,i) + normrnd(0,sigma,1,1);
        h_alfa = ztest(Enormal_Resistor(1,i),100,sigma,'Alpha',0.05);
        h_beta = ztest(Enormal_Resistor(1,i),100,sigma,'Alpha',0.1);
        if(h_alfa==1 | h_beta==0)
            H1(1,i) =  H1(1,i)+1; 
        end
        h_alfa = ttest (Errornormal,100,'Alpha',0.05);
        h_beta = ttest(Errornormal,100,'Alpha',0.1);
        if(h_alfa==1 | h_beta==0)
            H3(1,i) =  H3(1,i)+1; 
        end        
    end
    power1(1,i) = H1(1,i) ./ 5000 
    power3(1,i) = H3(1,i) ./ 5000 
end
%% normal Error :
sigma = 0.7;
power1 = zeros(1,20);
power3 = zeros(1,20);
H1 = zeros(1,20);
H3 = zeros(1,20);
for i=1:1:20
   Errornormal= zeros(1,3);
   for k=1:1:3
       Errornormal(1,k) = originalResistor(1,i) + normrnd(0,sigma,1,1);
   end
    for j=1:1:5000
        Enormal_Resistor(1,i) = originalResistor(1,i) + normrnd(0,sigma,1,1);
        h_alfa = ztest(Enormal_Resistor(1,i),100,sigma,'Alpha',0.05);
        h_beta = ztest(Enormal_Resistor(1,i),100,sigma,'Alpha',0.1);
        if(h_alfa==1 | h_beta==0)
            H1(1,i) =  H1(1,i)+1; 
        end
        h_alfa = ttest (Errornormal,100,'Alpha',0.05);
        h_beta = ttest(Errornormal,100,'Alpha',0.1);
        if(h_alfa==1 | h_beta==0)
            H3(1,i) =  H3(1,i)+1; 
        end        
    end
    power1(1,i) = H1(1,i) ./ 5000 ; 
    power3(1,i) = H3(1,i) ./ 5000 
end
  
