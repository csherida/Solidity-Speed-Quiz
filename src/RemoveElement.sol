// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract RemoveElement {

    uint256[] public arr;
    error IndexOutOfBounds();

    function setArr(uint256[] memory _arr) public {
        arr = _arr;
    }

    function removeElement(uint256 index) public {
        uint256 len = arr.length;
        if (index >= len) revert IndexOutOfBounds();

        uint256 last = len - 1;
        if (index != last) {
            arr[index] = arr[last];
        }
        arr.pop();
    }
}