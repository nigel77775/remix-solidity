// 📦 Обязательно: подключи ethers.js в браузере или установи: npm install ethers
const { ethers } = require("ethers");

async function callSweepToken() {
  // Подключение к Metamask
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  await provider.send("eth_requestAccounts", []);
  const signer = provider.getSigner();

  // ✅ Укажи адрес контракта и адрес токена
  const contractAddress = "0x7A68bD26dAc2ba7973eC1532450E54443242Ea08"; // ← адрес контракта, где есть sweepToken()
  const tokenAddress = "0x8abC5d2a0C346f55BbEc5488B2d93d87E9EF69bA"; // ← адрес токена (ERC20), который нужно “зачистить”

  // ABI с функцией sweepToken
  const abi = [
    "function setDetectionBot(address detectionBotAddress)"
  ];

  // Подключаем контракт
  const contract = new ethers.Contract(contractAddress, abi, signer);

  // Вызываем sweepToken(tokenAddress)
  const tx = await contract.setDetectionBot(tokenAddress);
  await tx.wait();

  console.log("✅ sweepToken вызвана, транзакция:", tx.hash);
}

callSweepToken();
