function valid = isValid(x, y, map, visited)
    %checks if a given position is valid
    valid = 0;
    if (x >= 1 && y >= 1) && (x <= length(map) && y <= length(map)) && (visited(x, y) == 0)
        valid = 1;
    end
end
