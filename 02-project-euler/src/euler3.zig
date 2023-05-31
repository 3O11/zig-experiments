const std = @import("std");
const Allocator = std.mem.Allocator;

fn sieve(maxValue: i64, allocator: Allocator) !std.ArrayList(i64) {
    var sieveArr = try std.ArrayList(bool).initCapacity(allocator, @intCast(usize, maxValue + 1));
    try sieveArr.resize(@intCast(usize, maxValue + 1));
    for (sieveArr.items) |*item| {
        item.* = true;
    }
    sieveArr.items[0] = false;
    sieveArr.items[1] = false;
    var i: i64 = 2;
    while (i * i <= maxValue) {
        if (sieveArr.items[@intCast(usize, i)]) {
            var j: i64 = i * i;
            while (j <= maxValue) {
                sieveArr.items[@intCast(usize, j)] = false;
                j += i;
            }
        }
        i += 1;
    }

    var primes = std.ArrayList(i64).init(allocator);
    for (sieveArr.items, 0..) |value, index| {
        if (value) {
            try primes.append(@intCast(i64, index));
        }
    }
    sieveArr.deinit();
    return primes;
}

fn getLargestPrimeFactor(num: i64, allocator: Allocator) !i64 {
    const max: i64 = @floatToInt(i64, @sqrt(@intToFloat(f32, num))) + 1;
    var primes = try sieve(max, allocator);
    var largest: i64 = 1;
    for (primes.items) |prime| {
        if (@rem(num, prime) == 0) {
            largest = prime;
        }
    }
    primes.deinit();
    return largest;
}

pub fn solve() i64 {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer {
        const deinitStatus = gpa.deinit();
        if (deinitStatus == .leak) @panic("Memory leak detected");
    }
    const allocator = gpa.allocator();
    const largestPrimeFactor = getLargestPrimeFactor(600851475143, allocator) catch {
        @panic("oh noes\n");
    };
    return largestPrimeFactor;
}
