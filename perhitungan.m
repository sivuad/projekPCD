clear
clc
close all

%membaca citra
img = imread('tomat.jpg');
img_gray = rgb2gray(img);
img_bw = imbinarize(img_gray);

% ekstraksi ciri warna RGB
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
img_Red = cat(3,R,G.*0,B.*0);
img_Green = cat(3,R.*0,G,B.*0);
img_Blue = cat(3,R.*0,G.*0,B);

subplot(3,2,1);
imshow(img);
subplot(3,2,2);
imshow(img_Red);
subplot(3,2,3);
imshow(img_Green);
subplot(3,2,4);
imshow(img_Blue);
subplot(3,2,5);
imshow(img_bw);
subplot(3,2,6);
imshow(img_gray);

%Menghitung nilai HIS
%input_gambar = input('Input Gambar: '); 
A= imread ('tomat.jpg'); 
RGB= im2double(A);
Red= RGB(:,:,1); 
Green= RGB(:,:,2); 
Blue= RGB(:,:,3); 
%Nilai Hue
atas=1/2*((Red-Green)+(Red-Blue));
bawah=((Red-Green).^2+((Red-Blue).*(Green-Blue))).^0.5;
teta = acosd(atas./(bawah));
if Blue >= Green
    H = 360 - teta;
else
    H = teta;
end

H = H/360;
[r c] = size(H);
for i=1 : r
    for j=1 : c
        z = H(i,j);
        z(isnan(z)) = 0; %isnan adalah is not none artinya jika bukan angka dia akan memberi 0
        H(i,j) = z;
    end
end
%Nilai S
S=1-(3./(sum(RGB,3))).*min(RGB,[],3);
[r c] = size(S);
for i=1 : r
    for j=1 : c
        z = S(i,j);
        z(isnan(z)) = 0;
        S(i,j) = z;
    end
end
%Nilai I
I=(Red+Green+Blue)/3;
disp (S)

%Nilai Mean,Varian Range
RGB= im2double(A);
Red= RGB(:,:,1); 
Green= RGB(:,:,2); 
Blue= RGB(:,:,3); 
%Hue
atas=1/2*((Red-Green)+(Red-Blue));
bawah=((Red-Green).^2+((Red-Blue).*(Green-Blue))).^0.5;
teta = acosd(atas./(bawah));
if Blue >= Green
    H = 360 - teta;
else
    H = teta;
end

H = H/360;
[r c] = size(H);
for i=1 : r
    for j=1 : c
        z = H(i,j);
        z(isnan(z)) = 0; %isnan adalah is not none artinya jika bukan angka dia akan memberi 0
        H(i,j) = z;
    end
end
%S
S=1-(3./(sum(RGB,3))).*min(RGB,[],3);
[r c] = size(S);
for i=1 : r
    for j=1 : c
        z = S(i,j);
        z(isnan(z)) = 0;
        S(i,j) = z;
    end
end
%I
I=(Red+Green+Blue)/3;

MeanR = mean2(Red);
MeanG = mean2(Green);
MeanB = mean2(Blue);
MeanH = mean2(H);
MeanS = mean2(S);
MeanI = mean2(I);
VarRed = var(Red(:)); VarGreen = var(Green(:)); VarBlue = var(Blue(:));
VarH = var(H(:)); VarS = var(S(:)); VarI = var(I(:));
RangeR = ((max(max(Red)))-(min(min(Red))));
RangeG = ((max(max(Green)))-(min(min(Green))));
RangeB = ((max(max(Blue)))-(min(min(Blue))));
RangeH = ((max(max(H)))-(min(min(H))));
RangeS = ((max(max(S)))-(min(min(S))));
RangeI = ((max(max(I)))-(min(min(I))));
disp (MeanR)
disp (MeanG)
disp (MeanB)
disp (MeanH)
disp (MeanS)
disp (MeanI)

