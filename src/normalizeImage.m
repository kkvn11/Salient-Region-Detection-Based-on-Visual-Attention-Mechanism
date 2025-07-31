
function out = normalizeImage(in)
    in = double(in);
    out = (in - min(in(:))) / (max(in(:)) - min(in(:)));
end
