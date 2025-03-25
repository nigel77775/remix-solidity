async function readStorageSlot() {
    const Web3 = require("web3");
    const web3 = new Web3(window.ethereum);

    // 👉 Укажи нужный адрес контракта и номер слота
    const contractAddress = "0x592b5f3b05452610012fa91b28c7e055b5f71c6a"; // <-- ВСТАВЬ СВОЙ
    const slot = "0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc"; // <-- номер storage-слота, который хочешь прочитать

    // Попросим доступ к аккаунтам в Metamask
    await window.ethereum.request({ method: "eth_requestAccounts" });

    // Читаем storage
    const raw = await web3.eth.getStorageAt(contractAddress, slot);
    console.log(`🧠 Storage slot ${slot}:`, raw);

    // Попробуем извлечь адрес, если это uint256/address packed
    const decodedAddress = "0x" + raw.slice(26);
    console.log("🔍 Как адрес (если подходит):", decodedAddress);
}

readStorageSlot();
