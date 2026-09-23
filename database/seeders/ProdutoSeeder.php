<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProdutoSeeder extends Seeder
{
    /**
     * Povoamento massivo da tabela `produtos`.
     * O `categoria_id` é resolvido pelo nome da categoria para garantir
     * a integridade referencial da relação N:1 produtos -> categorias.
     */
    public function run(): void
    {
        $idsCategorias = DB::table('categorias')->pluck('id', 'nome');

        $agora = now();

        DB::table('produtos')->insert([
            //Categoria: Eletrônicos (id 1)
            ['categoria_id' => $idsCategorias['Eletrônicos'], 'nome' => 'Smartphone Galaxy A55 5G 256GB',      'sku' => 'ELE-001', 'preco' => 2199.90, 'estoque' => 35, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Eletrônicos'], 'nome' => 'Tablet Lenovo Tab M10 64GB',          'sku' => 'ELE-002', 'preco' => 1099.00, 'estoque' => 22, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Eletrônicos'], 'nome' => 'Smartwatch Amazfit GTS 4',            'sku' => 'ELE-003', 'preco' => 749.90,  'estoque' => 40, 'created_at' => $agora, 'updated_at' => $agora],

            //Categoria: Informática (id 2)
            ['categoria_id' => $idsCategorias['Informática'], 'nome' => 'Notebook Dell Inspiron 15 i5 512GB',   'sku' => 'INF-001', 'preco' => 3899.00, 'estoque' => 15, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Informática'], 'nome' => 'Mouse Logitech M170 Sem Fio',          'sku' => 'INF-002', 'preco' => 89.90,   'estoque' => 120, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Informática'], 'nome' => 'Teclado Mecânico Redragon Kumara',     'sku' => 'INF-003', 'preco' => 199.90,  'estoque' => 60, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Informática'], 'nome' => 'Monitor LG 24" Full HD IPS',           'sku' => 'INF-004', 'preco' => 799.00,  'estoque' => 30, 'created_at' => $agora, 'updated_at' => $agora],

            //Categoria: Áudio (id 3)
            ['categoria_id' => $idsCategorias['Áudio'], 'nome' => 'Fone Bluetooth JBL Tune 520BT',               'sku' => 'AUD-001', 'preco' => 299.90,  'estoque' => 80, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Áudio'], 'nome' => 'Caixa de Som JBL Go 3 Portátil',             'sku' => 'AUD-002', 'preco' => 249.00,  'estoque' => 55, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Áudio'], 'nome' => 'Headset Gamer HyperX Cloud Stinger',        'sku' => 'AUD-003', 'preco' => 349.90,  'estoque' => 45, 'created_at' => $agora, 'updated_at' => $agora],

            //Categoria: Acessórios (id 4)
            ['categoria_id' => $idsCategorias['Acessórios'], 'nome' => 'Capa de Silicone para iPhone 15',        'sku' => 'ACE-001', 'preco' => 59.90,   'estoque' => 200, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Acessórios'], 'nome' => 'Cabo USB-C 100W Braçado 2m',             'sku' => 'ACE-002', 'preco' => 49.90,   'estoque' => 150, 'created_at' => $agora, 'updated_at' => $agora],

            //Categoria: Casa Inteligente (id 5)
            ['categoria_id' => $idsCategorias['Casa Inteligente'], 'nome' => 'Lâmpada Inteligente Wi-Fi 9W',     'sku' => 'CAS-001', 'preco' => 79.90,   'estoque' => 90, 'created_at' => $agora, 'updated_at' => $agora],
            ['categoria_id' => $idsCategorias['Casa Inteligente'], 'nome' => 'Tomada Inteligente Wi-Fi 16A',     'sku' => 'CAS-002', 'preco' => 99.90,   'estoque' => 70, 'created_at' => $agora, 'updated_at' => $agora],
        ]);
    }
}
