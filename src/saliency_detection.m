
clear; close all; clc;
Z = imread('tiger.jpg'); % Read original image

g = [1,4,6,4,1; 4,16,4,16,4; 6,24,36,24,6; 4,16,24,16,4; 1,4,6,4,1];
g = g / 256;
Z0 = imfilter(Z, g); % Filtered image (0 scale)

Z1 = imresize(Z0, [128,128]);
Z2 = imresize(Z0, [64,64]);
Z3 = imresize(Z0, [32,32]);
Z4 = imresize(Z0, [16,16]);
Z5 = imresize(Z0, [8,8]);

% Channel separation
r = Z0(:,:,1); g = Z0(:,:,2); b = Z0(:,:,3);
ZL = rgb2gray(Z0);

% RG/BY channel calculation
RR = double(r) - ((double(g) + double(b))/2);
GG = double(g) - ((double(r) + double(b))/2);
BB = double(b) - ((double(r) + double(g))/2);
YY = (double(r) + double(g)) - 2 * (abs(double(r) - double(g)) + double(b));
RG = abs(RR - GG);
BY = abs(BB - YY);

% Gabor orientation features
ZL00 = mygaborfilter(double(ZL), 0);
ZL45 = mygaborfilter(double(ZL), 45);
ZL90 = mygaborfilter(double(ZL), 90);
ZL135 = mygaborfilter(double(ZL), 135);

% Further feature fusion and normalization steps follow...
clear;close all;clc;
Z=imread('tiger.jpg');%输入原始函数，读图像信息
   g=[1,4,6,4,1;   %滤波，将每一个像素点乘一个滤波矩阵
    4,16,4,16,4;
    6,24,36,24,6;
    4,16,24,16,4;
     1,4,6,4,1];
g=g/256;
Z0=imfilter(Z,g);%0尺度，对任意类型数组或多维图像进行滤波 g=imfilter(f,w,filtering_mode,boundary_options,size_optinos) 
                % f是输入图像，w为滤波模板，g为滤波结果
 imshow(Z0);%滤波后的更模糊一点，将尖锐的信息滤去
 
Z1=imresize(Z0,[128,128]);%1尺度，改变图像的大小。B = imresize(A, [numrows numcols])numrows和numcols分别指定目标图像的高度和宽度
Z2=imresize(Z0,[64,64]);%2尺度，
Z3=imresize(Z0,[32,32]);%3尺度，
Z4=imresize(Z0,[16,16]);%4尺度，
Z5=imresize(Z0,[8,8]);%5尺度，
imshow(Z1);%显示1尺度
imshow(Z2);%显示2尺度
imshow(Z3);%显示3尺度
imshow(Z4);%显示4尺度
imshow(Z5);%显示5尺度
 %R,G,B三通道颜色提取,0尺度下参数
r=Z0(:,:,1);
g=Z0(:,:,2);
b=Z0(:,:,3);
imshow(r);
imshow(g);
imshow(b);
%亮度提取%
ZL=rgb2gray(Z0);
imshow(ZL);
%颜色特征提取%
%R、G、B、Y（亮度）广义四通道颜色特征提取%
rr=double(r);
gg=double(g);
bb=double(b);
RR=(rr-((gg+bb)/2));
GG=(gg-((rr+bb)/2));
BB=(bb-((rr+gg)/2));
YY=((rr+gg)-(2*(abs(rr-gg)+bb)));
imshow(uint8(RR));
imshow(uint8(GG));
imshow(uint8(BB));
imshow(uint8(YY));
%RG通道%
RG=abs(RR-GG);
imshow(uint8(RG));
%BY通道%
BY=abs(BB-YY);
imshow(uint8(BY));
%朝向特征提取（Gabor滤波器）%
ZLd=double(ZL);
ZL00=mygaborfilter(ZLd,0);
ZL45=mygaborfilter(ZLd,45);
ZL90=mygaborfilter(ZLd,90);
ZL135=mygaborfilter(ZLd,135); 
%    imshow(uint8(ZL00));
imshow(ZL00);  
imshow(ZL45);
%   imshow(uint8(ZL45));
imshow(ZL90);
imshow(ZL135);
%亮度显著图的获取%
%（0,4）、（1,4）、（2,5）尺度亮度特征对比映射图的获取%
ZL1=imresize(ZL,[128,128]);
ZL2=imresize(ZL,[64,64]);
ZL4=imresize(ZL,[16,16]);
ZL5=imresize(ZL,[8,8]);
ZL11=imresize(ZL1,[256,256]);
ZL22=imresize(ZL2,[256,256]);
ZL44=imresize(ZL4,[256,256]);
ZL55=imresize(ZL5,[256,256]);
ZLd=double(ZL);
ZL11=double(ZL11);
ZL22=double(ZL22);
ZL44=double(ZL44);
ZL55=double(ZL55);
ZL04=abs(ZLd-ZL44);
ZL14=abs(ZL11-ZL44);
ZL25=abs(ZL22-ZL55);
imshow(ZL04);
imshow(ZL14);
imshow(ZL25);
%将插值后的图像进行归一化%
%   zl04=normalizeImage(ZL04);
%   zl14=normalizeImage(ZL14);
%   zl25=normalizeImage(ZL25);
  zl04=normalizeImage(ZL04);
  zl14=normalizeImage(ZL14);
  zl25=normalizeImage(ZL25);
  imshow(zl04);
  imshow(zl14);
  imshow(zl25);
