pub fn isSignedIntegral(comptime Type: type) bool {
    return @typeInfo(Type) == .int and @typeInfo(Type).int.signedness == .signed;
}

pub fn requireSignedIntegral(comptime Type: type) void {
    if (!isSignedIntegral(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.int and .signedness == .signed");
}

pub fn isUnsignedIntegral(comptime Type: type) bool {
    return @typeInfo(Type) == .int and @typeInfo(Type).int.signedness == .unsigned;
}

pub fn requireUnsignedIntegral(comptime Type: type) void {
    if (!isUnsignedIntegral(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.int and .signedness == .unsigned");
}

pub fn isFloatingPoint(comptime Type: type) bool {
    return @typeInfo(Type) == .float;
}

pub fn requireFloatingPoint(comptime Type: type) void {
    if (!isFloatingPoint(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.float");
}

pub fn isFloatingPoint32(comptime Type: type) bool {
    return @typeInfo(Type) == .float and @typeInfo(Type).float.bits == 32;
}

pub fn requireFloatingPoint32(comptime Type: type) void {
    if (!isFloatingPoint32(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.float and .bits == 32 (f32)");
}

pub fn isSignedNumeric(comptime Type: type) bool {
    return isSignedIntegral(Type) or isFloatingPoint(Type);
}

pub fn requireSignedNumeric(comptime Type: type) void {
    if (!isSignedNumeric(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.int or std.builtin.Type.float");
}

pub fn isNumeric(comptime Type: type) bool {
    return isUnsignedIntegral(Type) or isSignedNumeric(Type);
}

pub fn requireNumeric(comptime Type: type) void {
    if (!isNumeric(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.int or std.builtin.Type.float");
}

pub fn isBoolean(comptime Type: type) bool {
    return @typeInfo(Type) == .bool;
}

pub fn requireBoolean(comptime Type: type) void {
    if (!isBoolean(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.bool");
}

pub fn isArithmetic(comptime Type: type) bool {
    return isNumeric(Type) or isBoolean(Type);
}

pub fn requireArithmetic(comptime Type: type) void {
    if (!isArithmetic(Type))
        @compileError("Invalid std.builtin.Type - should be std.builtin.Type.int, std.builtin.Type.float, or std.builtin.Type.bool");
}
