function [stimulus,stimulus2a,stimulus2b,stimulus2c,stimulus2d,stimulus2e,stimulus2f,stimulus2g,stimulus2h,stimulus2x]  = trial_order(out1,out2,new);

stateso={};

for t=0:8;
for d=1:50;
    if out1.state_number(d)==t;
        stateso{t+1}=out1.image_observed(d);
    end
end
end

stateso1=stateso;
stateso1(10)=stateso1(1);
stateso1(1)=[];

stateso2=stateso1;
stateso2(10)=stateso2(1);
stateso2(1)=[];

stateso3=stateso2;
stateso3(10)=stateso3(1);
stateso3(1)=[];

stateso4=stateso3;
stateso4(10)=stateso4(1);
stateso4(1)=[];

stateso5=stateso4;
stateso5(10)=stateso5(1);
stateso5(1)=[];

stateso6=stateso5;
stateso6(10)=stateso6(1);
stateso6(1)=[];

stateso7=stateso6;
stateso7(10)=stateso7(1);
stateso7(1)=[];

stateso8=stateso7;
stateso8(10)=stateso8(1);
stateso8(1)=[];


conds1={};
conds2={};
conds3={};
conds4={};
conds5={};
conds6={};
conds7={};
conds8={};
conds0={};

for d=1:size(out1,1);

NEW=out1.run;
if NEW(d)>-1;
    conds1{d}=cell2mat(stateso1{out1.state_number(d)+1});
    conds2{d}=cell2mat(stateso2{out1.state_number(d)+1});
    conds3{d}=cell2mat(stateso3{out1.state_number(d)+1});
    conds4{d}=cell2mat(stateso4{out1.state_number(d)+1});
    conds5{d}=cell2mat(stateso5{out1.state_number(d)+1});
    conds6{d}=cell2mat(stateso6{out1.state_number(d)+1});
    conds7{d}=cell2mat(stateso7{out1.state_number(d)+1});
    conds8{d}=cell2mat(stateso8{out1.state_number(d)+1});
    conds0{d}=cell2mat(stateso{out1.state_number(d)+1});
else
    conds1{d}='nope';
    conds2{d}='nope';
    conds3{d}='nope';
    conds4{d}='nope';
    conds5{d}='nope';
    conds6{d}='nope';
    conds7{d}='nope';
    conds8{d}='nope';
    conds0{d}='nope';
end

end

for d=1:size(out2,1);
    for h=1:9;
    if strmatch(out2.image_observed{d},cell2mat(stateso{h}))==1;
        hh=h;
    end
    end

NEW=out2.run;
if NEW(d)>-1;
    conds0{d+size(out1,1)}=cell2mat(stateso{hh});
    conds1{d+size(out1,1)}=cell2mat(stateso1{hh});
    conds2{d+size(out1,1)}=cell2mat(stateso2{hh});
    conds3{d+size(out1,1)}=cell2mat(stateso3{hh});
    conds4{d+size(out1,1)}=cell2mat(stateso4{hh});
    conds5{d+size(out1,1)}=cell2mat(stateso5{hh});
    conds6{d+size(out1,1)}=cell2mat(stateso6{hh});
    conds7{d+size(out1,1)}=cell2mat(stateso7{hh});
    conds8{d+size(out1,1)}=cell2mat(stateso8{hh});
else
    conds0{d+size(out1,1)}='nope';
    conds1{d+size(out1,1)}='nope';
    conds2{d+size(out1,1)}='nope';
    conds3{d+size(out1,1)}='nope';
    conds4{d+size(out1,1)}='nope';
    conds5{d+size(out1,1)}='nope';
    conds6{d+size(out1,1)}='nope';
    conds7{d+size(out1,1)}='nope';
    conds8{d+size(out1,1)}='nope';

end
end

    %images_loc_2    
stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds0;
dec=1:9;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
else
stimulus(f)=0;
end
end

stimulus2x=stimulus;
        
    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds1;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2a=stimulus;

    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds2;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2b=stimulus;

    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds3;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2c=stimulus;

    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds4;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2d=stimulus;




 
    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds5;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2e=stimulus;

    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds6;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2f=stimulus;

    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds7;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2g=stimulus;

    %images_loc_2    
    stimulus=zeros(size(new,1),1);
%conds=Data2.conditions;
rr=randperm(9);
states=[1 2 3 1 2 3 1 2 3];
conds=conds8;

for f=1:size(conds,2);
if strmatch(conds{f},'Chick')==1;
stimulus(f)=dec(1,1);
elseif strmatch(conds{f},'Frog')==1;
stimulus(f)=dec(1,2);
elseif strmatch(conds{f},'Beetle')==1;
stimulus(f)=dec(1,3);
elseif strmatch(conds{f},'Taxi')==1;
stimulus(f)=dec(1,4);
elseif strmatch(conds{f},'Motorbike')==1;
stimulus(f)=dec(1,5);
elseif strmatch(conds{f},'Bus')==1;
stimulus(f)=dec(1,6);
elseif strmatch(conds{f},'Banana')==1;
stimulus(f)=dec(1,7);
elseif strmatch(conds{f},'Apple')==1;
stimulus(f)=dec(1,8);
elseif strmatch(conds{f},'Strawberry')==1;
stimulus(f)=dec(1,9);
end
end

stimulus2h=stimulus;

stimulus=stimulus2x';