%直接相加获得亮度特征图%
 zl04=double(zl04);
  zl14=double(zl14);
  zl25=double(zl25);
  IL=zl04+zl14+zl25;
%   il=Normal(IL,255);
  il=normalizeImage(IL);
  light=il;
  imshow(light);
%颜色特征图的获取%
 %（0,4）、（1,4）、（2,5）尺度RG通道特征对比映射图的获取%
 RG1=imresize(RG,[128,128]);
 RG2=imresize(RG,[64,64]);
 RG4=imresize(RG,[16,16]);
 RG5=imresize(RG,[8,8]);
 RG11=imresize(RG1,[256,256]);
 RG22=imresize(RG2,[256,256]);
 RG44=imresize(RG4,[256,256]);
 RG55=imresize(RG5,[256,256]);
 RG04=abs(RG-RG44);
 RG14=abs(RG11-RG44);
 RG25=abs(RG22-RG55);
 imshow(RG04); 
 imshow(RG14);
 imshow(RG25);
 %将插值后的图像进行归一化%% 
 rg04=normalizeImage(RG04);
 rg14=normalizeImage(RG14);
 rg25=normalizeImage(RG25);
 imshow(rg04);
 imshow(rg14);
 imshow(rg25);
 %直接相加获得RG通道特征图%
 rg04=double(rg04);
  rg14=double(rg14);
  rg25=double(rg25);
  IRG=rg04+rg14+rg25;
 
   irg=normalizeImage(IRG);
 
   imshow(irg);
 %（0,4）、（1,4）、（2,5）尺度BY通道特征对比映射图的获取%
  BY1=imresize(BY,[128,128]);
 BY2=imresize(BY,[64,64]);
 BY4=imresize(BY,[16,16]);
  BY5=imresize(BY,[8,8]);
  BY11=imresize(BY1,[256,256]);
  BY22=imresize(BY2,[256,256]);
  BY44=imresize(BY4,[256,256]);
  BY55=imresize(BY5,[256,256]);
  BY04=abs(BY-BY44);
  BY14=abs(BY11-BY44);
  BY25=abs(BY22-BY55);
   imshow(BY04); 
 imshow(BY14);
 imshow(BY25);
 %将插值后的图像进行归一化%
  by04=normalizeImage(BY04);
  by14=normalizeImage(BY14);
  by25=normalizeImage(BY25);
 imshow(by04);
 imshow(by14);
 imshow(by25);
 %直接相加获得by通道特征图%
 by04=double(by04);
  by14=double(by14);
  by25=double(by25);
  IBY=by04+by14+by25;
%   iby=Normal(IBY,255);
  iby=normalizeImage(IBY); 
  imshow(iby);
%直接相加获得颜色特征图%
 COLOR=irg+iby;
%  color=Normal(COLOR,255);
 color=normalizeImage(COLOR);
 imshow(color);
%  
 %朝向特征图的获取%
%（0,4）、（1,4）、（2,5）尺度0°朝向特征对比映射图的获取%
  ZL001=imresize(ZL00,[128,128]);
 ZL002=imresize(ZL00,[64,64]);
 ZL004=imresize(ZL00,[16,16]);
  ZL005=imresize(ZL00,[8,8]);
  ZL0011=imresize(ZL001,[256,256]);
  ZL0022=imresize(ZL002,[256,256]);
  ZL0044=imresize(ZL004,[256,256]);
  ZL0055=imresize(ZL005,[256,256]);
  ZL0004=abs(ZL00-ZL0044);
  ZL0014=abs(ZL0011-ZL0044);
  ZL0025=abs(ZL0022-ZL0055);
