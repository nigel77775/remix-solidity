async function readStorageSlot() {
    const Web3 = require("web3");
    const web3 = new Web3(window.ethereum);

    const contract = "0x8efEA2464FDa1B982083a158C7A6d54287Aa4263";

    // 1. Читаем длину массива (slot 2)
    const lengthHex = await web3.eth.getStorageAt(contract, 2);
    const length = web3.utils.toBN(lengthHex).toNumber();
    console.log("📦 lockers.length =", length);

    // 2. Вычисляем keccak256(2)
    const baseSlot = web3.utils.keccak256(web3.utils.padLeft(web3.utils.toHex(2), 64));
    const baseBN = web3.utils.toBN(baseSlot);

    // 3. Читаем каждый элемент
    for (let i = 0; i < length; i++) {
    const elementSlot = baseBN.add(web3.utils.toBN(i));
    const value = await web3.eth.getStorageAt(contract, elementSlot.toString());
    console.log(`🔹 lockers[${i}] @ slot ${elementSlot.toString()}:`, value);
    const decodedAddress = "0x" + value.slice(26);
    console.log("🔍 Как адрес (если подходит):", decodedAddress);
    
    }
}
readStorageSlot()