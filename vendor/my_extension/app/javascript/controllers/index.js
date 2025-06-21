import { Application } from "@hotwired/stimulus"

const application = Application.start()

import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
