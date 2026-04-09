const greetings = [
  "Hello, world!",
  "Welcome aboard.",
  "Fresh start, clean page.",
  "Vanilla web, polished feel."
];

const button = document.getElementById("hello-button");
const statusText = document.getElementById("status-text");

let index = 0;

button.addEventListener("click", () => {
  index = (index + 1) % greetings.length;
  statusText.textContent = greetings[index];
});
