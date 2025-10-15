// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

// --- Bonus: interface + high-level call with try/catch ---
interface IRare {
    function rare(uint256 x, uint256 y) external;
}

contract LowLevelArgs2 {
    function main(address a, uint256 x, uint256 y) public {
    (bool ok, bytes memory ret) =
                        a.call(abi.encodeWithSelector(bytes4(keccak256("rare(uint256,uint256)")), x, y));
        if (!ok) {
            assembly{
                revert(add(ret, 0x20), mload(ret))
            }
        }
    }

    // bonus challenge: use an interface and a high level call to accomplish the same task
    function mainHighLevel(address a, uint256 x, uint256 y) public {
        try IRare(a).rare(x, y) {
            // success: nothing else to do
        } catch (bytes memory reason) {
            assembly {
                revert(add(reason, 0x20), mload(reason))
            }
        }
    }
}