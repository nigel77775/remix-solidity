async function readContractState() {
    const Web3 = require("web3");
    const web3 = new Web3(window.ethereum);

    const contractAddress = "0xdde90c151ee08b499d4aca4d56b6e66803663ba9"; // <-- вставь свой

    const abi = [
        {
            "inputs": [],
            "name": "lockId",
            "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [],
            "name": "msgHash",
            "outputs": [{ "internalType": "bytes32", "name": "", "type": "bytes32" }],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [],
            "name": "controller",
            "outputs": [{ "internalType": "address", "name": "", "type": "address" }],
            "stateMutability": "view",
            "type": "function"
        }
    ];

    const contract = new web3.eth.Contract(abi, contractAddress);

    const lockId = await contract.methods.lockId().call();
    const msgHash = await contract.methods.msgHash().call();
    const controller = await contract.methods.controller().call();

    console.log("🔐 lockId:", lockId);
    console.log("📩 msgHash:", msgHash);
    console.log("🧑‍ controller:", controller);
}

readContractState();
