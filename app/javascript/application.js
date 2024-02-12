window.jQuery = $;
window.$ = $;

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import * as ActiveStorage from "@rails/activestorage"
import "./channels"
import "./controllers"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import 'jquery'
import * as bootstrap from "bootstrap"
import './flash'