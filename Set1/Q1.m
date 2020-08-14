load data_error.txt
format long e
a=data_error;
c=0;
for i=1:32768
    c=c+((a(i,2))/(a(i,3)^2)); %seri x(i)/(sigma(i)^2)
end
w=0;
for j=1:32768
    w=w+1/(a(j,3)^2);  %seri(1/sigma(i)^2)))
end
meanvariance=1/w; %meanvariance(1/(seri(1/sigma(i)^2)))
mean=c/w;          %mean(seri(x(i)/sigma(i)^2))/seri(1/sigma(i)^2)) 
disp(mean);
disp(meanvariance);

