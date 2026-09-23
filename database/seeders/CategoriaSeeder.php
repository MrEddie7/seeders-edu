<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriaSeeder extends Seeder
{
    /**
     * Povoamento massivo da tabela `categorias`.
     * Todos os registros são inseridos em uma única query (insert múltiplo).
     */
    public function run(): void
    {
        $agora = now();

        DB::table('categorias')->insert([
            [
                'nome'       => 'Eletrônicos',
                'descricao'  => 'Celulares, tablets e dispositivos eletrônicos',
                'created_at' => $agora,
                'updated_at' => $agora,
            ],
            [
                'nome'       => 'Informática',
                'descricao'  => 'Computadores, notebooks e periféricos',
                'created_at' => $agora,
                'updated_at' => $agora,
            ],
            [
                'nome'       => 'Áudio',
                'descricao'  => 'Fones, caixas de som e equipamentos de áudio',
                'created_at' => $agora,
                'updated_at' => $agora,
            ],
            [
                'nome'       => 'Acessórios',
                'descricao'  => 'Capas, cabos, carregadores e demais acessórios',
                'created_at' => $agora,
                'updated_at' => $agora,
            ],
            [
                'nome'       => 'Casa Inteligente',
                'descricao'  => 'Lâmpadas, tomadas e dispositivos domóticos',
                'created_at' => $agora,
                'updated_at' => $agora,
            ],
        ]);
    }
}
