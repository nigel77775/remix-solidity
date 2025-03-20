async function sendTx() {
    const Web3 = require("web3");
    const web3 = new Web3(window.ethereum);

    // Подключаем Metamask
    await window.ethereum.request({ method: "eth_requestAccounts" });

    const txParams = {
        from: "0x799Daca5d24327447Fc4995785F7B35275925e69", // Твой адрес (должен быть выбран в Metamask)
        to: "0xc674b81103af3401246541488ea8d4ee3904fd86",   // Адрес контракта
        data: "0x8129fc1c" // initialize()
    };

    const txHash = await web3.eth.sendTransaction(txParams);
    console.log("✅ Транзакция отправлена:", txHash.transactionHash);
}

sendTx();


//0x4EA19A2A87AA1D0714f42989d6f2b52fE8dDe68B