将插值后的图像进行归一化%
% 
  zl0004=normalizeImage(ZL0004);
  zl0014=normalizeImage(ZL0014);
  zl0025=normalizeImage(ZL0025);
 imshow(zl0004);
 imshow(zl0014);
 imshow(zl0025);
%直接相加获得0°朝向特征图%
zl0004=double(zl0004);
  zl0014=double(zl0014);
  zl0025=double(zl0025);
  IL00=zl0004+zl0014+zl0025;
   il00=normalizeImage(IL00);
   imshow(il00);
%（0,4）、（1,4）、（2,5）尺度45°朝向特征对比映射图的获取%
  ZL451=imresize(ZL45,[128,128]);
 ZL452=imresize(ZL45,[64,64]);
 ZL454=imresize(ZL45,[16,16]);
  ZL455=imresize(ZL45,[8,8]);
  ZL4511=imresize(ZL451,[256,256]);
  ZL4522=imresize(ZL452,[256,256]);
  ZL4544=imresize(ZL454,[256,256]);
  ZL4555=imresize(ZL455,[256,256]);
  ZL4504=abs(ZL45-ZL4544);
  ZL4514=abs(ZL4511-ZL4544);
  ZL4525=abs(ZL4522-ZL4555);
%将插值后的图像进行归一化%
 zl4504=normalizeImage(ZL4504);
 zl4514=normalizeImage(ZL4514);
 zl4525=normalizeImage(ZL4525);
 imshow(zl4504);
 imshow(zl4514);
 imshow(zl4525);
%直接相加获得45°朝向特征图%
 zl4504=double(zl4504);
 zl4514=double(zl4514);
 zl4525=double(zl4525);
 IL45=zl4504+zl4514+zl4525;
 il45=normalizeImage(IL45);
 imshow(il45);
%（0,4）、（1,4）、（2,5）尺度90°朝向特征对比映射图的获取%
 ZL901=imresize(ZL90,[128,128]);
 ZL902=imresize(ZL90,[64,64]);
 ZL904=imresize(ZL90,[16,16]);
  ZL905=imresize(ZL90,[8,8]);
  ZL9011=imresize(ZL901,[256,256]);
  ZL9022=imresize(ZL902,[256,256]);
  ZL9044=imresize(ZL904,[256,256]);
  ZL9055=imresize(ZL905,[256,256]);
  ZL9004=abs(ZL90-ZL9044);
  ZL9014=abs(ZL9011-ZL9044);
  ZL9025=abs(ZL9022-ZL9055);
%将插值后的图像进行归一化%
 zl9004=normalizeImage(ZL9004);
 zl9014=normalizeImage(ZL9014);
 zl9025=normalizeImage(ZL9025);
 imshow(zl9004);
 imshow(zl9014);
 imshow(zl9025);
%直接相加获得90°朝向特征图%
  zl9004=double(zl9004);
  zl9014=double(zl9014);
  zl9025=double(zl9025);
  IL90=zl9004+zl9014+zl9025;
  il90=normalizeImage(IL90);
   imshow(il90);
 %（0,4）、（1,4）、（2,5）尺度135°朝向特征对比映射图的获取%
 ZL1351=imresize(ZL135,[128,128]);
 ZL1352=imresize(ZL135,[64,64]);
 ZL1354=imresize(ZL135,[16,16]);
 ZL1355=imresize(ZL135,[8,8]);
 ZL13511=imresize(ZL1351,[256,256]);
 ZL13522=imresize(ZL1352,[256,256]);
 ZL13544=imresize(ZL1354,[256,256]);
 ZL13555=imresize(ZL1355,[256,256]);
ZL13504=abs(ZL135-ZL13544);
 ZL13514=abs(ZL13511-ZL13544);
 ZL13525=abs(ZL13522-ZL13555);
%将插值后的图像进行归一化%
 zl13504=normalizeImage(ZL13504);
 zl13514=normalizeImage(ZL13514);
 zl13525=normalizeImage(ZL13525);
 imshow(zl13504);
 imshow(zl13514);
 imshow(zl13525);
%直接相加获得135°朝向特征图%
 zl13504=double(zl13504);
 zl13514=double(zl13514);
 zl13525=double(zl13525);
 IL135=zl13504+zl13514+zl13525;
 il135=normalizeImage(IL135);
 imshow(il135);
%直接相加获得朝向特征图%
 DIRECTION=il00+il45+il90+il135;
 direction=normalizeImage(DIRECTION);
  
  
 imshow(direction); 
 %直接相加获得原始图像的显著图%
 light=double(light);
 color=double (color);
 direction=double (direction);
 FINAL=light+color+direction;
 final=normalizeImage(FINAL);
 imshow(final);
