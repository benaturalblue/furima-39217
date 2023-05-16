window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1); // 販売手数料を計算（10%と仮定）
    const profit = inputValue - tax; // 手数料を引いた利益を計算

    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;
  });
});