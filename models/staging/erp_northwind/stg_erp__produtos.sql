with
    source_products as (
        select
            cast(product_id as int) as id_produto --todas as keys vem sempre no início
            , cast (supplier_id as int) as id_fornecedor
            , cast (category_id	as int) as id_categoria		
            , cast (product_name as string) as nome_produto			
            , cast (quantity_per_unit as string) as quantidade_por_produto		
            , cast (unit_price as numeric) as preco_unitario -- no big query usa numeric ao inves de float para numero quebrado		
            , cast (units_in_stock as int) as unidades_no_estoque
            , cast (units_on_order as int) as unidades_por_ordem
            , cast (reorder_level as int) as level_de_pedido
            , case 
                when discontinued = 1 then true
                else false
            end as is_discontinuado

        from{{ source('erp', 'products')}}
    )
select *
from source_products      