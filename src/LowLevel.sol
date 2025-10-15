// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

// --- Bonus: high-level version with interface + try/catch ---
interface IFoo { function foo() external; }

contract LowLevel {
    function main(address a) public returns (bool) {
        // call function "foo()" on address a
        // do not use an interface, use a low level call
        // return true if the call succeeded
        // return false if the call failed

        // bonus challenge: use an interface and a high level call to accomplish the same task

        // Using a precomputed selector avoids any signature typos at runtime
        (bool ok, ) = a.call(abi.encodeWithSelector(bytes4(keccak256("foo()"))));
        return ok;
    }

    function mainHighLevel(address a) public returns (bool) {
        try IFoo(a).foo() {
            return true;
        } catch {
            return false;
        }
    }
}
