document.addEventListener("DOMContentLoaded", function () {}, false);

$(function () {
  window.addEventListener("message", function (event) {
    switch (event.data.action) {
      case "openGarage":
        pushCars(event.data.data);
        displayGarage(event.data.type, event.data.owner);
        updateCounter(event.data.counter, event.data.label, event.data.icon);
        break;
      case "startImpounding":
        impoundCarAnim(event.data.plate);
        break;
      case "impoundEnd":
        impoundCarEnd(event.data.state, event.data.plate);
        break;
      case "repairStart":
        repairCarAnim(event.data.plate);
        break;
      case "repairNoMoney":
        MarkShow(event.data.plate, "no", false);
        break;
      case "repairEndSuccess":
        repairCarEnd(true, event.data.plate);
        break;
      case "showHintNow":
        showHint(event.data.data);
        break;
      case "hideHint":
        hideHint();
        break;
      case "setLang":
        setLang(event.data.lang);
        setFontAwesome(event.data.url);
        setRepair(event.data.repairToggle);
        break;
    }
  });
});
