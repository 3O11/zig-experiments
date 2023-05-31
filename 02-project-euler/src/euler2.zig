fn evenFibSum(maxVal: i32) i32 {
    var sum: i32 = 0;
    var prev: i32 = 0;
    var curr: i32 = 1;
    while (curr < maxVal) {
        if (@rem(curr, 2) == 0) {
            sum += curr;
        }
        var temp: i32 = curr;
        curr += prev;
        prev = temp;
    }
    return sum;
}

pub fn solve() i32 {
    return evenFibSum(4000000);
}
