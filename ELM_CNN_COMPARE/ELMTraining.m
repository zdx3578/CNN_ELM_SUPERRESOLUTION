%% generate T %%

[f,pname] = uigetfile('*.tif','Pick first image');
% open File "HF_32" %
D=dir([pname '/' '*.tif']);
im=imread([pname f]);
%figure,imshow(im);
[Him,Wim]=size(im);

for k=1:length(D)
    disp(D(k).name);
    im=double(imread([pname '/' D(k).name]));
    
    for i=2:Him-1
        for j=2:Wim-1
            T((k-1)*(Him-2)*(Wim-2)+((i-2)*(Wim-2)+(j-1)),1)=im(i,j);
        end;
    end;
end;

%% generate X %%

[f,pname] = uigetfile('*.tif','Pick first image');
% open File "AC_8int" %
D=dir([pname '/' '*.tif']);
im=imread([pname f]);
%figure,imshow(im);
[Him,Wim]=size(im);

for k=1:length(D)
    disp(D(k).name);
    im=double(imread([pname '/' D(k).name]));
    
    for i=2:Him-1
        for j=2:Wim-1
            X((k-1)*(Him-2)*(Wim-2)+((i-2)*(Wim-2)+(j-1)),:)=[im(i-1,j-1),im(i-1,j),im(i-1,j+1), ...,
            	im(i,j-1),im(i,j),im(i,j+1), im(i+1,j-1),im(i+1,j),im(i+1,j+1), ...,
                (im(i-1,j+1)-im(i-1,j-1)+im(i,j+1)-im(i,j-1)+im(i+1,j+1)-im(i+1,j-1))/6, ...,
                (im(i+1,j-1)-im(i-1,j-1)+im(i+1,j)-im(i-1,j)+im(i+1,j+1)-im(i-1,j+1))/6, ...,
                (im(i-1,j+1)+im(i-1,j-1)-2*im(i-1,j)+im(i,j+1)+im(i,j-1)-2*im(i,j)+im(i+1,j+1)+im(i+1,j-1)-2*im(i+1,j))/3, ...,
                (im(i+1,j-1)+im(i-1,j-1)-2*im(i,j-1)+im(i,j+1)+im(i,j-1)-2*im(i,j)+im(i+1,j+1)+im(i-1,j+1)-2*im(i,j+1))/3, ...,
                (im(i+1,j+1)-im(i+1,j-1)-im(i-1,j+1)+im(i-1,j-1))/4];
        end;
    end;
end;

%% ELM training %%
tic();
a=rand(14,20);
b0=rand(1,20);
b=repmat(b0,7200,1);

a1=a*2-1;
g1=X*a1+b;
g3=g1/200;
H2=1./(1+exp(-g3));
I=eye(7200,7200);
I2=eye(20,20);
C=I;
C2=1000*I2;

Betab=H2'*inv(C+H2*H2')*T
Beta2b=inv(C2+H2'*H2)*H2'*T;
duration = toc();
duration
