import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };
  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      center: [139.692526, 35.68882],
      zoom: 12,
    });

    this.#addMarkersToMaps();
    this.#fitMaoToMarkers();

    // add geocoder
    this.map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );
  }

  #addMarkersToMaps() {
    // Iterate over the markers array
    // add it to the map

    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.markerHtml;
      const popup = new mapboxgl.Popup().setHTML(marker.popupHtml);
      new mapboxgl.Marker(customMarker)
        .setLngLat(marker)
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMaoToMarkers() {
    // Go through all the marker coordinates
    const bounds = new mapboxgl.LngLatBounds();
    // Extend the bounds for each
    this.markersValue.forEach((marker) => {
      bounds.extend(marker);
    });
    // Set the final bound
    this.map.fitBounds(bounds, {
      padding: 24,
    });
  }
}
