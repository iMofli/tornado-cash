// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "forge-std/Script.sol";
import "../src/ETHTornado.sol";
import "../src/Verifier.sol";

contract DeployETHTornado is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Despliega el contrato Verifier
        Verifier verifier = new Verifier();

        // Despliega el contrato ETHTornado con el address del Verifier
        ETHTornado ethTornado = new ETHTornado(address(verifier));

        vm.stopBroadcast();
    }
}
