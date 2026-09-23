<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PedidoItem extends Model
{
    protected $table = 'pedido_items';

    protected $fillable = ['pedido_id', 'produto_id', 'quantidade', 'preco_unitario', 'subtotal'];

    protected $casts = [
        'quantidade' => 'integer',
        'preco_unitario' => 'decimal:2',
        'subtotal' => 'decimal:2',
    ];

    /** O item pertence a um pedido (N:1). */
    public function pedido(): BelongsTo
    {
        return $this->belongsTo(Pedido::class);
    }

    /** O item pertence a um produto (N:1). */
    public function produto(): BelongsTo
    {
        return $this->belongsTo(Produto::class);
    }
}
