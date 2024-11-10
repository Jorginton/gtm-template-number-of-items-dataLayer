___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Return number of items | Ventastic Solutions",
  "description": "Returns the number products shown on a page by reading the EEC/GA4 Items array. \n\nMade by Jorg van de Ven | Ventastic Solutions.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "mapValues",
    "displayName": "Select data source",
    "radioItems": [
      {
        "value": "auto",
        "displayValue": "Automatically read from dataLayer"
      },
      {
        "value": "select",
        "displayValue": "Select e-commerce variable",
        "help": "Select a variable that contains the products or items array (e.g. ecommerce.detail.products or ecommerce.items)",
        "subParams": [
          {
            "type": "SELECT",
            "name": "manual",
            "displayName": "",
            "macrosInSelect": true,
            "selectItems": [],
            "simpleValueType": true
          }
        ]
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "GROUP",
    "name": "CreatorGroup",
    "displayName": "Creator",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "Creator",
        "displayName": "Made by \u003cstrong\u003e\u003ca href\u003d\"https://www.linkedin.com/in/jorgvandeven/\"\u003eJorg van de Ven\u003c/a\u003e\u003c/strong\u003e | \u003cstrong\u003e\u003ca href\u003d\"https://www.jorgvandeven.nl/ventastic-solutions?utm_source\u003dgoogle\u0026utm_medium\u003dgtm\u0026utm_campaign\u003dgtm_template_return_number_of_items\"\u003eVentastic Solutions\u003c/a\u003e\u003c/strong\u003e"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromDataLayer = require('copyFromDataLayer');
let ecommerce;

const selected = data.mapValues;

if (selected === 'auto') {
  ecommerce = copyFromDataLayer('ecommerce', 1) || {};
} else {
  ecommerce = data.manual;
}

let events = ecommerce.impressions || ecommerce.productClick|| ecommerce.detail || ecommerce.add || ecommerce.remove || ecommerce.checkout || ecommerce.purchase || {};

let ecommerceArray = ecommerce.items || events.products || events || [];

let quantityArray = ecommerceArray.map(obj => obj.quantity);

let idArray = ecommerceArray.map(obj => {if (obj.id) {return obj.id;} else {return obj.item_id;}});
let idQuantity = quantityArray.some(e => e === undefined) ? idArray.length : 0;

const baseValue = 0;
const sumQuantity = quantityArray.reduce(
  (previousValue, currentValue) => previousValue + currentValue,
  baseValue
);

return sumQuantity ? sumQuantity : idQuantity;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 26-8-2022 15:44:10


