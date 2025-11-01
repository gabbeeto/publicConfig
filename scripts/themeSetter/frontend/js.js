// let colorChanged = false

document.querySelector('button').addEventListener('click', setColor);
function setColor() {
  let colorValue = document.querySelector('input').value;
  colorChanged = true
  if (colorValue) {
    pywebview.api.setColor(colorValue);
  }
}

