//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Test, console2} from "lib/forge-std/src/Test.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMDAiIGhlaWdodD0iNTAwIj48dGV4dCBmaWxsPSJibGFjayIgeD0iMTAwIiB5PSI1MCI+SGkhIFRoaXMgaXMgbXkgU1ZHITwvdGV4dD48L3N2Zz4=";

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="300" height="500"><text fill="black" x="100" y="50">Hi! This is my SVG!</text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
