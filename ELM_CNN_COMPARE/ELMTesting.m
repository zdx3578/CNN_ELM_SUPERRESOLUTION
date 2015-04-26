%% Bone Marrow Stromal Cell Testing Image
%%  B=imread('bonecell_Image2.tif');
%%  figure,imshow(B);

% BC1=B(396:396+68,201:201+68);
% figure,imshow(BC1);
% BC1_32=imresize(BC1,[32,32],'bicubic');
% imwrite(BC1_32, 'BC1_32.tif');
% BC1_8=imresize(BC1,[8,8],'bicubic');
% imwrite(BC1_8, 'BC1_8.tif');
% BC1_8int= imresize(BC1_8,[32,32],'bicubic');
% imwrite(BC1_8int, 'BC1_8int.tif');
% imtLR=BC1_8;
% imtOrig=BC1_32;
% imt=double(BC1_8int);

% BC2=B(316:316+78,362:362+78);
% figure,imshow(BC2);
% BC2_32=imresize(BC2,[32,32],'bicubic');
% imwrite(BC2_32, 'BC2_32.tif');
% BC2_8=imresize(BC2,[8,8],'bicubic');
% imwrite(BC2_8, 'BC2_8.tif');
% BC2_8int= imresize(BC2_8,[32,32],'bicubic');
% imwrite(BC2_8int, 'BC2_8int.tif');
% imtLR=BC2_8;
% imtOrig=BC2_32;
% imt=double(BC2_8int);

% BC3=B(577:577+80,1060:1060+80);
% figure,imshow(BC3);
% BC3_32=imresize(BC3,[32,32],'bicubic');
% imwrite(BC3_32, 'BC3_32.tif');
% BC3_8=imresize(BC3,[8,8],'bicubic');
% imwrite(BC3_8, 'BC3_8.tif');
% BC3_8int= imresize(BC3_8,[32,32],'bicubic');
% imwrite(BC3_8int, 'BC3_8int.tif');
% imtLR=BC3_8;
% imtOrig=BC3_32;
% imt=double(BC3_8int);

% BC4=B(705:705+80,507:507+80);
% figure,imshow(BC4);
% BC4_32=imresize(BC4,[32,32],'bicubic');
% imwrite(BC4_32, 'BC4_32.tif');
% BC4_8=imresize(BC4,[8,8],'bicubic');
% imwrite(BC4_8, 'BC4_8.tif');
% BC4_8int= imresize(BC4_8,[32,32],'bicubic');
% imwrite(BC4_8int, 'BC4_8int.tif');
% imtLR=BC4_8;
% imtOrig=BC4_32;
% imt=double(BC4_8int);

%% HCF-7 Liver Tumer Cell Testing Image
%%  B2=imread('tumorcell_imagec5.tif');
%%  figure,imshow(B2);

% B2C1=B2(233:233+56,1261:1261+56);
% figure,imshow(B2C1);
% B2C1_32=imresize(B2C1,[32,32],'bicubic');
% imwrite(B2C1_32, 'B2C1_32.tif');
% B2C1_8=imresize(B2C1,[8,8],'bicubic');
% imwrite(B2C1_8, 'B2C1_8.tif');
% B2C1_8int= imresize(B2C1_8,[32,32],'bicubic');
% imwrite(B2C1_8int, 'B2C1_8int.tif');
% imtLR=B2C1_8;
% imtOrig=B2C1_32;
% imt=double(B2C1_8int);

% B2C2=B2(130:130+64,370:370+64);
% figure,imshow(B2C2);
% B2C2_32=imresize(B2C2,[32,32],'bicubic');
% imwrite(B2C2_32, 'B2C2_32.tif');
% B2C2_8=imresize(B2C2,[8,8],'bicubic');
% imwrite(B2C2_8, 'B2C2_8.tif');
% B2C2_8int= imresize(B2C2_8,[32,32],'bicubic');
% imwrite(B2C2_8int, 'B2C2_8int.tif');
% imtLR=B2C2_8;
% imtOrig=B2C2_32;
% imt=double(B2C2_8int);

% B2C3=B2(900:900+70,488:488+70);
% figure,imshow(B2C3);
% B2C3_32=imresize(B2C3,[32,32],'bicubic');
% imwrite(B2C3_32, 'B2C3_32.tif');
% B2C3_8=imresize(B2C3,[8,8],'bicubic');
% imwrite(B2C3_8, 'B2C3_8.tif');
% B2C3_8int= imresize(B2C3_8,[32,32],'bicubic');
% imwrite(B2C3_8int, 'B2C3_8int.tif');
% imtLR=B2C3_8;
% imtOrig=B2C3_32;
% imt=double(B2C3_8int);

% B2C4=B2(687:687+70,385:385+70);
% figure,imshow(B2C4);
% B2C4_32=imresize(B2C4,[32,32],'bicubic');
% imwrite(B2C4_32, 'B2C4_32.tif');
% B2C4_8=imresize(B2C4,[8,8],'bicubic');
% imwrite(B2C4_8, 'B2C4_8.tif');
% B2C4_8int= imresize(B2C4_8,[32,32],'bicubic');
% imwrite(B2C4_8int, 'B2C4_8int.tif');
% imtLR=B2C4_8;
% imtOrig=B2C4_32;
% imt=double(B2C4_8int);

% B3=imread('Oct11_exp2_con0007.jpg');
% figure,imshow(B3);
% B3C1_8=B3(314:314+7,335:335+7);
% figure,imshow(B3C1_8);
% imwrite(B3C1_8, 'B3C1_8.tif');
% B3C1_8int= imresize(B3C1_8,[32,32],'bicubic');
% imwrite(B3C1_8int, 'B3C1_8int.tif');
% imtLR=B3C1_8;
% imt=double(B3C1_8int);

%%  B4=imread('Oct11_exp2_con0053.jpg');
% figure,imshow(B4);title('big image');
%% B4C1_8=B4(321:321+7,286:286+7);
B4C1_8=imread('AC2_8.tif');

figure,imshow(B4C1_8);title('single cell- 8x8');
imwrite(B4C1_8, 'B4C1_8.tif');
B4C1_8int= imresize(B4C1_8,[32,32],'bicubic');
imwrite(B4C1_8int, 'B4C1_8int.tif');
imtLR=B4C1_8;
imt=double(B4C1_8int);

%% Testing Processing 
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
gt2=gt/500;
%gt3=gt/200;
Ht=1./(1+exp(-gt2));
%Ht2=1./(1+exp(-gt3));
%It=eye(7200,7200);
%H1=It/10000;
Y=Ht*Beta2b;
%Y=Ht2*Beta2b;
%Yint=uint8(Y);
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

%SR=HFt+imt;
SR=3*HFt+imt;

%figure,imshow(imtOrig,[0 255]);
figure,imshow(imtLR,[0 255]); title('LR-32x32');
figure,imshow(imt,[0 255]); title('LR-32x32-double');
figure,imshow(HFt,[]); title('HF');
figure,imshow(SR,[0 255]); title('SR-32x32');

% B2C4_HFt=HFt;
% B2C4_SR=SR;
% imwrite(B2C4_HFt,'B2C4_HFt.tif');
% imwrite(B2C4_SR,'B2C4_SR.tif');
% 
% B2C4_32=imtLR;
% psnr_Value(B2C4_32,B2C4_SR)
%[mssim, ssim_map] = ssim(BC4_32, BC4_SR);










