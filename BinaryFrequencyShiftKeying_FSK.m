%%%%%%%program for FSK generation and recepation %%%%%%%%%

clc
clear all
close all

f1=30;
f2=60;

g=[0 1 1 0]; 
n=1;
t=0:0.001:0.1;


y1=sin(2*pi*f1*t);
y2=sin(2*pi*f2*t);


mod=[];
is=[];
mod2=[];


while n <= length(g)
    
    if g(n)==0
        p=zeros(1,length(y1));
        y=y1;
    else
        y=y2;
        p=ones(1,length(y2));
    end 
    n=n+1;
    
    mod=[mod y];
    is=[is p];
    y=y';
    mod2=[mod2 y];
    
end


dm=[];
ds=[];
for i=1:length(g)
    s=sum(mod2(:,i));
    if s < sum(y1)
        dmod=0;
        o=ones(1,length(y1));
    else
        dmod=1;
        o=zeros(1,length(y2));
    end
    dm=[dm dmod];
     i=i+1;
     
     ds=[ds o];
end

dm

%%%%%%% next program is for ploting above generated signals %%%%%%%%
%%%%%%%% Information signal plot %%%%%%%%%%%%%%%

subplot 311
plot(is)
title('DATA SIGNALS')
legend('INPUT DATA')
xlabel('Duration')
ylabel('Intensity')
ylim([-0.2 1.2])

%%%%%%%%% PSK plot %%%%%%%%%%%%%%

subplot 312
plot(mod);
title('MODULATED SIGNAL')
legend('FSK')
xlabel('Time')
ylabel('Amplitude')

%%%%%%%%demodulation signal plot %%%%%%%%%%%%%%%


subplot 313
plot(ds)
title('DEMODULATED SIGNAL')
legend('DEMODULATION')
xlabel('Time')
ylabel('Amplitude')
ylim([-0.2 1.2])

