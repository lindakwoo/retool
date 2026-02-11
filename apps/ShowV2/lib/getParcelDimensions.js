const FLAT_RATE_BOX_DIMENSIONS = new Map([
  ["USPS_FlatRateEnvelope", { "length": 12.5, "width": 9.5, "height": 0.75, "scale": "inches" }],
  ["USPS_FlatRateLegalEnvelope", { "length": 15, "width": 9.5, "height": 0.75, "scale": "inches" }],
  ["USPS_FlatRatePaddedEnvelope", { "length": 12.5, "width": 9.5, "height": 0.75, "scale": "inches" }],
  ["USPS_SmallFlatRateBox", { "length": 8.625, "width": 5.375, "height": 1.625, "scale": "inches" }],
  ["USPS_MediumFlatRateBox1", { "length": 11, "width": 8.5, "height": 5.5, "scale": "inches" }],
  ["USPS_MediumFlatRateBox2", { "length": 13.625, "width": 11.875, "height": 3.375, "scale": "inches" }],
  ["USPS_LargeFlatRateBox", { "length": 12, "width": 12.25, "height": 6, "scale": "inches" }],
]);

let dimensions = {};
let shipFlatRate = {{shipFlatRateToggle.value}};
let selectedFlatRateBoxType = {{selectFlatRateBoxType.value}};

if (shipFlatRate && FLAT_RATE_BOX_DIMENSIONS.has(selectedFlatRateBoxType)) {
  dimensions = FLAT_RATE_BOX_DIMENSIONS.get(selectedFlatRateBoxType);
} else if ({{originalParcel.value}}) {
  dimensions = {
    length: {{originalParcel.value.length}},
    width: {{originalParcel.value.width}},
    height: {{originalParcel.value.height}},
    scale: {{originalParcel.value.distance_unit}},
  };
}
return dimensions
