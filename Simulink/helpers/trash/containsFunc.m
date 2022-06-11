function v = containsFunc(path, x, y)
%CONTAINS Summary of this function goes here
%   Detailed explanation goes here
    v = 0;
    index = 1;
    while index < length(path)
        if path(index, 1) == x && path(index,2) == y
            v = 1;
            break
        end
        index = index + 1;
    end
end

