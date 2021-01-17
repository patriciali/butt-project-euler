// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Four {

    function reverse(uint256 _target) internal pure returns (uint256) {
        uint256 result = 0;
        // _target is at most 999 * 999 = 998001
        for (uint256 i = 0; i < 5; i += 1) {
            result = result * 10 + _target % 10;
            _target = _target / 10;

            if (_target < 10) {
                return result * 10 + _target;
            }

        }
        // we should never actually hit this
        return result;
    }

    function findLargestProductPalindrome() public pure returns (uint256) {
        uint256 result = 0;
        // FUCKING GAS CAN KISS MY ASS
        for (uint256 i = 999; i > 800; i -= 1) {
            for (uint256 j = 999; j > 800; j -= 1) {
                uint256 product = i * j;
                if (product < result) {
                    break;
                }
                if (product == reverse(product) && product > result) {
                    result = product;
                }
            }
        }
        return result;
    }

}