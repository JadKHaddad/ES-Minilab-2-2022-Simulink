function dist = minDistanceSimulink(map, sourceRow, sourceCol, destRow, destCol)
    %calculates the minimal distance between two gevin positions - returns -1 if there is no path between the gevin positions 
    source = [sourceRow sourceCol 0];
    visited = zeros(length(map), length(map));
    qArray = ones(1000, 3);
    r = 0;
    f = 0;
    
    %helper functions
    function push(item)
       if r ~= 1000
           if f == 0
               f = 1;
           end
           r = r + 1;
           qArray(r,:) = item;
       end
    end

    function pop()
        if f == 0 || f > r
            return
        end
        f = f + 1;
    end

    function item = front()
        item = qArray(f,:);
    end
    %end of helper functions

    i = 1;
    while i <= length(map)
        j = 1;
        while j <= length(map(1,:))
            if i == destRow && j == destCol
                visited(i,j) = 0;
                j = j + 1;
                continue
            end
            if map(i,j) == 0 || map(i,j) == 99 || map(i,j) == 2 || map(i,j) == 3 || map(i,j) == -1 %can't visit 0 is unknown, 99 is wall, 2 to be discovered, 3 a drone is there, -1 could be discovered
                visited(i,j) = 1;
                j = j + 1;
                continue
            end
            visited(i,j) = 0;
            j = j + 1;
        end
        i = i + 1;
    end

    %applying BFS on matrix cells starting from source
    push(source);
    visited(sourceRow, sourceCol) = 1;

    dist = -1;
    while ~(f == 0 || f > r)
       p = front();
       pop();
       
       %destination found
       if p(1) == destRow && p(2) == destCol
           dist = p(3);
           return
       end
        
       %moving up
       if isValid(p(1) - 1, p(2), map, visited) == 1
          newItem = [p(1)-1 p(2) p(3)+1];
          push(newItem);
          visited(p(1)-1, p(2)) = 1;
       end
        
       %moving down
       if isValid(p(1) + 1, p(2), map, visited) == 1
          newItem = [p(1)+1 p(2) p(3)+1];
          push(newItem);
          visited(p(1)+1, p(2)) = 1;
       end
        
       %moving left
       if isValid(p(1), p(2) - 1, map, visited) == 1
          newItem = [p(1) p(2)-1 p(3)+1];
          push(newItem);
          visited(p(1), p(2)-1) = 1;
       end

       %moving right
       if isValid(p(1), p(2) + 1, map, visited) == 1
          newItem = [p(1) p(2)+1 p(3)+1];
          push(newItem);
          visited(p(1), p(2)+1) = 1;
       end
    end
end


