// app/javascript/details_remember.js

function rememberIfDetailsWasDisclosed(detailsId) {
  var localStorageKey = "detailsWasDisclosed_" + detailsId;

  var details = document.getElementById(detailsId);

  if (!details) return;  // Ensure the element exists

  // Listen to the toggle event, which fires whenever the <details> is opened or closed.
  details.addEventListener("toggle", event => {
    if (details.open) {
      localStorage.setItem(localStorageKey, true);
    } else {
      localStorage.removeItem(localStorageKey);
    }
  });

  // If the stored value tells us the <details> was open the last time we opened the page, re-open it now.
  if (localStorage.getItem(localStorageKey)) {
    details.open = true;
  }
}

// Automatically apply to all <details> elements with IDs
document.addEventListener("turbo:load", function() {
  document.querySelectorAll("details[id]").forEach((detailsElement) => {
    rememberIfDetailsWasDisclosed(detailsElement.id);
  });
});
