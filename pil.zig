const std = @import("std");

const PilStruct = extern struct {
    byte1: u8,
    byte2: u8,
    character1: u8,
    character2: u8,
    int: c_int,
    long: c_long,
    string: [*c]const u8,
    array: [8]u8
};

export fn extract(c_struct: *PilStruct) i32 {
    var newstruct = PilStruct {
        .byte1 = 42,
        .byte2 = 43,
        .character1 = 'A',
        .character2 = 'B',
        .int = 65535,
        .long = 9223372036854775807,
        .string = "pilzig\x00",
        .array = .{80, 105, 99, 111, 76, 105, 115, 112}
    };
    std.debug.print("Received struct: {}\n", .{c_struct});
    c_struct.* = newstruct;
    return 0;
}
