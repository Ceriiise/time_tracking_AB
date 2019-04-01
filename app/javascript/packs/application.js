import "bootstrap";
import "../plugins/flatpickr"


const button = document.querySelector('#delete');
button.addEventListener('click', (event) => {
  event.currentTarget.setAttribute("slide-out-left", "");
});
