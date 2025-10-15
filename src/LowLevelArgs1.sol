// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract LowLevelArgs1 {
    function main(address a, uint256 x) public {
        // call rare(x) using a low-level call
        // if the low level call reverts, revert also
        (bool ok, bytes memory ret) =
                            a.call(abi.encodeWithSelector(bytes4(keccak256("rare(uint256)")), x));

        if (!ok) {
            assembly {
                revert(add(ret, 0x20), mload(ret))
            }
        }

        // bonus challenge: use an interface and a high level call to accomplish the same task
    }
}