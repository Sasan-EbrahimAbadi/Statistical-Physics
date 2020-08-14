clear
a=load('data1.txt');
for T=1:(1048576/1024)
    sum=0;
    for i=1:1048576-T
        sum=sum+(a(i,1)*a(i+T,1));
    end
t(T)=sum/(1048576-T);    
T1(T)=T;
end
plot(T1,t);
