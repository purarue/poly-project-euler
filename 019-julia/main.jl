import Dates

let sundayCount = 0
    date = Dates.Date(1901, 1, 1)
    endDate = Dates.Date(2000, 12, 31)
    while date <= endDate
        sundayCount += Dates.dayofweek(date) == Dates.Sunday
        date += Dates.Month(1)
    end
    println(sundayCount)
end
