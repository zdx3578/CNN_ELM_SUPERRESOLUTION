clear all; close all; clc;
ELMTraining;
%% LR image Input %% 
ELM_PSNR = zeros(1,8);
CNN_PSNR = zeros(1,8);
ELM_TIME = zeros(1,8);
CNN_TIME = zeros(1,8);
for indexnum = 1:8
    picturename = sprintf('%s%d%s','AC', indexnum,'_8.tif');
  imtLR=imread(picturename);
  %we just output the SR 32*32 picture
  %figure,imshow(imtLR);title('single cell- 8x8');
% imwrite(imtLR, 'imtLR.tif');

  imt= imresize(imtLR,[32,32],'bicubic');
% imwrite(imt, 'imt.tif');
  imt=double(imt);
  %also we just output the SR 32*32 picture
  %figure,imshow(imt,[0 255]); title('LR-32x32-double');

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
%figure,imshow(HFt,[]); title('HF');
    titlename = sprintf('%s%d %s','AC', indexnum,'SR-32x32');
figure,imshow(SR,[0 255]); title(titlename);

%% compute PSNR %% 
% psnr_Value = psnr_Value(imt,SR);

maxValue = double(max(imt(:)));
% calculate MSE, mean square error
mseImage = (double(imt) - double(SR)) .^2 ;
[rows columns] = size(imt);
mse = sum(mseImage(:))/(rows * columns);
RMSE = sqrt(mse);

psnr_Value = 10*log10(256^2/mse);
%fprintf('PSNR:%f dB\n',psnr_Value);
ELM_PSNR(indexnum) = psnr_Value;



% =========================================================================
% Test code for Super-Resolution Convolutional Neural Networks (SRCNN)
%
% Reference
%   Chao Dong, Chen Change Loy, Kaiming He, Xiaoou Tang. Learning a Deep Convolutional Network for Image Super-Resolution, 
%   in Proceedings of European Conference on Computer Vision (ECCV), 2014
%
%   Chao Dong, Chen Change Loy, Kaiming He, Xiaoou Tang. Image Super-Resolution Using Deep Convolutional Networks,
%   arXiv:1501.00092
%
% Chao Dong
% IE Department, The Chinese University of Hong Kong
% For any question, send email to ndc.forward@gmail.com
% =========================================================================


%% read ground truth image
%im  = imread('Cell_HR\AC3_32.tif');

im = imread(picturename);

%im  = imread('SRCNN\Set14\zebra.bmp');

%% set parameters
%up_scale = 3;
%model = 'SRCNN\model\9-5-5(ImageNet)\x3.mat';
%this is the previous model, I have change it
%so it can fit the 32*32 matrix
%up_scale = 3;
%model = 'model\9-3-5(ImageNet)\x3.mat';
% up_scale = 3;
% model = 'SRCNN\model\9-1-5(91 images)\x3.mat';
% up_scale = 2;
% model = 'SRCNN\model\9-5-5(ImageNet)\x2.mat'; 
up_scale = 4;
model = 'model/9-3-5(ImageNet)/x3.mat';
%% work on illuminance only
% if size(im,3)>1
%     im = rgb2ycbcr(im);
%     im = im(:, :, 1);
% end
% im_gnd = modcrop(im, up_scale);
% im_gnd = single(im_gnd)/255;

%the if-end segment is used for the rgb picture, out picture
%is black - white, so we doesn't need it
%and the modcrop function has no effect, we only need to regular it
%that is divide by the integer 255
im_regular = single(im)/255;

%% bicubic interpolation
%im_l = imresize(im_gnd, 1/up_scale, 'bicubic');
%The foregoing sentence is used for turn 32*32 -> 8*8
%since we already is 8*8, so we don't need it
%the following are the algorithem we need
%that is bicubic the 8*8 picture firstly
%make it to be the 32*32
%im_b = imresize(im_l, up_scale, 'bicubic');
im_b = imresize(im_regular, up_scale, 'bicubic');



%% SRCNN
tic;
im_h = SRCNN(model, im_b);
CNN_TIME(indexnum) = toc;
%% remove border
im_h = uint8(im_h * 255);
%im_gnd = shave(uint8(im_gnd * 255), [up_scale, up_scale]);
%we don't need the im_gnd, it is the 32*32 high resolution,
%and it is used to compare the super resolution to prove it even better
im_b = uint8(im_b * 255);

%% compute PSNR
%psnr_bic = compute_psnr(im_gnd,im_b);
%psnr_srcnn = compute_psnr(im_gnd,im_h);
psnr_try=compute_psnr(imt,im_h);

%% show results
%fprintf('PSNR for Bicubic Interpolation: %f dB\n', psnr_bic);
%fprintf('PSNR for SRCNN Reconstruction: %f dB\n', psnr_srcnn);
%fprintf('PSNR for TRY Reconstruction: %f dB\n', psnr_try);
CNN_PSNR(indexnum) = psnr_try;
%figure, imshow(im_b); title('Bicubic Interpolation');
    titlename_CNN = sprintf('%s %d', 'CNN-32x32', indexnum);
figure, imshow(im_h); title(titlename_CNN);
%figure, imshow(im_gnd); title('im_gnd');

%I add the output of the privious 8*8
%figure, imshow(im); title('The previous 8*8');

%imwrite(im_b, ['Bicubic Interpolation' '.bmp']);
%imwrite(im_h, ['SRCNN Reconstruction' '.bmp']);

end
%for debugging, to show the value of the matrix
CNN_PSNR
ELM_PSNR
CNN_TIME
x = 1:1:8;
figure;
elm_psnr_handle = plot(x, ELM_PSNR, '-.or')
axis([1 8 23 34])
xlabel('The number of the Pictures')
ylabel('The Value of the PSNR')
%legend(elm_psnr_handle, 'In ELM algorithm')
hold on;
cnn_psnr_handle = plot(x, CNN_PSNR, ':xb')
legend([elm_psnr_handle ,  cnn_psnr_handle] , 'In CNN algorithm','In ELM algorithm' );
figure;
t = 1:1:8;
plot(t, CNN_TIME, '-.or');
axis([1 8 3 5]) ;
% my computer is slow, change this range
xlabel('The number of the Pictures');
ylabel('Algorithm time consuming');
legend('In CNN algorithm');
