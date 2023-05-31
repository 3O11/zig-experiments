fn multiplesOf3And5(iterEnd: i32) i32 {
    var sum: i32 = 0;
    var i: i32 = 0;
    while (i < iterEnd) {
        if (@rem(i, 3) == 0 or @rem(i, 5) == 0) {
            sum += i;
        }
        i += 1;
    }
    return sum;
}

pub fn solve() i32 {
    return multiplesOf3And5(1000);
}
