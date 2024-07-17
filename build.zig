const std = @import("std");
const num_pages = 2;

pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .wasm32,
        .os_tag = .freestanding,
    });

    const exe = b.addExecutable(.{
        .name = "astro-checkerboard",
        .root_source_file = .{ .cwd_relative = "./src/checkerboard.zig" },
        .target = target,
        .optimize = .ReleaseSmall,
    });

    // @see https://github.com/ziglang/zig/issues/8633
    exe.import_memory = true;
    exe.global_base = 6560;
    exe.entry = .disabled;
    exe.rdynamic = true;
    exe.stack_size = std.wasm.page_size;

    exe.initial_memory = std.wasm.page_size * num_pages;
    exe.max_memory = std.wasm.page_size * num_pages;

    b.installArtifact(exe);
}
