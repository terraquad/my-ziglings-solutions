//
// You have doubtless noticed that 'suspend' requires a block
// expression like so:
//
//     suspend {}
//
// The suspend block executes when a function suspends. To get
// sense for when this happens, please make the following
// program print the string
//
//     "ABCDEF"
//

// im sorry about my outburst of anger in the last exercise
// but if you see this (zig team) then pls make some keywords std functions or builtins before 1.0.0
const print = @import("std").debug.print;

pub fn main() void {
    print("A", .{});

    var frame = async suspendable();

    print("D", .{});

    resume frame;

    print("F", .{});
}

fn suspendable() void {
    print("B", .{});

    suspend {
        print("C", .{});
    }

    print("E", .{});
}
