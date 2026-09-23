<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Orquestra a execução dos seeders na ordem correta,
     * respeitando as chaves estrangeiras (categorias -> produtos
     * -> clientes -> pedidos -> pedido_items).
     */
    public function run(): void
    {
        $this->call([
            CategoriaSeeder::class,
            ProdutoSeeder::class,
            ClienteSeeder::class,
            PedidoSeeder::class,
            PedidoItemSeeder::class,
        ]);
    }
}
