// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Two {

    uint max = 4000000;

    function sumEvenFibonacciNumbers() public view returns (uint) {
        uint result = 0;

        uint first = 1;
        uint second = 1;
        while (first < max) {
            if (first % 2 == 0) {
                result += first;
            }

            second = first + second;
            first = second - first;
        }

        return result;
    }

}