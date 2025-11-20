// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract HaikuNFT {
    struct Haiku {
        address author;
        string line1;
        string line2;
        string line3;
    }
    Haiku[] public haikus;
    mapping(address => uint256[]) public sharedHaikus;
    uint256 public counter = 1;

    error HaikuNotUnique();
    error NotYourHaiku(uint256 id);
    error NoHaikusShared();

    function mintHaiku(
        string memory l1,
        string memory l2,
        string memory l3
    ) external {
        for (uint256 i = 1; i < haikus.length; i++) {
            Haiku memory existing = haikus[i];
            if (
                keccak256(bytes(existing.line1)) == keccak256(bytes(l1)) ||
                keccak256(bytes(existing.line2)) == keccak256(bytes(l2)) ||
                keccak256(bytes(existing.line3)) == keccak256(bytes(l3))
            ) {
                revert HaikuNotUnique();
            }
        }

        haikus.push(Haiku(msg.sender, l1, l2, l3));
        counter++;
    }

    function shareHaiku(uint256 id, address to) public {
        if (haikus[id].author != msg.sender) {
            revert NotYourHaiku(id);
        }
        sharedHaikus[to].push(id);
    }

    function getMySharedHaikus() public view returns (Haiku[] memory) {
        uint256[] memory ids = sharedHaikus[msg.sender];
        if (ids.length == 0) revert NoHaikusShared();

        Haiku[] memory result = new Haiku[](ids.length);
        for (uint256 i = 0; i < ids.length; i++) {
            result[i] = haikus[ids[i]];
        }
        return result;
    }
}

