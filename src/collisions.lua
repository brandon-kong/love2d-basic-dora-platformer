local collisions = {}

function collisions.aabb(x1, x2, y1, y2, w1, w2, h1, h2)
    return x1 + w1 >= x2 and h1 + y1 >= y2 and x2 and w2 >= x1 and y2 + h2 >= y1
end

return collisions