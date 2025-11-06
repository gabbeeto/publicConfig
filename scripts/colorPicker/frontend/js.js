let colorChanged = false

document.querySelector('button').addEventListener('click', setColor);
function setColor() {
  let colorValue = document.querySelector('input').value;
  colorChanged = true
  if (colorValue) {
    checked = document.querySelector("#raylib").checked;
    pywebview.api.setColor(colorValue, checked);
  }
}

document.addEventListener("keydown", (e) => {
  if ((e.key == "Escape" || e.key == "x" ||  e.key == "Enter" || e.key == "z") && colorChanged) {
  setColor()
  }
})
