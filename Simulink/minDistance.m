function dist = minDistance(map, sourceRow, sourceCol, destRow, destCol)
    source = [sourceRow sourceCol 0];
    visited = zeros(length(map), length(map));
    q = source;
    visited(sourceRow, sourceCol) = 1;

    dist = -1;
    while ~isempty(q)
       source = q(end,:);
       q(end,:) = [];
        
       if source(1) == destRow && source(2) == destCol
           dist = source(3);
           return
       end

       if isValid(source(1) - 1, source(2), map, visited) == 1
          newItem = [source(1)-1 source(2) source(3)+1];
          q = [q; newItem];
          visited(source(1)-1, source(2)) = 1;
       end

       if isValid(source(1) + 1, source(2), map, visited) == 1
          newItem = [source(1)+1 source(2) source(3)+1];
          q = [q; newItem];
          visited(source(1)+1, source(2)) = 1;
       end

       if isValid(source(1), source(2) - 1, map, visited) == 1
          newItem = [source(1) source(2)-1 source(3)+1];
          q = [q; newItem];
          visited(source(1), source(2)-1) = 1;
       end


       if isValid(source(1), source(2) + 1, map, visited) == 1
          newItem = [source(1) source(2)+1 source(3)+1];
          q = [q; newItem];
          visited(source(1), source(2)+1) = 1;
       end

    end
end

