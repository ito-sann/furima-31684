window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");
    console.log(inputValue);
    addTaxDom.innerHTML = inputValue * 0.1
    addProfit.innerHTML = inputValue * 0.9
})});
