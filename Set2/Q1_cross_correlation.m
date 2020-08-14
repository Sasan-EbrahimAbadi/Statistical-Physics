load data1.txt
load data2.txt
N=size(data1);
a=data1;
b=data2;
%t=zeros(524288,1);

for T=1:(1048576/1024)
    sum=0;
    for i=1:1048576-T
        sum=sum+(a(i,1)*b(i+T,1));
    end
t(T)=sum/(1048576-T);    
T1(T)=T;
end
plot(T1,t);