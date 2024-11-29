SELECT 
  customerNumber,
  customerName,
  contactLastName,
  contactFirstName,
  phone,
  addressLine1,
  addressLine2,
  city,
  state,
  postalCode,
  country,
  salesRepEmployeeNumber,
  creditLimit,
  CONCAT(c.contactFirstName, ', ', c.contactLastName) AS customerFullName
FROM classicmodels.customers c