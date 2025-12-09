var CurrentGarageType = null;
var isRepairAvailable = true;

function setRepair(state) {
  isRepairAvailable = state;
}

function displayGarage(type, owner) {
  document.getElementById("search-bar").value = "";
  CurrentGarageType = type;
  const garageContainer = $("#garage-container");
  const showroomButton = $("#showroom-button");

  garageContainer.removeClass();
  showroomButton.removeClass();

  showroomButton.addClass("green");

  garageContainer.show();
  animateCSS("#garage-container", "backInLeft");

  if (type == "Vehicle" && owner == null) {
    showroomButton.show();
    animateCSS("#showroom-button", "backInRight");
  } else {
    showroomButton.hide();
  }

  const inputs = document.getElementsByClassName("carname-input");
  Array.from(inputs).forEach((input) => {
    input.style.width = input.value.length + 0.3 + "ch";
  });
}

function hideGarage() {
  animateCSS("#garage-container", "backOutLeft").then((message) => {
    $("#garage-container").hide();
  });
  if (CurrentGarageType == "Vehicle") {
    animateCSS("#showroom-button", "backOutRight").then((message) => {
      $("#showroom-button").hide();
    });
  }
}

const animateCSS = (element, animation, prefix = "animate__") =>
  // We create a Promise and return it
  new Promise((resolve, reject) => {
    const animationName = `${prefix}${animation}`;
    const node = document.querySelector(element);

    node.classList.add(`${prefix}animated`, animationName);

    // When the animation ends, we clean the classes and resolve the Promise
    function handleAnimationEnd(event) {
      event.stopPropagation();
      node.classList.remove(`${prefix}animated`, animationName);
      resolve("Animation ended");
    }

    node.addEventListener("animationend", handleAnimationEnd, { once: true });
  });

