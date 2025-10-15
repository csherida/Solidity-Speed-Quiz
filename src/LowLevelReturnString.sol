// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract LowLevelReturnString {
    function main(address a) public returns (string memory) {
        // call function "baz()" on address a
        // do not use an interface
        // baz() returns a string. Return the string.
        // However, if baz reverts, return an empty string
        (bool ok, bytes memory ret) =
                            a.call(abi.encodeWithSelector(bytes4(keccak256("baz()"))));

        if (!ok){
            return "";
        }

        return abi.decode(ret, (string));

        // bonus challenge: use an interface and a high level call to accomplish the same task
    }
}
