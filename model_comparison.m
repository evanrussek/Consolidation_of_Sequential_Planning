%calculate BIC score or each behavioral model

partList        = [1 2 3 4 5 6 9 10 11 12 14 15 18 19 20 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36];

load('behav_data');

DDDDD=D(D.trial_accept>=0,:);

IDs=unique(DDDDD.ID);

for s=1:30;
h=1;
clear lik lik1 lik2 lik3 lik4 lik5 


    DDDD=DDDDD(DDDDD.ID==IDs(s),:);


D1=DDDD;
D2=DDDD;

glme1 = fitglme(D1,'trial_accept ~ (MB_P)','Distribution','binomial');
glme2 = fitglme(D1,'trial_accept ~ (SRe_P)','Distribution','binomial');
glme3 = fitglme(D1,'trial_accept ~ (MB_P+SRa_P)','Distribution','binomial');
glme4 = fitglme(D1,'trial_accept ~ (MB_P+SRe_P+MF_P)','Distribution','binomial');
glme5 = fitglme(D1,'trial_accept ~ (MB_P+SRd_P)','Distribution','binomial');
glme6 = fitglme(D1,'trial_accept ~ (MB_P+SRd_P+SRin_P)','Distribution','binomial');
glme7 = fitglme(D1,'trial_accept ~ (MB_P+SRd_P+SRin_P+MF_P)','Distribution','binomial');

ypred1 = predict(glme1,D2);
ypred2 = predict(glme2,D2);
ypred3 = predict(glme3,D2);
ypred4 = predict(glme4,D2);
ypred5 = predict(glme5,D2);
ypred6 = predict(glme6,D2);
ypred7 = predict(glme7,D2);

yta=D2.trial_accept;

for p=1:size(yta,1);
    if yta(p)==1;
        lik1(h)=ypred1(p);
        lik2(h)=ypred2(p);
        lik3(h)=ypred3(p);
        lik4(h)=ypred4(p);
        lik5(h)=ypred5(p);
        lik6(h)=ypred6(p);
        lik7(h)=ypred7(p);


        h=h+1;
    else
        lik1(h)=1-ypred1(p);
        lik2(h)=1-ypred2(p);
        lik3(h)=1-ypred3(p);
        lik4(h)=1-ypred4(p);
        lik5(h)=1-ypred5(p);
        lik6(h)=1-ypred6(p);
        lik7(h)=1-ypred7(p);

        h=h+1;
    end
end

BIC(1,s)=-2*sum(log(lik1))+(1*log(h));
BIC(2,s)=-2*sum(log(lik2))+(1*log(h));
BIC(3,s)=-2*sum(log(lik3))+(2*log(h));
BIC(4,s)=-2*sum(log(lik4))+(3*log(h));
BIC(5,s)=-2*sum(log(lik5))+(2*log(h));
BIC(6,s)=-2*sum(log(lik6))+(3*log(h));
BIC(7,s)=-2*sum(log(lik7))+(4*log(h));

end

mean(BIC(:,:)')