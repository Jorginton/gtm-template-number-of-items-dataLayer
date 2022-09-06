___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT"
  ],
  "version": 1,
  "securityGroups": [],
  "displayName": "Return number of e-commerce products",
  "description": "Returns the number products shown on a page by reading the EEC/GA4 Items array.",
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

let item_id = ecommerceArray.map(obj => {if (obj.id) {return obj.id;} else {return obj.item_id;}});

return ecommerceArray ? item_id.length : 0;


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


