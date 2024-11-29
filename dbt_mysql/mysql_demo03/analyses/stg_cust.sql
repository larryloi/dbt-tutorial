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
  CONCAT(contactFirstName, ', ', contactLastName) AS customerFullName
FROM {{ source('src','cust') }}