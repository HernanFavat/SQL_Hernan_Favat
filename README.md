<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>

## Tematica 
El proyecto SQL_Coderhouse_projecto_HernanFavat crea una base de datos llamada **pipeline_management** con varias tablas y procedimientos almacenados para gestionar oportunidades de venta, usuarios y productos. 
Las tablas principales incluyen **dim_users** para almacenar información de los usuarios, **facts_account** para detalles de cuentas, **facts_opportunities** para oportunidades de venta y **facts_products** para productos relacionados con las oportunidades.

He creado vistas para dar resumen a las oportunidades, indicar los mejores reps de ventas, mostrar distribución de. valor de las cuentas, desglose del estado de las oportunidades y rendimiento del producto. 
También he establecido store procedure para actualizar el estado de oportunidades y obtener información sobre productos más vendidos por los reps de ventas y distribución de valor de cuenta.

Además, se configuran triggers para registrar oportunidades gestionadas por técnicos y para registrar logros de objetivos de ventas para representantes de ventas fuera de Estados Unidos e India.
El proyecto apunta a gestionar eficientemente las oportunidades de venta y el rendimiento de los equipos a cargo, proporcionando información valiosa para la toma de decisiones estratégicas.


## Business case 

El business case para este proyecto es mejorar la gestión y el rendimiento de las oportunidades de venta, así como proporcionar insights valiosos sobre el desempeño. 
Los conceptos principales del business case serían:

1. Mejora de la eficiencia operativa: Al tener una base de datos centralizada y bien estructurada, se simplifica el proceso de acceso a los datos para los decisions makers en venta. 
Los datos sobre clientes, oportunidades, productos y reps están disponibles en un solo lugar, lo que facilita el seguimiento a la hora de la toma de decisiones.

2. La identificación de oportunidades dentro de los resultados: Las vistas y los store procedure proporcionan insights valiosos sobre las tendencias de las ventas, los productos más vendidos, los territorios con mayor potencial, etc. 
Estos datos permiten a la empresa identificar oportunidades de crecimiento y tomar decisiones informadas para maximizar los ingresos.

3. Cumplimiento de objetivos y seguimiento del progreso: Los store procedure permiten automatizar tareas como la actualización del estado de las oportunidades en función de ciertos criterios, lo que garantiza que se cumplan los objetivos de ventas establecidos. 
Además, el seguimiento del progreso a través de registros detallados, como el estado de las opportunidades, los owners, etc, ayuda a identificar áreas de mejora y ajustar estrategias según sea necesario.

## Diagrama de entidad - Reverse Engineer

<center>
    <img src="https://ibb.co/L182Z1b"><img src="https://i.ibb.co/JHKMsH0/Screenshot-2024-05-19-194607.png" alt="Screenshot-2024-05-19-194607" border="0"></a>
</div>
</center>


## Listado de tablas y atributos (Ningun atributo corresponde a inforacion real de usuarios, es una lista de fake users)



                            DIM_CURRENCY 
    (PK)
| currency_code | currency_name      | currency_rate  | c__createddate |
|---------------|---------------------|---------------|----------------|
| USD           | United States Dollar| 1.00          | 2023-04-10     |
| INR           | Indian Rupee        | 0.014         | 2024-01-10     |
| JPY           | Japanese Yen        | 0.0093        | 2024-02-15     |
| KRW           | South Korean Won    | 0.00088       | 2024-03-20     |
| CNY           | Chinese Yuan        | 0.16          | 2024-04-25     |
| SGD           | Singapore Dollar    | 0.74          | 2024-05-30     |
| AUD           | Australian Dollar   | 0.77          | 2024-06-05     |
| NZD           | New Zealand Dollar  | 0.71          | 2024-07-10     |
| TWD           | New Taiwan Dollar   | 0.036         | 2024-08-15     |
| THB           | Thai Baht           | 0.032         | 2024-08-15     |
| PHP           | Philippine Peso     | 0.02          | 2024-07-15     |

                            DIM_USERS
   (PK)
