<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PedidoSeeder extends Seeder
{
    /**
     * Povoamento massivo da tabela `pedidos`.
     * Cada pedido referencia um `cliente_id` existente (relação N:1).
     * O `total` é preenchido pelo PedidoItemSeeder após a inserção dos itens.
     */
    public function run(): void
    {
        $agora = now();

        DB::table('pedidos')->insert([
            ['cliente_id' => 1, 'data_pedido' => '2026-08-05', 'status' => 'entregue',  'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 2, 'data_pedido' => '2026-08-12', 'status' => 'entregue',  'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 3, 'data_pedido' => '2026-08-20', 'status' => 'pago',      'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 4, 'data_pedido' => '2026-08-28', 'status' => 'enviado',   'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 5, 'data_pedido' => '2026-09-03', 'status' => 'pago',      'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 6, 'data_pedido' => '2026-09-10', 'status' => 'pendente',  'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 7, 'data_pedido' => '2026-09-15', 'status' => 'pendente',  'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
            ['cliente_id' => 8, 'data_pedido' => '2026-09-18', 'status' => 'cancelado', 'total' => 0, 'created_at' => $agora, 'updated_at' => $agora],
        ]);
    }
}
