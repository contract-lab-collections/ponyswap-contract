// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;


contract BatchQuery {

    function batchQuery(
        address[] memory _targets,
        bytes[] memory _calldata
    ) public returns (bytes[] memory results) {
        require(_targets.length == _calldata.length, "length not match");
        results = new bytes[](_targets.length);
        for (uint256 i = 0; i < _targets.length; i++) {
            (bool success, bytes memory result) = _targets[i].call(_calldata[i]);
            require(success, "call failed");
            results[i] = result;
        }
    }
}