function putCar(plate, label, bg, logo, brand, state) {
  let string = "";
  let shortPlate = plate.replace(/\s/g, "");
  let sets = localStorage.getItem(shortPlate);
  if (!sets || sets == null || sets == undefined) {
    let user_settings = {
      shortplate: shortPlate,
      userlabel: label,
      label: label,
    };
    localStorage.setItem(shortPlate, JSON.stringify(user_settings));
  } else {
    sets = JSON.parse(sets);
    label = sets.userlabel;
  }
  if (state == 1) {
    string = `
        <div class="car" data-plate="${plate}" data-label="${label}" data-brand="${brand}" data-state="${state}">
            <div class="impounding-veh" id="impounding-veh-plate-${shortPlate}" style="display: none;">
                <div id="center-impound">
                    <div id="impound-stage-1-${shortPlate}" class="impound-stage-1" style="display: none;">
                        <div class="lds-ring">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                        <h1 id="impounding-vehicle-text-${shortPlate}" class="impounding-vehicle-text">${translate["impounding-vehicle-text"]}</h1>
                    </div>
                    <div id="impound-stage-2-${shortPlate}" class="impound-stage-2" style="display: none;">
                        <div class="wrapper" id="yesmark-${shortPlate}" style="display: none;">
                            <svg class="checkmark" viewBox="0 0 52 52">
                                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                            </svg>
                        </div>
                        <div class="wrapper" id="nomark-${shortPlate}" style="display: none;">
                            <svg class="checkmark2" viewBox="0 0 52 52">
                                <circle class="checkmark_circle2" cx="26" cy="26" r="25" fill="none" />
                                <path class="checkmark_check2" fill="none"
                                    d="M14.1 14.1l23.8 23.8 m0,-23.8 l-23.8,23.8" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            <div id="car-image" style="background-image: url('${bg}');"></div>
            <div id="car-bottom-content">
                <div class="flexBox gap10 justify">
                    <h1 id="car-name"> <img src="${logo}" onerror="this.style.display='none'"> <input type="text" value="${label}" oninput="this.style.width = (this.value.length + 0.3) + 'ch';" class="carname-input" id="input-${shortPlate}" onchange="updateCarLabel('${shortPlate}')"></h1>
                
                    <h1 id="plate">${plate}</h1>
                </div>
                <div class="car-btns" id="btn-${shortPlate}">
                    <h1 onclick="impoundCar('${plate}')" class="red">${translate["btn-impound"]}</h1>
                    <h1 onclick="selectCar('${plate}')">${translate["btn-select"]}</h1>
                    <!--<h1 onclick="addToFav('${plate}')"><i class="fa-regular fa-star"></i></h1>-->
                </div>
            </div>
        </div>
    `;
  } else {
    string = `
        <div class="car" data-plate="${plate}" data-label="${label}" data-brand="${brand}" data-state="${state}">
            <div class="impounding-veh" id="impounding-veh-plate-${shortPlate}" style="display: none;">
                <div id="center-impound">
                    <div id="impound-stage-1-${shortPlate}" class="impound-stage-1" style="display: none;">
                        <div class="lds-ring">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                        <h1 id="impounding-vehicle-text-${shortPlate}" class="impounding-vehicle-text">${
      translate["impounding-vehicle-text"]
    }</h1>
                    </div>
                    <div id="impound-stage-2-${shortPlate}" class="impound-stage-2" style="display: none;">
                        <div class="wrapper" id="yesmark-${shortPlate}" style="display: none;">
                            <svg class="checkmark" viewBox="0 0 52 52">
                                <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                                <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                            </svg>
                        </div>
                        <div class="wrapper" id="nomark-${shortPlate}" style="display: none;">
                            <svg class="checkmark2" viewBox="0 0 52 52">
                                <circle class="checkmark_circle2" cx="26" cy="26" r="25" fill="none" />
                                <path class="checkmark_check2" fill="none"
                                    d="M14.1 14.1l23.8 23.8 m0,-23.8 l-23.8,23.8" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            <div id="car-image" style="background-image: url('${bg}');"></div>
            <div id="car-bottom-content">
                <div class="flexBox gap10 justify">
                    <h1 id="car-name"> <img src="${logo}" onerror="this.style.display='none'"> <input type="text" value="${label}" oninput="this.style.width = (this.value.length + 0.3) + 'ch';" class="carname-input" id="input-${shortPlate}" onchange="updateCarLabel('${shortPlate}')"></h1>
                
                    <h1 id="plate">${plate}</h1>
                </div>
                <div class="car-btns" id="btn-${shortPlate}">
                    <h1 onclick="takeCar('${plate}')" class="green">${
      translate["btn-take"]
    }</h1>
                    <h1 onclick="selectCar('${plate}')">${
      translate["btn-select"]
    }</h1>
                    ${
                      isRepairAvailable
                        ? `<h1 onclick="repairCar('${plate}')">${translate["btn-repair"]}</h1>`
                        : ""
                    }
                    <!--<h1 onclick="addToFav('${plate}')"><i class="fa-regular fa-star"></i></h1>-->
                </div>
            </div>
        </div>
    `;
  }

  $("#cars-container").append(string);
}

function repairCarAnim(plate) {
  let shortPlate = plate.replace(/\s/g, "");
  let doc = document.getElementById("btn-" + shortPlate);
  $("#impounding-veh-plate-" + shortPlate).fadeIn();
  $("#impound-stage-2-" + shortPlate).hide();
  $("#nomark-" + shortPlate).hide();
  $("#yesmark-" + shortPlate).hide();
  $("#impound-stage-1-" + shortPlate).fadeIn();

  document.getElementById("impounding-vehicle-text-" + shortPlate).innerHTML =
    translate["repairing-vehicle-text"];

  let string = `
        <h1 onclick="">${translate["repairing"]}</h1>
    `;
  doc.innerHTML = string;
}

function repairCarEnd(status, plate) {
  impoundCarEnd(status, plate);
}

