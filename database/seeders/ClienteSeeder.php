<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ClienteSeeder extends Seeder
{
    /**
     * Povoamento massivo da tabela `clientes`.
     * Um único insert com 8 registros.
     */
    public function run(): void
    {
        $agora = now();

        DB::table('clientes')->insert([
            ['nome' => 'Mariana Souza Silva',  'email' => 'mariana.souza@email.com',  'cpf' => '123.456.789-01', 'cidade' => 'São Paulo',      'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Rafael Oliveira Lima', 'email' => 'rafael.oliveira@email.com','cpf' => '234.567.890-12', 'cidade' => 'Rio de Janeiro', 'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Camila Pereira Costa', 'email' => 'camila.costa@email.com',   'cpf' => '345.678.901-23', 'cidade' => 'Belo Horizonte', 'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Lucas Martins Rocha',  'email' => 'lucas.martins@email.com',  'cpf' => '456.789.012-34', 'cidade' => 'Curitiba',       'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Juliana Alves Souza',  'email' => 'juliana.alves@email.com',  'cpf' => '567.890.123-45', 'cidade' => 'Porto Alegre',   'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Pedro Henrique Ramos', 'email' => 'pedro.ramos@email.com',    'cpf' => '678.901.234-56', 'cidade' => 'Salvador',       'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Ana Beatriz Ferreira', 'email' => 'ana.ferreira@email.com',   'cpf' => '789.012.345-67', 'cidade' => 'Fortaleza',      'created_at' => $agora, 'updated_at' => $agora],
            ['nome' => 'Gabriel Santos Pinto', 'email' => 'gabriel.santos@email.com', 'cpf' => '890.123.456-78', 'cidade' => 'Recife',         'created_at' => $agora, 'updated_at' => $agora],
        ]);
    }
}