| userid | u__email                     | first_name | last_name  | u__createddate | isactive | u__type    |
|--------|------------------------------|------------|------------|----------------|----------|------------|
| 1      | john@management.com          | John       | Doe        | 01/01/2023     | 1        | Reseller   |
| 2      | marta_gomez@management.com   | Marta      | Gomez      | 01/07/2023     | 1        | Sales Rep  |
| 3      | fer_rodriguez@management.com | Fernando   | Rodriguez  | 01/12/2023     | 1        | Technician |
| 4      | emma@management.com          | Emma       | Johnson    | 20/03/2023     | 1        | Reseller   |
| 5      | david_wong@management.com    | David      | Wong       | 25/04/2023     | 1        | Technician |
| 6      | laura_smith@management.com   | Laura      | Smith      | 30/05/2023     | 1        | Sales Rep  |
| 7      | alex@management.com          | Alex       | Martinez   | 05/06/2023     | 1        | Technician |
| 8      | jessica@management.com       | Jessica    | Brown      | 10/07/2023     | 1        | Reseller   |
| 9      | michael@management.com       | Michael    | Davis      | 15/08/2023     | 1        | Sales Rep  |
| 10     | sophia@management.com        | Sophia     | Wilson     | 20/09/2023     | 1        | Reseller   |
| 11     | adam@management.com          | Adam       | Anderson   | 25/10/2023     | 1        | Technician |
| 12     | olivia@management.com        | Olivia     | Taylor     | 30/11/2023     | 1        | Sales Rep  |
| 13     | william@management.com       | William    | Thomas     | 05/12/2023     | 1        | Reseller   |
| 14     | emily@management.com         | Emily      | Harris     | 10/01/2024     | 1        | Sales Rep  |
| 15     | james@management.com         | James      | Walker     | 15/02/2024     | 1        | Technician |
| 16     | ava@management.com           | Ava        | White      | 20/03/2024     | 1        | Reseller   |
| 17     | benjamin@management.com      | Benjamin   | Jackson    | 25/04/2024     | 1        | Sales Rep  |
| 18     | harper@management.com        | Harper     | Moore      | 30/05/2024     | 1        | Technician |
| 19     | emma@management.com          | Emma       | Martinez   | 05/06/2024     | 1        | Reseller   |
| 20     | logan@management.com         | Logan      | Lee        | 10/07/2024     | 1        | Sales Rep  |
| 21     | grace@management.com         | Grace      | Perez      | 15/08/2024     | 1        | Technician |
| 22     | noah@management.com          | Noah       | Gonzalez   | 20/09/2024     | 1        | Reseller   |
| 23     | chloe@management.com         | Chloe      | Rodriguez  | 25/10/2024     | 1        | Sales Rep  |

                        FACTS_ACCOUNT 	
    (PK)                                                            (fK)
| accountid | a__name          | a__number | a__country    | primary_contactid | a__createddate |
|-----------|------------------|-----------|---------------|-------------------|----------------|
| 1         | ABC Corporation  | ABC123    | United States | 1                 | 15/05/2021     |
| 2         | XYZ Enterprises  | XYZ456    | Canada        | 2                 | 20/06/2021     |
| 3         | 123 Industries   | 123789    | United Kingdom| 3                 | 25/07/2021     |
| 4         | 123 Industries   | 123789    | United Kingdom| 3                 | 25/07/2021     |
| 5         | PQR Solutions    | PQR123    | India         | 4                 | 15/11/2021     |
| 6         | LMN Tech         | LMN789    | Japan         | 5                 | 20/12/2021     |
| 7         | XYZ Innovations  | XYZ789    | South Korea   | 6                 | 25/01/2022     |
| 8         | ABC Tech         | ABC123    | China         | 7                 | 10/02/2022     |
| 9         | EFG Innovations  | EFG456    | Singapore     | 8                 | 15/03/2022     |
| 10        | GHI Solutions    | GHI789    | Australia     | 9                 | 20/04/2022     |
| 11        | JKL Tech         | JKL123    | New Zealand   | 10                | 25/05/2022     |
| 12        | MNO Innovations  | MNO456    | Taiwan        | 11                | 10/06/2022     |
| 13        | RST Solutions    | RST789    | Philippines   | 12                | 15/07/2022     |
| 14        | UVW Tech         | UVW123    | Thailand      | 13                | 20/08/2022     |
| 15        | QRS Innovations  | QRS456    | Malaysia      | 14                | 25/09/2022     |
| 16        | TUV Solutions    | TUV789    | Vietnam       | 15                | 10/10/2022     |
| 17        | WXY Tech         | WXY123    | Indonesia     | 16                | 15/11/2022     |
| 18        | ZAB Innovations  | ZAB456    | Myanmar       | 17                | 20/12/2022     |
| 19        | CDE Tech         | CDE789    | Cambodia      | 18                | 25/01/2023     |
| 20        | FGH Innovations  | FGH123    | Laos          | 19                | 10/02/2023     |
| 21        | IJK Solutions    | IJK456    | Bangladesh    | 20                | 15/03/2023     |
| 22        | LMN Tech         | LMN789    | Nepal         | 21                | 20/04/2023     |
| 23        | OPQ Innovations  | OPQ123    | Pakistan      | 22                | 25/05/2023     |

                        FACTS_OPPPORTUNITIES 	
    (PK)            (fK)        (fK)                                                                                                        (fK)