function MarkShow(plate, type, continued) {
  let shortPlate = plate.replace(/\s/g, "");
  if (continued == false) {
    $("#impounding-veh-plate-" + shortPlate).fadeIn();
    $("#impound-stage-1-" + shortPlate).hide();
  } else {
    $("#impound-stage-1-" + shortPlate).fadeOut();
  }
  $("#nomark-" + shortPlate).hide();
  $("#yesmark-" + shortPlate).hide();
  $("#impound-stage-2-" + shortPlate).fadeIn();

  if (type == "no") {
    $("#nomark-" + shortPlate).fadeIn();
    setTimeout(() => {
      $("#impound-stage-2-" + shortPlate).fadeOut();
      $("#nomark-" + shortPlate).fadeOut();
      $("#impounding-veh-plate-" + shortPlate).fadeOut();
    }, 2000);
  } else {
    $("#yesmark-" + shortPlate).fadeIn();
    setTimeout(() => {
      $("#impound-stage-2-" + shortPlate).fadeOut();
      $("#yesmark-" + shortPlate).fadeOut();
      $("#impounding-veh-plate-" + shortPlate).fadeOut();
    }, 2000);
  }
}

function impoundCarAnim(plate) {
  let shortPlate = plate.replace(/\s/g, "");
  let doc = document.getElementById("btn-" + shortPlate);
  $("#impounding-veh-plate-" + shortPlate).fadeIn();
  $("#impound-stage-2-" + shortPlate).hide();
  $("#nomark-" + shortPlate).hide();
  $("#yesmark-" + shortPlate).hide();
  $("#impound-stage-1-" + shortPlate).fadeIn();

  document.getElementById("impounding-vehicle-text-" + shortPlate).innerHTML =
    translate["impounding-vehicle-text"];

  let string = `
        <h1 onclick="">${translate["impounding"]}</h1>
    `;
  doc.innerHTML = string;
}

var cars_state = { gar: 0, imp: 0 };

function updateCounter(data, label, icon) {
  updateCount(data.gar, data.imp);
  document.getElementById("garage-text").innerHTML = `
    <i class="${icon}"></i> <span id="garage-head-translation">${label}</span>
    `;
}

function updateCount(gar, imp) {
  document.getElementById("cars-state").innerHTML = gar + "/" + imp;
  cars_state.gar = gar;
  cars_state.imp = imp;
}

function impoundCarEnd(status, plate) {
  let shortPlate = plate.replace(/\s/g, "");
  let doc = document.getElementById("btn-" + shortPlate);
  if (status == true) {
    let string = `
            <h1 onclick="takeCar('${plate}')" class="green">${
      translate["btn-take"]
    }</h1>
            <h1 onclick="selectCar('${plate}')">${translate["btn-select"]}</h1>
            ${
              isRepairAvailable
                ? `<h1 onclick="repairCar('${plate}')">${translate["btn-repair"]}</h1>`
                : ""
            }
            <!--<h1 onclick="addToFav('${plate}')"><i class="fa-regular fa-star"></i></h1>-->
        `;
    doc.innerHTML = string;
    cars_state.gar += 1;
    cars_state.imp -= 1;
    updateCount(cars_state.gar, cars_state.imp);
    MarkShow(plate, "yes", true);
  } else {
    let string = `
            <h1 onclick="impoundCar('${plate}')" class="red">${
      translate["btn-impound"]
    }</h1>
            <h1 onclick="selectCar('${plate}')">${translate["btn-select"]}</h1>
            ${
              isRepairAvailable
                ? `<h1 onclick="repairCar('${plate}')">${translate["btn-repair"]}</h1>`
                : ""
            }
            <!--<h1 onclick="addToFav('${plate}')"><i class="fa-regular fa-star"></i></h1>-->
        `;
    doc.innerHTML = string;
    MarkShow(plate, "no", true);
  }
}

function pushCars(data) {
  document.getElementById("cars-container").innerHTML = "";
  selectedCar = data[0].plate;
  for (let i = 0; i < data.length; i++) {
    putCar(
      data[i].plate,
      data[i].label,
      data[i].bg,
      data[i].logo,
      data[i].brand,
      data[i].state
    );
  }
}

