// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//homework - to print the value of i

contract Loop {
    function loop() public {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop //placed separately in comparison to for loop
        uint j;
        while (j < 10) {
            j++;
        }
    }
}
