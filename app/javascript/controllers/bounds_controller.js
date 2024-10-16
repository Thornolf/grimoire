// app/javascript/controllers/bounds_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bound"]

  addBound() {
    const boundsList = document.getElementById("bounds-list")
    const index = boundsList.children.length
    const newBoundTemplate = `
      <div class="mb-4 border border-gray-300 p-4 rounded-lg flex items-center space-x-4">
        <div class="w-1/3">
          <label class="block font-semibold mb-2" for="character_sheet_bounds_attributes_${index}_name">Bound Name</label>
          <input class="border border-gray-300 rounded w-full p-2" type="text" name="character_sheet[bounds_attributes][${index}][name]" id="character_sheet_bounds_attributes_${index}_name">
        </div>

        <div class="w-1/3">
          <label class="block font-semibold mb-2" for="character_sheet_bounds_attributes_${index}_score">Score</label>
          <input class="border border-gray-300 rounded w-full p-2" type="number" name="character_sheet[bounds_attributes][${index}][score]" id="character_sheet_bounds_attributes_${index}_score" min="0">
        </div>

        <div class="w-auto">
          <a href="javascript:void(0)" class="text-red-500 hover:text-red-700 mt-2 block" data-action="click->bounds#removeBound">Remove</a>
          <input type="hidden" name="character_sheet[bounds_attributes][${index}][_destroy]" value="false" data-bounds-target="removeField">
        </div>
      </div>
    `
    boundsList.insertAdjacentHTML("beforeend", newBoundTemplate)
  }

  removeBound(event) {
    event.preventDefault() // Prevent the link from navigating

    const boundElement = event.target.closest('.mb-4')
    const removeField = boundElement.querySelector('input[name*="_destroy"]')

    // If the _destroy field exists, set its value to 'true'
    if (removeField) {
      removeField.value = 'true'
    }

    // Optionally hide the bound visually
    boundElement.style.display = 'none'
  }
}
