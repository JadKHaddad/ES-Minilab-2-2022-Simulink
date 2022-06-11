function path = createPath(map)
%CREATEPATH Summary of this function goes here
%   Detailed explanation goes here
    
    pathTemp = [1 1];
    index = 1;
    limit = 2;
    while index < limit
        x = pathTemp(index, 1);
        y = pathTemp(index, 2);
        if map(x,y) == 0
            if x + 1 <= length(map) && map(x + 1, y) == 0 && containsFunc(pathTemp, x+1, y) == 0
                pathTemp = [pathTemp; [x+1 y]];
                limit = limit + 1;
            end
            
            if y + 1 <= length(map) && map(x, y + 1) == 0 && containsFunc(pathTemp, x, y + 1) == 0
                pathTemp = [pathTemp; [x y+1]];
                limit = limit + 1;
            end
            
            if x - 1 >= 1 && map(x - 1, y) == 0 && containsFunc(pathTemp, x - 1, y) == 0
                pathTemp = [pathTemp; [x-1 y]];
                limit = limit + 1;
            end
            
            if y - 1 >= 1 && map(x, y-1) == 0 && containsFunc(pathTemp, x, y-1) == 0
                pathTemp = [pathTemp; [x y-1]];
                limit = limit + 1;
            end
       
        end
        index = index + 1;
    end
    %append
    %pathTemp = [pathTemp; [1 1]]
    path = pathTemp;
end

