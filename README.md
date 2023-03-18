# Oracle Sales Data Example Pandas

In data warehousing, there are two main types of tables: dimension tables and fact tables. This is a simple example of a facts and dimension tables in an Oracle Datawarehouse. 

A dimension table typically contains descriptive information about the entities in the data model. In this case, the products table is a dimension table as it contains information about the products that are sold in the store. Each row in the products table represents a unique product and contains attributes such as the product name, category, and brand.

A fact table, on the other hand, contains the measures or numerical data associated with a particular event or transaction. In this case, the sales table is a fact table as it contains information about each sale transaction. Each row in the sales table represents a unique sale and contains measures such as the quantity sold, price per unit, and the total revenue for that transaction.

In data warehousing, these two types of tables are typically joined together using a common key, known as a surrogate key, to create a star schema. The surrogate key acts as a link between the fact table and the dimension table, allowing analysts to easily slice and dice the data by various dimensions.

In our example, the PRODUCT_ID column serves as the surrogate key that links the sales fact table with the products dimension table. This allows us to analyze sales data by various dimensions such as product name, category, and brand.
