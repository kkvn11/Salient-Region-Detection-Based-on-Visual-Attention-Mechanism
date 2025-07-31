
function out = mygaborfilter(I, angle)
    wavelength = 4;
    orientation = deg2rad(angle);
    gaborArray = gabor(wavelength, angle);
    out = imgaborfilt(I, gaborArray);
end
