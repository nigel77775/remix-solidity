async function main() {
    const Web3 = require("web3");
    const web3 = new Web3(window.ethereum);

    await window.ethereum.request({ method: "eth_requestAccounts" });
    const accounts = await web3.eth.getAccounts();
    const myAddress = accounts[0];

    // ABI только для approve()
    const erc20Abi = [{
        "constant": false,
        "inputs": [
            { "name": "spender", "type": "address" },
            { "name": "amount", "type": "uint256" }
        ],
        "name": "approve",
        "outputs": [{ "name": "", "type": "bool" }],
        "type": "function"
    }];

    const token = new web3.eth.Contract(erc20Abi, "0x108eA58DA4a53785F38645daA905124a76413b89");
    const spender = "0xca4F4b11c386461EFded74CD0091Bf46C748A3B4";

    const tx = await token.methods.approve(spender, web3.utils.toWei("10000000000000000000000000")).send({ from: myAddress });

    console.log("✅ Approve done:", tx.transactionHash);
}

main(); // ⬅ обязательно вызвать
