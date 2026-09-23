<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Cliente extends Model
{
    protected $fillable = ['nome', 'email', 'cpf', 'cidade'];

    /** Um cliente realiza muitos pedidos (1:N). */
    public function pedidos(): HasMany
    {
        return $this->hasMany(Pedido::class);
    }
}
