import os
class QItem:
    def __init__(self, row, col, dist):
        self.row = row
        self.col = col
        self.dist = dist

    def __repr__(self):
        return f"QItem({self.row}, {self.col}, {self.dist})"

def min_distance(grid, source_row, source_col, dist_row, dist_col):
    source = QItem(0, source_row, source_col)

    # To maintain location visit status
    visited = [[False for _ in range(len(grid[0]))] for _ in range(len(grid))]

    # applying BFS on matrix cells starting from source
    queue = []
    queue.append(source)
    visited[source.row][source.col] = True

    while len(queue) != 0:
        source = queue.pop(0)

        # Destination found;
        if source.row == dist_row and source.col == dist_col:
            return source.dist

        # moving up
        if is_valid(source.row - 1, source.col, grid, visited):
            queue.append(QItem(source.row - 1, source.col, source.dist + 1))
            visited[source.row - 1][source.col] = True

        # moving down
        if is_valid(source.row + 1, source.col, grid, visited):
            queue.append(QItem(source.row + 1, source.col, source.dist + 1))
            visited[source.row + 1][source.col] = True

        # moving left
        if is_valid(source.row, source.col - 1, grid, visited):
            queue.append(QItem(source.row, source.col - 1, source.dist + 1))
            visited[source.row][source.col - 1] = True

        # moving right
        if is_valid(source.row, source.col + 1, grid, visited):
            queue.append(QItem(source.row, source.col + 1, source.dist + 1))
            visited[source.row][source.col + 1] = True

    return -1

# checking where move is valid or not
def is_valid(x, y, grid, visited):
    if (
        (x >= 0 and y >= 0)
        and (x < len(grid) and y < len(grid[0]))
        and (grid[x][y] != 1)
        and (visited[x][y] == False)
    ):
        return True
    return False

real_world_map = [
    [0, 0, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
]

drones = [
    [0, 0],
    [0, 0],
    [0, 0]
]

def create_path(map):
    limit = 1
    path = [(0,0)]
    index = 0
    while index < limit:
        x, y = path[index]
        if map[x][y] == 0:
            if x + 1 < len(map) and map[x + 1][y] == 0 and (x + 1, y) not in path:
                path.append((x + 1, y))
                limit += 1
            if y + 1 < len(map) and map[x][y + 1] == 0 and (x, y + 1) not in path:
                path.append((x, y + 1))
                limit += 1
            if x - 1 >= 0 and map[x - 1][y] == 0 and (x - 1, y) not in path:
                path.append((x - 1, y))
                limit += 1
            if y - 1 >= 0 and map[x][y - 1] == 0 and (x, y - 1) not in path:
                path.append((x, y - 1))
                limit += 1
        index += 1
    return path

def assign_positions(map):
    limit = 1
    path = [(0,0)]
    index = 0

    assign = {}
    def ass(x, y):
        min_dist = -1
        for drone_index, drone in enumerate(drones):
            dist = min_distance(map, drone[0], drone[1], x, y)
            if min_dist == -1 and dist != -1 or dist < min_dist:
                min_dist = dist
                drones[drone_index] = [x, y]
                assign[(x, y)] = drone_index

    def update(x, y, limit):
        if x + 1 < len(map) and map[x + 1][y] == 0 and (x + 1, y) not in path:
            path.append((x + 1, y))
            limit += 1
        if y + 1 < len(map) and map[x][y + 1] == 0 and (x, y + 1) not in path:
            path.append((x, y + 1))
            limit += 1
        if x - 1 >= 0 and map[x - 1][y] == 0 and (x - 1, y) not in path:
            path.append((x - 1, y))
            limit += 1
        if y - 1 >= 0 and map[x][y - 1] == 0 and (x, y - 1) not in path:
            path.append((x, y - 1))   
            limit += 1
        return limit

    while index < limit:
        x, y = path[index]
        if map[x][y] == 0:
            ass(x, y)
            limit = update(x, y, limit)
        index += 1
    return assign

print(os.getpid()) 
assign = assign_positions(real_world_map)
print(assign)