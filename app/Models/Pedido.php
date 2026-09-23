<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Pedido extends Model
{
    protected $fillable = ['cliente_id', 'data_pedido', 'status', 'total'];

    protected $casts = [
        'data_pedido' => 'date',
        'total' => 'decimal:2',
    ];

    /** O pedido pertence a um cliente (N:1). */
    public function cliente(): BelongsTo
    {
        return $this->belongsTo(Cliente::class);
    }

    /** Um pedido possui muitos itens (1:N). */
    public function itens(): HasMany
    {
        return $this->hasMany(PedidoItem::class);
    }
}
