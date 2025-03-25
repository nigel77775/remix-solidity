{

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint8(value) -> cleaned {
        cleaned := and(value, 0xff)
    }

    function validator_revert_t_uint8(value) {
        if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint8(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint8(value)
    }

    function cleanup_t_bytes32(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_bytes32(value) {
        if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
    }

    function abi_decode_t_bytes32(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_bytes32(value)
    }

    function abi_decode_tuple_t_uint8t_bytes32t_bytes32(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_t_bytes32_to_t_bytes32_fromStack(value, pos) {
        mstore(pos, cleanup_t_bytes32(value))
    }

    function abi_encode_tuple_t_bytes32__to_t_bytes32__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_bytes32(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint8(value))
    }

    function abi_encode_tuple_t_bytes32_t_uint8_t_bytes32_t_bytes32__to_t_bytes32_t_uint8_t_bytes32_t_bytes32__fromStack_reversed(headStart , value3, value2, value1, value0) -> tail {
        tail := add(headStart, 128)

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint8_to_t_uint8_fromStack(value1,  add(headStart, 32))

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value2,  add(headStart, 64))

        abi_encode_t_bytes32_to_t_bytes32_fromStack(value3,  add(headStart, 96))

    }

    function array_length_t_array$_t_uint256_$3_memory_ptr(value) -> length {

        length := 0x03

    }

    function array_storeLengthForEncoding_t_array$_t_uint256_$3_memory_ptr_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function array_dataslot_t_array$_t_uint256_$3_memory_ptr(ptr) -> data {
        data := ptr

    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function abi_encode_t_uint256_to_t_uint256(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encodeUpdatedPos_t_uint256_to_t_uint256(value0, pos) -> updatedPos {
        abi_encode_t_uint256_to_t_uint256(value0, pos)
        updatedPos := add(pos, 0x20)
    }

    function array_nextElement_t_array$_t_uint256_$3_memory_ptr(ptr) -> next {
        next := add(ptr, 0x20)
    }

    // uint256[3] -> uint256[3]
    function abi_encode_t_array$_t_uint256_$3_memory_ptr_to_t_array$_t_uint256_$3_memory_ptr_fromStack(value, pos)  {
        let length := array_length_t_array$_t_uint256_$3_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_array$_t_uint256_$3_memory_ptr_fromStack(pos, length)
        let baseRef := array_dataslot_t_array$_t_uint256_$3_memory_ptr(value)
        let srcPtr := baseRef
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {
            let elementValue0 := mload(srcPtr)
            pos := abi_encodeUpdatedPos_t_uint256_to_t_uint256(elementValue0, pos)
            srcPtr := array_nextElement_t_array$_t_uint256_$3_memory_ptr(srcPtr)
        }

    }

    function abi_encode_tuple_t_array$_t_uint256_$3_memory_ptr__to_t_array$_t_uint256_$3_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_array$_t_uint256_$3_memory_ptr_to_t_array$_t_uint256_$3_memory_ptr_fromStack(value0,  add(headStart, 0))

    }

}
