# Atividade — Povoamento de Banco de dados com Seeders (Laravel)

Aplicação web **Laravel 12** (PHP 8.2) com MySQL/MariaDB, modelando uma **loja de produtos**,
com criação dos Seeders via Artisan, povoamento do banco, verificação da integridade
referencial e **exportação do dump completo em `.sql`**.

**Artefatos entregues:**

| Artefato | Caminho |
|---|---|
| Script SQL (estrutura + dados) | [`loja_laravel.sql`](loja_laravel.sql) |
| Documentação das etapas | [`README.md`](README.md) (este arquivo) |
| Seeders | `database/seeders/*.php` |
| Migrations | `database/migrations/*.php` |
| Models | `app/Models/*.php` |

---

## 1. Ambiente e configuração

Requisitos: PHP 8.2+, Composer, MySQL/MariaDB (XAMPP), Artisan (CLI do Laravel).

```bash
# criação do projeto
composer create-project laravel/laravel . --prefer-dist

# banco criado no MySQL
mysql -u root -e "CREATE DATABASE loja_laravel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
```

Configuração no arquivo `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=loja_laravel
DB_USERNAME=root
DB_PASSWORD=
```

### Modelo relacional

```
categorias (1) ──────< (N) produtos (1) ──────< (N) pedido_items (N) >────── (1) pedidos (N) >────── (1) clientes
```

| Tabela | Colunas principais | Relação |
|---|---|---|
| `categorias` | id, nome (unique), descricao | 1:N com `produtos` |
| `produtos` | id, categoria_id (FK), nome, sku (unique), preco, estoque | N:1 com `categorias` |
| `clientes` | id, nome, email (unique), cpf (unique), cidade | 1:N com `pedidos` |
| `pedidos` | id, cliente_id (FK), data_pedido, status (enum), total | N:1 com `clientes`, 1:N com `pedido_items` |
| `pedido_items` | id, pedido_id (FK), produto_id (FK), quantidade, preco_unitario, subtotal | N:1 com `pedidos` e `produtos` |

Chaves estrangeiras: `produtos.categoria_id → categorias.id`,
`pedidos.cliente_id → clientes.id`, `pedido_items.pedido_id → pedidos.id`,
`pedido_items.produto_id → produtos.id` (todas com `ON DELETE CASCADE`).

---

## Etapa 1 — Criação e configuração dos Seeders

### 1.1 Geração das classes via Artisan (CLI)

```bash
# Models + migrations
php artisan make:model Categoria -m
php artisan make:model Produto -m
php artisan make:model Cliente -m
php artisan make:model Pedido -m
php artisan make:model PedidoItem -m

# Seeders
php artisan make:seeder CategoriaSeeder
php artisan make:seeder ProdutoSeeder
php artisan make:seeder ClienteSeeder
php artisan make:seeder PedidoSeeder
php artisan make:seeder PedidoItemSeeder
```

Arquivos gerados:

```
database/seeders/
├── CategoriaSeeder.php      # 5 categorias
├── ProdutoSeeder.php        # 14 produtos
├── ClienteSeeder.php        # 8 clientes
├── PedidoSeeder.php         # 8 pedidos
├── PedidoItemSeeder.php     # 20 itens + atualização dos totais
└── DatabaseSeeder.php       # orquestra a chamada de todos acima
```

### 1.2 Lógica de inserção massiva no método `run()`

Todos os seeders usam **`DB::table(...)->insert([...])` com arrays de múltiplos registros**,
ou seja, cada tabela é povoada com **um único INSERT multi-linha** (inserção massiva),
respeitando a ordem das dependências definida no `DatabaseSeeder::run()`:

```php
// database/seeders/DatabaseSeeder.php
$this->call([
    CategoriaSeeder::class,   // 1º — alimenta categorias
    ProdutoSeeder::class,     // 2º — usa categorias (FK categoria_id)
    ClienteSeeder::class,     // 3º — alimenta clientes
    PedidoSeeder::class,      // 4º — usa clientes (FK cliente_id)
    PedidoItemSeeder::class,  // 5º — usa pedidos e produtos (FKs) e fecha os totais
]);
```

Exemplo de inserção massiva (`CategoriaSeeder`):

```php
public function run(): void
{
    $agora = now();

    DB::table('categorias')->insert([   // um único INSERT com 5 registros
        ['nome' => 'Eletrônicos',       'descricao' => 'Celulares, tablets e dispositivos eletrônicos', 'created_at' => $agora, 'updated_at' => $agora],
        ['nome' => 'Informática',       'descricao' => 'Computadores, notebooks e periféricos',         'created_at' => $agora, 'updated_at' => $agora],
        ['nome' => 'Áudio',             'descricao' => 'Fones, caixas de som e equipamentos de áudio',  'created_at' => $agora, 'updated_at' => $agora],
        ['nome' => 'Acessórios',        'descricao' => 'Capas, cabos, carregadores e demais acessórios','created_at' => $agora, 'updated_at' => $agora],
        ['nome' => 'Casa Inteligente',  'descricao' => 'Lâmpadas, tomadas e dispositivos domóticos',    'created_at' => $agora, 'updated_at' => $agora],
    ]);
}
```

Regras relacionais aplicadas nos seeders:

* **`ProdutoSeeder`** — resolve o `categoria_id` pelo *nome* da categoria
  (`DB::table('categorias')->pluck('id', 'nome')`), garantindo que nenhum produto fique órfão.
