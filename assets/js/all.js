document.addEventListener(
  "DOMContentLoaded",
  function () {
    particleground(document.getElementById("background"), {
      curvedLines: false,
      density: 8000,
      parallaxMultiplier: 20,
      lineWidth: 1.5,
      dotColor: "rgb(232, 57, 81,0.8)",
      lineColor: "rgb(168, 218, 220,0.8)",
    });
  },
  false
);

const carouselText = [
  { text: "fun." },
  { text: "hard." },
  { text: "happiness." },
  { text: "future." },
  { text: "LIFE." },
];

$(document).ready(async function () {
  carousel(carouselText, "#feature-text");
});

async function typeSentence(sentence, eleRef, delay = 100) {
  const letters = sentence.split("");
  let i = 0;
  while (i < letters.length) {
    await waitForMs(delay);
    $(eleRef).append(letters[i]);
    i++;
  }
  return;
}

async function deleteSentence(eleRef) {
  const sentence = $(eleRef).html();
  const letters = sentence.split("");
  let i = 0;
  while (letters.length > 0) {
    await waitForMs(100);
    letters.pop();
    $(eleRef).html(letters.join(""));
  }
}

async function carousel(carouselList, eleRef) {
  var i = 0;
  while (true) {
    await typeSentence(carouselList[i].text, eleRef);
    await waitForMs(1500);
    await deleteSentence(eleRef);
    await waitForMs(500);
    i++;
    if (i >= carouselList.length) {
      i = 0;
    }
  }
}

function waitForMs(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

//test zone
