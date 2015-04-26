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

%% LR image Input %% 
  imtLR=imread('AC2_8.tif');
  figure,imshow(imtLR);title('single cell- 8x8');
% imwrite(imtLR, 'imtLR.tif');

  imt= imresize(imtLR,[32,32],'bicubic');
% imwrite(imt, 'imt.tif');
  imt=double(imt);
  figure,imshow(imt,[0 255]); title('LR-32x32-double');

% B4C1_8=imread('AC2_8.tif');

% figure,imshow(B4C1_8);title('single cell- 8x8');
% imwrite(B4C1_8, 'B4C1_8.tif');
% B4C1_8int= imresize(B4C1_8,[32,32],'bicubic');
% imwrite(B4C1_8int, 'B4C1_8int.tif');
% imtLR=B4C1_8;
% imt=double(B4C1_8int);

%% ELM Test Processing %%

[Him,Wim]=size(imt);
for i=2:Him-1
    for j=2:Wim-1
        Xt((i-2)*(Wim-2)+(j-1),:)=[imt(i-1,j-1),imt(i-1,j),imt(i-1,j+1), ...,
            imt(i,j-1),imt(i,j),imt(i,j+1), imt(i+1,j-1),imt(i+1,j),imt(i+1,j+1), ...,
            (imt(i-1,j+1)-imt(i-1,j-1)+imt(i,j+1)-imt(i,j-1)+imt(i+1,j+1)-imt(i+1,j-1))/6, ...,
            (imt(i+1,j-1)-imt(i-1,j-1)+imt(i+1,j)-imt(i-1,j)+imt(i+1,j+1)-imt(i-1,j+1))/6, ...,
            (imt(i-1,j+1)+imt(i-1,j-1)-2*imt(i-1,j)+imt(i,j+1)+imt(i,j-1)-2*imt(i,j)+imt(i+1,j+1)+imt(i+1,j-1)-2*imt(i+1,j))/3, ...,
            (imt(i+1,j-1)+imt(i-1,j-1)-2*imt(i,j-1)+imt(i,j+1)+imt(i,j-1)-2*imt(i,j)+imt(i+1,j+1)+imt(i-1,j+1)-2*imt(i,j+1))/3, ...,
            (imt(i+1,j+1)-imt(i+1,j-1)-imt(i-1,j+1)+imt(i-1,j-1))/4];
    end;
end;

bt=repmat(b0,900,1);
gt=Xt*a+bt;
gt3=gt/200;
Ht2=1./(1+exp(-gt3));
Y=Ht2*Beta2b;

HFt=zeros(Him,Wim);
for p=2:Him-1
    for q=2:Wim-1
        HFt(p,q)=Y((p-2)*(Wim-2)+(q-1));
    end;
end;
for q=2:Wim-1
    HFt(1,q)=HFt(2,q);
    HFt(32,q)=HFt(31,q);
end;
for p=2:Him-1
    HFt(p,1)=HFt(p,2);
    HFt(p,32)=HFt(p,31);
end;
HFt(1,1)=(HFt(1,2)+HFt(2,1)+HFt(2,2))/3;
HFt(Him,1)=(HFt(Him,2)+HFt(Him-1,1)+HFt(Him-1,2))/3;
HFt(1,Wim)=(HFt(2,Wim)+HFt(2,Wim-1,1)+HFt(1,Wim-1))/3;
HFt(Him,Wim)=(HFt(Him-1,Wim)+HFt(Him,Wim-1)+HFt(Him-1,Wim-1))/3;

SR=HFt+imt;
%SR=3*HFt+imt;

%% print output %%
% figure,imshow(imtLR,[0 255]); title('LR');
% figure,imshow(imt,[0 255]); title('LR-32x32-double');
figure,imshow(HFt,[]); title('HF');
figure,imshow(SR,[0 255]); title('SR-32x32');

%% compute PSNR %% 
% psnr_Value = psnr_Value(imt,SR);

maxValue = double(max(imt(:)));
% calculate MSE, mean square error
mseImage = (double(imt) - double(SR)) .^2 ;
[rows columns] = size(imt);
mse = sum(mseImage(:))/(rows * columns);
RMSE = sqrt(mse);

psnr_Value = 10*log10(256^2/mse);
fprintf('PSNR:%f dB\n',psnr_Value);



