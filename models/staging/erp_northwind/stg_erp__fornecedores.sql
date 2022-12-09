with
    source_suppliers as (
        select
            cast (supplier_id as int) as id_fornecedor		
            , cast(company_name as string) as nome_do_fornecedor				
            , cast(contact_name as string) as contato_do_fornecedor							
            , cast(contact_title as string) as  titulo_contato		
            , cast(address as string) as endereco		
            , cast(city as string) as cidade		
            , cast(region as string) as regiao		
            , cast(postal_code as string) as cep		
            , cast(country as string) as pais		
            , cast(phone as string) as telefone			
            , cast(fax as string) as fax 			
            , --cast(homepage as string) as site			
        from{{ source('erp', 'suppliers')}}
    )
select *
from source_suppliers      