* **`PedidoSeeder`** — insere os pedidos apontando para `cliente_id` já existentes.
* **`PedidoItemSeeder`** — monta os itens combinando `pedido_id` + `produto_id`,
  copia o preço vigente do produto, calcula `subtotal = preco_unitario * quantidade`
  e, ao final, **atualiza `pedidos.total` com a soma dos subtotais** de cada pedido.

---

## Etapa 2 — Execução do povoamento (Seeding)

```bash
# do zero: migra tudo e popula em um único comando
php artisan migrate:fresh --seed --force

# (alternativas)
php artisan db:seed                          # apenas popula
php artisan db:seed --class=ProdutoSeeder    # apenas um seeder
php artisan migrate --seed                   # migra + popula
```

Saída do terminal:

```
INFO  Running migrations.
  0001_01_01_000000_create_users_table ................................ DONE
  2026_09_23_170239_create_categorias_table .......................... DONE
  2026_09_23_170239_create_clientes_table ........................... DONE
  2026_09_23_170239_create_produtos_table ........................... DONE
  2026_09_23_170240_create_pedidos_table ............................ DONE
  2026_09_23_170241_create_pedido_items_table ........................ DONE

INFO  Seeding database.
  Database\Seeders\CategoriaSeeder ......... 3 ms DONE
  Database\Seeders\ProdutoSeeder ........... 8 ms DONE
  Database\Seeders\ClienteSeeder ........... 2 ms DONE
  Database\Seeders\PedidoSeeder ............ 4 ms DONE
  Database\Seeders\PedidoItemSeeder ........ 26 ms DONE
```

### 2.1 Verificação da integridade (terminal, phpMyAdmin ou SGBD)

```sql
-- contagem de registros por tabela
SELECT COUNT(*) FROM categorias;      -- 5
SELECT COUNT(*) FROM produtos;        -- 14
SELECT COUNT(*) FROM clientes;        -- 8
SELECT COUNT(*) FROM pedidos;         -- 8
SELECT COUNT(*) FROM pedido_items;    -- 20

-- produtos por categoria (relação 1:N intacta)
SELECT c.nome, COUNT(p.id) produtos
FROM categorias c LEFT JOIN produtos p ON p.categoria_id = c.id
GROUP BY c.id ORDER BY c.id;

-- total do pedido deve ser igual à soma dos subtotais dos itens
SELECT p.id, p.total, ROUND(SUM(i.subtotal),2) soma
FROM pedidos p JOIN pedido_items i ON i.pedido_id = p.id
GROUP BY p.id;
-- => nenhuma linha divergente (todas com total = soma)

-- itens órfãos (FK quebrada) — deve retornar 0
SELECT COUNT(*) FROM pedido_items i
LEFT JOIN pedidos p ON p.id = i.pedido_id
LEFT JOIN produtos pr ON pr.id = i.produto_id
WHERE p.id IS NULL OR pr.id IS NULL;   -- 0
```

Resultados obtidos:

| Verificação | Resultado |
|---|---|
| Registros inseridos | 5 categorias, 14 produtos, 8 clientes, 8 pedidos, 20 itens |
| Produtos por categoria | Eletrônicos 3, Informática 4, Áudio 3, Acessórios 2, Casa Inteligente 2 |
| `pedidos.total` = soma dos subtotais | **OK nos 8 pedidos** |
| Itens órfãos (FK) | **0** |

---

## Etapa 3 — Exportação do banco de dados (Dump)

Com o banco povoado e validado, foi gerado o dump completo (estrutura + dados + FKs):

```bash
mysqldump -u root --databases loja_laravel --default-character-set=utf8mb4 \
          --skip-comments --add-drop-table --routines --triggers > loja_laravel.sql
```

> **Atenção no Windows:** execute o comando via `cmd` (ex.: `cmd /c "mysqldump ... > loja_laravel.sql"`).
> O operador `>` do PowerShell grava em UTF-16 e corrompe o arquivo para uso no MySQL/phpMyAdmin.

O arquivo gerado — **[`loja_laravel.sql`](loja_laravel.sql)** — contém:

* `CREATE DATABASE IF NOT EXISTS loja_laravel` + `USE loja_laravel` (auto-contido);
* `DROP TABLE IF EXISTS` + `CREATE TABLE` de todas as 14 tabelas (versão da estrutura);
* as `CONSTRAINT ... FOREIGN KEY` de todas as relações;
* os `INSERT INTO ... VALUES (...)` com todos os dados (5 + 14 + 8 + 8 + 20 registros + controle de migrações);
* registro do histórico da tabela `migrations` (versionamento do schema).

### 3.1 Restauração / importação do arquivo `.sql`

Pelo terminal:

```bash
mysql -u root --default-character-set=utf8mb4 < loja_laravel.sql
```

Ou pelo **phpMyAdmin** → aba *Importar* → selecione `loja_laravel.sql` → *Continuar*.

Teste de restauração realizado: banco `loja_laravel` **apagado e recriado apenas a partir do
arquivo `.sql`**, com contagens conferidas (5/14/8/8/20 em 14 tabelas) e nenhuma divergência
de totais — ou seja, o dump garante versionamento da estrutura e dos dados.

---

## Resumo dos comandos usados

```bash
composer create-project laravel/laravel . --prefer-dist
php artisan make:model Categoria -m            # ... e demais models
php artisan make:seeder CategoriaSeeder        # ... e demais seeders
php artisan migrate:fresh --seed --force       # migra + popula
mysqldump -u root --databases loja_laravel --default-character-set=utf8mb4 \
          --skip-comments --add-drop-table --routines --triggers > loja_laravel.sql
mysql -u root < loja_laravel.sql               # restauração
```
