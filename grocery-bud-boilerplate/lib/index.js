import { Application, Controller } from "@hotwired/stimulus";
import ListController from "./controllers/list_controller.js";

window.Stimulus = Application.start();

Stimulus.register("list", ListController);
