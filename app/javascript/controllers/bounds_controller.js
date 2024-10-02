// app/javascript/controllers/bounds_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bound"]

  addBound() {
    const boundsList = document.getElementById("bounds-list")
    const index = boundsList.children.length
    const newBoundTemplate = `
      <div class="mb-4 border border-gray-300 p-4 rounded-lg">
        <label class="block font-semibold mb-2" for="character_sheet_bounds_attributes_${index}_name">Bound Name</label>
        <input class="border border-gray-300 rounded w-full p-2" type="text" name="character_sheet[bounds_attributes][${index}][name]" id="character_sheet_bounds_attributes_${index}_name">

        <label class="block font-semibold mb-2" for="character_sheet_bounds_attributes_${index}_description">Description</label>
        <textarea class="border border-gray-300 rounded w-full p-2" name="character_sheet[bounds_attributes][${index}][description]" id="character_sheet_bounds_attributes_${index}_description"></textarea>

        <label class="block font-semibold mb-2" for="character_sheet_bounds_attributes_${index}_score">Score</label>
        <input class="border border-gray-300 rounded w-full p-2" type="number" name="character_sheet[bounds_attributes][${index}][score]" id="character_sheet_bounds_attributes_${index}_score">

        <a href="#" class="text-red-500 hover:text-red-700 mt-2 block" data-action="click->bounds#removeBound">Remove</a>
      </div>
    `
    boundsList.insertAdjacentHTML("beforeend", newBoundTemplate)
  }

  removeBound(event) {
    event.target.closest('.mb-4').remove()
  }
}
