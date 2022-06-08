function path = createPathWithRightIndex(map)
%CREATEPATHWITHRIGHTINDEX Summary of this function goes here
%   Detailed explanation goes here
    pathTemp = [];
    createdPath = createPath(map);
    index = 1;
    while index <= length(createdPath)
        x = createdPath(index, 1);
        y = createdPath(index, 2);
        pathTemp = [pathTemp; [x-1 y-1]];
        index = index + 1;
    end
    path = pathTemp;
end

