function valid = isValid(x, y, map, visited)
    valid = 0;
    if (x >= 1 && y >= 1) && (x <= length(map) && y <= length(map)) && (map(x,y) ~= 1) && (visited(x, y) == 0)
        valid = 1;
    end
end
