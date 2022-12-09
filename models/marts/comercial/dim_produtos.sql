with
    categorias as (
        select *
        from{{ ref('stg_erp__categorias') }}
    )

    , produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

    , fornecedores as (
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )  

    , uniao_tabelas as (
        select
            produtos.id_produto --todas as keys vem sempre no início
            , produtos.id_fornecedor
            , produtos.id_categoria		
            , produtos.nome_produto			
            , produtos.quantidade_por_produto		
            , produtos.preco_unitario -- no big query usa numeric ao inves de float para numero quebrado		
            , produtos.unidades_no_estoque
            , produtos.unidades_por_ordem
            , produtos.level_de_pedido			
            , categorias.nome_categoria				
            , categorias.descricao		
            , fornecedores.nome_do_fornecedor				
            , fornecedores.contato_do_fornecedor							
            , fornecedores.titulo_contato		
            , fornecedores.endereco		
            , fornecedores.cidade		
            , fornecedores.regiao		
            , fornecedores.cep		
            , fornecedores.pais		
            , fornecedores.telefone			
            , fornecedores.fax 
        from produtos
        left join categorias on produtos.id_categoria = categorias.id_categoria
        left join fornecedores on produtos.id_fornecedor = fornecedores.id_fornecedor
    )

    , transformacoes as (
        select
            row_number() over (order by id_produto) as sk_produto
            , *
        from uniao_tabelas    
    )

select *
from transformacoes