| opportunityid | accountid | ownerid | o__name                               | o__statusname | o__closeddate | End Date   | Project ID | Currency |
|---------------|-----------|---------|----------------------------------     |---------------|---------------|------------|------------|----------|
| 1             | 1         | 1       | Xaiomi and Dell products USA customer | Won           | 12/02/2024    | 10/04/2023 | 1          | USD      |
| 2             | 2         | 2       | Phillips and GM - special discount    | Won           | 12/02/2024    | 10/04/2023 | 2          | USD      |
| 3             | 3         | 3       | Fashion closthing different size      | Won           | 12/02/2024    | 10/04/2023 | 3          | USD      |
| 1             | 4         | 1       | Xaiomi and Dell products USA customer | Won           | 12/02/2024    | 10/04/2023 | 1          | USD      |
| 2             | 5         | 2       | Phillips and GM - special discount    | Won           | 12/02/2024    | 10/04/2023 | 2          | USD      |
| 3             | 6         | 3       | Fashion closthing different size      | Won           | 12/02/2024    | 10/04/2023 | 3          | USD      |
| 4             | 7         | 1       | Software Development Project          | Open          | 15/05/2025    | 10/01/2024 | 4          | INR      |
| 5             | 8         | 2       | Tech Consultation Service             | Won           | 15/05/2025    | 15/02/2024 | 5          | JPY      |
| 6             | 9         | 3       | Hardware Upgrade Contract             | Lost          | 15/05/2025    | 20/03/2024 | 6          | KRW      |
| 7             | 10        | 1       | Cloud Services Implementation         | Open          | 15/05/2025    | 25/04/2024 | 7          | CNY      |
| 8             | 11        | 2       | AI Integration Project                | Won           | 15/05/2025    | 30/05/2024 | 8          | SGD      |
| 9             | 12        | 3       | Digital Marketing Campaign            | Open          | 2024-09-05    | 05/06/2024 | 9          | AUD      |
| 10            | 13        | 1       | E-commerce Platform Development       | Lost          | 15/05/2025    | 10/07/2024 | 10         | NZD      |
| 11            | 14        | 2       | IoT Solutions Implementation          | Open          | 15/05/2025    | 15/08/2024 | 11         | TWD      |
| 12            | 15        | 3       | Network Infrastructure Upgrade        | Won           | 15/05/2025    | 15/08/2024 | 12         | THB      |
| 13            | 16        | 1       | Mobile App Development                | Open          | 2025-02-12    | 15/07/2024 | 13         | PHP      |
| 14            | 17        | 2       | Web Development Project               | Open          | 2024-10-15    | 15/03/2024 | 14         | SGD      |
| 15            | 18        | 3       | Database Optimization                 | Open          | 2024-12-15    | 15/08/2024 | 15         | AUD      |
                        
                       FACTS_PRODUCTS
     (PK)                                                                                    (fK)            (fK)
| productid | product__code | product__name          | product__type    | product__price | opportunityid | Currency Code |
|-----------|---------------|------------------------|------------------|----------------|---------------|---------------|
| 1         | P1234         | Xaiomi phone L2        | Electronics      | 899.99         | 1             | USD           |
| 2         | P343536       | Tablet Apple           | Electronics      | 699.99         | 1             | USD           |
| 3         | P737475       | Rice Cooker Zojirushi  | Home Appliances  | 129.99         | 2             | EUR           |
| 1         | P404142       | Adidas Sneakers        | Footwear         | 129.99         | 3             | GBP           |
| 2         | P91011        | Sara Jeans             | Clothing XXL     | 49.99          | 3             | GBP           |
| 3         | P495051       | Puma Joggers           | Clothing M       | 39.99          | 6             | CNY           |
| 4         | P13234        | Computer Dell          | Electronics      | 750            | 4             | JPY           |
| 5         | P434445       | Smart TV Sony          | Electronics      | 1499.99        | 4             | JPY           |
| 6         | P464748       | Microwave Panasonic    | Home Appliances  | 149.99         | 5             | INR           |
| 7         | P4378         | Blender Phillips       | Home Appliances  | 5000           | 5             | INR           |
| 8         | P94511        | Desigual Sweater       | Clothing XXS     | 1500           | 6             | CNY           |
| 9         | P495051       | Puma Joggers           | Clothing M       | 39.99          | 6             | CNY           |
| 10        | P162738       | Smartwatch Y3          | Electronics      | 349.99         | 7             | AUD           |
| 11        | P525354       | Digital Camera Canon   | Electronics      | 599.99         | 7             | AUD           |
| 12        | P192021       | Refrigerator Samsung   | Home Appliances  | 899.99         | 8             | NZD           |
| 13        | P555657       | Air Fryer Philips      | Home Appliances  | 249.99         | 8             | NZD           |
| 14        | P222324       | Levi Jeans             | Clothing XL      | 59.99          | 9             | TWD           |
| 15        | P585960       | Leather Jacket         | Clothing S       | 119.99         | 9             | TWD           |
| 16        | P252627       | Laptop HP              | Electronics      | 899.99         | 10            | THB           |
| 17        | P616263       | Bluetooth Speaker JBL  | Electronics      | 199.99         | 10            | THB           |
| 18        | P282930       | Toaster KitchenAid     | Home Appliances  | 13500          | 11            | SGD           |
| 19        | P646566       | Vacuum Cleaner Dyson   | Home Appliances  | 399.99         | 11            | SGD           |
| 20        | P313233       | Nike Hoodie            | Clothing L       | 79.99          | 12            | PHP           |
| 21        | P676869       | Summer Dress           | Clothing XS      | 29.99          | 13            | PHP           |
| 22        | P707172       | Wireless Headphones Sony | Electronics    | 299.99         | 15            | USD           |
| 23        | P5678         | Fridge GM              | Home Appliances  | 399.5          | 15            | EUR           |
| 24        | P737475       | Rice Cooker Zojirushi  | Home Appliances  | 129.99         | 14            | EUR           |