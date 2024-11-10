# GTM Template: Number of Items in dataLayer

This Google Tag Manager (GTM) template returns the number of items (e.g., products) found in an e-commerce dataLayer. This variable is particularly useful when you want to send the number of items tied to an event (e.g., a purchase) to an ad platform, such as Facebook. For instance, Facebook benefits from receiving the `num_items` parameter to optimize ad performance.

The variable calculates the total of the `quantity` key in the `ecommerce.items` array within the dataLayer. If `quantity` is not present, it will count the number of objects in the array instead.

## How to Use

1. **Upload the Template**: Upload this GTM template to your GTM container.
2. **Create a Variable**: Create a variable using this GTM template.
3. **Specify Your Array (if needed)**: If you’re not using the `ecommerce.items` array (e.g., you’re using `eventModel.items`), specify the variable that contains the quantity for your products.
4. **Add to Tags**: Include the variable in the tags where you want to send the number of items. _(Please ensure you follow the platform’s documentation to make sure this data is processed correctly.)_

## Creator

The Tag template was created by [Jorg van de Ven](https://www.linkedin.com/in/jorgvandeven/)

