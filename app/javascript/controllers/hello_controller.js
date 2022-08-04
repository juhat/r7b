import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap";

export default class extends Controller {
  connect() {
    let toast = new bootstrap.Toast(this.element);
    toast.show();
  }
}
