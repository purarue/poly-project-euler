function fifth_power_sum(n)
    local nstr = tostring(n)
    local sum = 0
    for i = 1, string.len(nstr) do
        sum = sum + (tonumber(string.sub(nstr, i, i)) ^ 5)
    end
    return sum
end

function find_sum_under(max_val)
    local sum = 0
    local i = 2
    while i < max_val do
        if fifth_power_sum(i) == i then sum = sum + i end
        i = i + 1
    end
    return sum
end

local guess = 999999
print(find_sum_under(guess))
