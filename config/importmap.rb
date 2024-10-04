# Pin npm packages by running ./bin/importmap

pin "application", to: "application.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "trix"
pin "lodash/debounce", to: "https://cdn.jsdelivr.net/npm/lodash-es@4.17.21/debounce.js"
pin "@rails/actiontext", to: "actiontext.js"
pin "@rails/actioncable", to: "actioncable.esm.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/channels", under: "channels"
