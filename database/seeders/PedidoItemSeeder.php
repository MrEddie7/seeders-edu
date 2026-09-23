<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PedidoItemSeeder extends Seeder
{
    /**
     * Povoamento massivo da tabela `pedido_items` (itens dos pedidos).
     *
     * Regras relacionais aplicadas:
     *  - pedido_id  referencia pedidos.id  (N:1)
     *  - produto_id referencia produtos.id (N:1)
     *  - preco_unitario copia o preço vigente do produto
     *  - subtotal = preco_unitario * quantidade
     *
     * Ao final, o total de cada pedido (`pedidos.total`) é atualizado
     * com a soma dos subtotais dos seus itens.
     */
    public function run(): void
    {
        $agora = now();

        //preço vigente de cada produto (id => preco)
        $precos = DB::table('produtos')->pluck('preco', 'id');

        //composição dos pedidos (pedido_id => [produto_id, quantidade])
        $composicao = [
            1 => [[1, 1], [11, 2], [12, 1]],   // Galaxy A55 + 2 capas + 1 cabo
            2 => [[4, 1], [5, 1], [6, 1]],     // Notebook + mouse + teclado
            3 => [[8, 2], [9, 1]],             // 2 fones JBL + caixa JBL
            4 => [[7, 1], [5, 2]],             // Monitor + 2 mouses
            5 => [[3, 1], [8, 1], [11, 1]],    // Smartwatch + fone + capa
            6 => [[13, 4], [14, 2]],           // 4 lâmpadas + 2 tomadas
            7 => [[2, 1], [10, 1], [12, 2]],   // Tablet + headset + 2 cabos
            8 => [[1, 1], [4, 1]],             // pedido cancelado (mantido para histórico)
        ];

        $itens = [];
        $totais = [];

        foreach ($composicao as $pedidoId => $produtos) {
            $totalPedido = 0;

            foreach ($produtos as [$produtoId, $quantidade]) {
                $precoUnitario = (float) $precos[$produtoId];
                $subtotal = round($precoUnitario * $quantidade, 2);
                $totalPedido += $subtotal;

                $itens[] = [
                    'pedido_id'      => $pedidoId,
                    'produto_id'     => $produtoId,
                    'quantidade'     => $quantidade,
                    'preco_unitario' => $precoUnitario,
                    'subtotal'       => $subtotal,
                    'created_at'     => $agora,
                    'updated_at'     => $agora,
                ];
            }

            $totais[$pedidoId] = round($totalPedido, 2);
        }

        //inserção massiva de todos os itens em uma única query
        DB::table('pedido_items')->insert($itens);

        //atualização do total de cada pedido (regra de integridade)
        foreach ($totais as $pedidoId => $total) {
            DB::table('pedidos')->where('id', $pedidoId)->update(['total' => $total]);
        }
    }
}
