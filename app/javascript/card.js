const pay = () => {
  Payjp.setPublicKey("pk_test_a3039d65c890969b4e2f7d7a");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address_purchase[number]"),
      exp_month: formData.get("address_purchase[exe_month]"),
      exp_year: `20${formData.get("address_purchase[exe_year]")}`,
      cvc: formData.get("address_purchase[cvc]"),
    };

    Payjp.createToken(card, (status, response) =>{
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
        
      }
    });
  });
};

window.addEventListener("load", pay);