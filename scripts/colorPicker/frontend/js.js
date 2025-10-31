


document.querySelector('button').addEventListener('click', setColor);
function setColor() {
  let colorValue = document.querySelector('input').value;
  if (colorValue) {
    pywebview.api.setColor(colorValue);
  }
}

document.addEventListener("keydown", (e) => {
  if (e.key == "Escape" || e.key == "x" ||  e.key == "Enter" || e.key == "z") {
  setColor()
  }
})