function takeCar(plate) {
  hideGarage();
  $.post(
    `https://${GetParentResourceName()}/takeCar`,
    JSON.stringify({ plate: plate })
  );
}

function impoundCar(plate) {
  $.post(
    `https://${GetParentResourceName()}/impoundCar`,
    JSON.stringify({ plate: plate })
  );
}

function repairCar(plate) {
  $.post(
    `https://${GetParentResourceName()}/repairCar`,
    JSON.stringify({ plate: plate })
  );
}

function closeGarage() {
  hideGarage();
  $.post(`https://${GetParentResourceName()}/closeGarage`, JSON.stringify({}));
}

var selectedCar;

function selectCar(plate) {
  if (selectedCar == plate) return;
  selectedCar = plate;
  $.post(
    `https://${GetParentResourceName()}/selectCar`,
    JSON.stringify({ plate: plate })
  );
}

document.onkeyup = function (data) {
  if (data.which == 27) {
    closeGarage();
  }
};

var lasthint = "";
var CachedHint = "";

function showCachedHint() {
  showHint(CachedHint);
}

function showHint(text) {
  if (text != lasthint) {
    if (document.getElementById("hint-cent").style.display == "none") {
      $("#hint-cent").show();
      animateCSS("#hint-cent", "fadeInUpBig").then((message) => {});
    }
    isHintShowed = true;
    lasthint = text;
    document.getElementById("hint-text").innerHTML = text;
  }
}

function hideHint() {
  if (isHintShowed == false) return;
  CachedHint = lasthint;
  lasthint = "";
  isHintShowed = false;
  animateCSS("#hint-cent", "fadeOutDownBig").then((message) => {
    $("#hint-cent").hide();
  });
}

var translated = false;

function setLang(lang) {
  let lang_str =
    '<script type="text/javascript" src="./locales/' + lang + '.js"></script>';
  $("head").append(lang_str);
  setTimeout(function () {
    translateUi();
    $.post(`https://${GetParentResourceName()}/uiTranslated`, JSON.stringify());
  }, 1000);
}

function setFontAwesome(url) {
  let str = `<script src="${url}" crossorigin="anonymous"></script>`;
  $("head").append(str);
}

function translateUi() {
  document.getElementById("garage-head-translation").innerHTML =
    translate["garage-head-translation"];
  document.getElementById("showroom-button").innerHTML =
    translate["enter_showroom"];
  document.getElementById("search-bar").placeholder =
    translate["search-bar-text"];
  translated = true;
}

function search() {
  let input = document.getElementById("search-bar").value.toLowerCase();
  input = input
    .replace(/[^A-Z0-9]+/gi, "")
    .replace(/  +/g, "+")
    .replace(/\s/g, "+");

  let all = document.getElementsByClassName("car");

  for (let i = 0; i < all.length; i++) {
    let plate = all[i].dataset.plate
      .toLowerCase()
      .replace(/[^A-Z0-9]+/gi, "")
      .replace(/  +/g, "+")
      .replace(/\s/g, "+");
    let label = all[i].dataset.label
      .toLowerCase()
      .replace(/[^A-Z0-9]+/gi, "")
      .replace(/  +/g, "+")
      .replace(/\s/g, "+");

    if (!plate.includes(input) && !label.includes(input)) {
      $(all[i]).fadeOut(100);
    } else {
      $(all[i]).fadeIn(100);
    }
  }
}

function enterShowroom() {
  hideGarage();
  $.post(
    `https://${GetParentResourceName()}/enterShowroom`,
    JSON.stringify({})
  );
}

function updateCarLabel(plate) {
  let sets = localStorage.getItem(plate);
  let newLabel = document.getElementById("input-" + plate).value;
  sets = JSON.parse(sets);
  oldLabel = sets.userlabel;
  sets.userlabel = newLabel;
  localStorage.setItem(plate, JSON.stringify(sets));

  let all = document.getElementsByClassName("car");

  for (let i = 0; i < all.length; i++) {
    if (all[i].dataset.label == oldLabel) {
      all[i].dataset.label = newLabel;
      break;
    }
  }
}
