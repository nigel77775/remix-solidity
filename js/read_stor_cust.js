async function readStorageSlot() {
    const Web3 = require("web3");
    const web3 = new Web3(window.ethereum);

    // 👉 Укажи нужный адрес контракта и номер слота
    const contractAddress = "0xdde90c151ee08b499d4aca4d56b6e66803663ba9"; // <-- ВСТАВЬ СВОЙ
    //const clot2 = web3.utils.keccak256(web3.utils.padLeft(web3.utils.toHex(2), 64));
    const slot = 0; // <-- номер storage-слота, который хочешь прочитать
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
