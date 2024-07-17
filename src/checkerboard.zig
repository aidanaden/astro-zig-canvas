const std = @import("std");

extern fn consoleLog(arg: u32) void;

const board_size: usize = 8;

/// `board_size` x `board_size` x `4`, where each pixel is 4 bytes (rgba)
var board_buffer = std.mem.zeroes([board_size][board_size][4]u8);

/// The returned pointer will be used as an offset integer to the wasm memory
export fn getBoardBufferPtr() [*]u8 {
    return @ptrCast(&board_buffer);
}

export fn getBoardSize() u8 {
    return board_size;
}

export fn colorBoard(dark_rvalue: u8, dark_gvalue: u8, dark_bvalue: u8, light_rvalue: u8, light_gvalue: u8, light_bvalue: u8) void {
    for (&board_buffer, 0..) |*row, y| {
        for (row, 0..) |*square, x| {
            var is_dark_square = true;
            if (y % 2 == 0) {
                is_dark_square = false;
            }
            if (x % 2 == 0) {
                is_dark_square = !is_dark_square;
            }
            const rvalue = if (is_dark_square) dark_rvalue else light_rvalue;
            const gvalue = if (is_dark_square) dark_gvalue else light_gvalue;
            const bvalue = if (is_dark_square) dark_bvalue else light_bvalue;
            square.*[0] = rvalue;
            square.*[1] = gvalue;
            square.*[2] = bvalue;
            square.*[3] = 255;
        }
    }
}
