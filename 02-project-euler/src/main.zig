const std = @import("std");
const euler1 = @import("euler1.zig");
const euler2 = @import("euler2.zig");
const euler3 = @import("euler3.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("First projecteuler solution: {}\n", .{euler1.solve()});
    try stdout.print("Second projecteuler solution: {}\n", .{euler2.solve()});
    try stdout.print("Third projecteuler solution: {}\n", .{euler3.solve()});
}
